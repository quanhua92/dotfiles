require("nvchad.configs.lspconfig").defaults()
local nvlsp = require "nvchad.configs.lspconfig"

-- Global
vim.lsp.config("*", {
  capabilities = nvlsp.capabilities,
  root_markers = { ".git" },
})

-- Lua
vim.lsp.config.lua_ls = {
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
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
})
vim.lsp.enable "ts_ls"

-- Svelte
vim.lsp.config("svelte", {
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
})
vim.lsp.enable "svelte"

-- Python
vim.lsp.config("pylsp", {
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
