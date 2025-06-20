require("nvchad.configs.lspconfig").defaults()
local nvlsp = require "nvchad.configs.lspconfig"
local tb = require "telescope.builtin"
local on_attach = nvlsp.on_attach

local function toggle_diag_loclist()
  local windows = vim.api.nvim_list_wins()
  local loclist_open = false

  for _, win in ipairs(windows) do
    if vim.fn.getwininfo(win)[1].loclist == 1 then
      loclist_open = true
      break
    end
  end

  if loclist_open then
    vim.cmd.lclose()
  else
    vim.diagnostic.setloclist()
  end
end

local function my_attach(client, bufnr)
  on_attach(client, bufnr)

  -- Disable LSP formatting for ts_ls
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  -- Unbind LSP default keymaps for 'grr', 'grn', 'gra', 'gri'
  vim.keymap.del("n", "grr")
  vim.keymap.del("n", "grn")
  vim.keymap.del("n", "gri")
  vim.keymap.del("n", "gra")
  vim.keymap.del("v", "gra")

  -- My preferred mapping

  -- Diagnostics and code actions with <leader>
  -- vim.keymap.set("n", "<leader>d", toggle_diag_loclist, { desc = "Toggle LSP Diagnostic Loclist" })
  vim.keymap.set("n", "<leader>d", tb.diagnostics, { desc = "Telescope Diagnostics" })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP Code Action" })
  vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP Code Action" })
  vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP Code Action" })
  -- Hover documentation (like K in vanilla Vim)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "LSP Go to Declaration" })
  vim.keymap.set("n", "gd", tb.lsp_definitions, { desc = "Goto Definition" })
  vim.keymap.set("n", "gi", tb.lsp_implementations, { desc = "Goto Implementation" })
  vim.keymap.set("n", "gr", tb.lsp_references, { desc = "Goto References" })
  vim.keymap.set("n", "gy", tb.lsp_type_definitions, { desc = "Goto Type Definition" })
  vim.keymap.set("n", "<leader>ss", tb.lsp_document_symbols, { desc = "Document Symbols" })
  vim.keymap.set("n", "<leader>sS", tb.lsp_workspace_symbols, { desc = "Workspace Symbols" })

  -- Signature help (function argument hints)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "LSP Signature Help" })
  -- Rename symbol
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP Rename" })
  -- Format buffer
  vim.keymap.set("n", "<leader>fm", function()
    vim.lsp.buf.format { async = true }
  end, { buffer = bufnr, desc = "LSP Format" })
  -- Next/previous diagnostic
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next Diagnostic" })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Prev Diagnostic" })

  -- Open diagnostics in a floating window
  vim.keymap.set("n", "<leader>e", function()
    tb.diagnostics { bufnr = 0 }
  end, { desc = "Telescope Diagnostics (Buffer)" })
end

-- Global
vim.lsp.config("*", {
  capabilities = nvlsp.capabilities,
  on_attach = my_attach,
  root_markers = { ".git" },
})

-- Lua
vim.lsp.config.lua_ls = {
  capabilities = nvlsp.capabilities,
  on_attach = my_attach,
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  single_file_support = true,
  log_level = 2,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
vim.lsp.enable "lua_ls"

-- TypeScript
vim.lsp.config("ts_ls", {
  capabilities = nvlsp.capabilities,
  on_attach = my_attach,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
})
vim.lsp.enable "ts_ls"

-- Svelte
vim.lsp.config("svelte", {
  capabilities = nvlsp.capabilities,
  on_attach = my_attach,
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
})
vim.lsp.enable "svelte"

-- Python
vim.lsp.config("pylsp", {
  capabilities = nvlsp.capabilities,
  on_attach = my_attach,
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 100,
        },
      },
    },
  },
})
vim.lsp.enable "pylsp"

-- Rust
vim.lsp.config("rust_analyzer", {
  capabilities = nvlsp.capabilities,
  on_attach = my_attach,
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json", ".git" },
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      procMacro = { enable = true },
      checkOnSave = { command = "clippy" },
      inlayHints = { enable = true },
    },
  },
})
vim.lsp.enable "rust_analyzer"

-- read :h vim.lsp.config for changing options of lsp servers
