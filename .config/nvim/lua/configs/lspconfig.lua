require("nvchad.configs.lspconfig").defaults()
-- local nvlsp = require "nvchad.configs.lspconfig"
--
-- vim.lsp.config('rust_analyzer', {
--  settings = {
--     ['rust-analyzer'] = {},
--   },
-- })

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
