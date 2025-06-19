require("nvchad.configs.lspconfig").defaults()
local nvlsp = require "nvchad.configs.lspconfig"

local on_attach = nvlsp.on_attach

local function my_attach(client, bufnr)
  on_attach(client, bufnr)
  -- Your existing code action keymap
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP Code Action" })
  -- Hover documentation (like K in vanilla Vim)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })
  -- Go to definition
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP Go to Definition" })
  -- Go to declaration
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "LSP Go to Declaration" })
  -- Go to implementation
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "LSP Go to Implementation" })
  -- Go to references
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP References" })
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
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { buffer = bufnr, desc = "Diagnostics Float" })
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

-- read :h vim.lsp.config for changing options of lsp servers
