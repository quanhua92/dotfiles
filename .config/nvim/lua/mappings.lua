require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>l", "<cmd>checktime<CR>", { desc = "Reload buffer if file changed externally" })
map("n", "<leader>ca", "<cmd>%bd<CR>", { desc = "Close all buffers" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
