-- This only needs if I use rustaceanvim plugin

-- local bufnr = vim.api.nvim_get_current_buf()
--
-- vim.keymap.set("n", "<leader>a", function()
--   vim.cmd.RustLsp "codeAction"
-- end, { silent = true, buffer = bufnr, desc = "Trigger Rust code actions" })
--
-- vim.keymap.set("n", "<leader>k", function()
--   vim.cmd.RustLsp { "hover", "actions" }
-- end, { silent = true, buffer = bufnr, desc = "Rust hover actions" })
