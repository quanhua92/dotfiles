require("nvchad.configs.lspconfig").defaults()
-- local nvlsp = require "nvchad.configs.lspconfig"
--
-- vim.lsp.config('rust_analyzer', {
--  settings = {
--     ['rust-analyzer'] = {},
--   },
-- })

vim.lsp.config('lua_ls', {})

-- local servers = { "html", "cssls", "lua_ls" }
local servers = { "lua_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
