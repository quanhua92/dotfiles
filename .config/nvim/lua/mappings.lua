require "nvchad.mappings"

-- Remove the default mapping - use :verbose nmap <leader>ds to see it
vim.keymap.del("n", "<leader>ds")

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>l", "<cmd>checktime<CR>", { desc = "Reload buffer if file changed externally" })
map("n", "<leader>ce", "<cmd>%bd<CR>", { desc = "Close all buffers" })
map("n", "<leader>co", "<cmd>%bd|e#|bd#<CR>", { desc = "Close other buffers" })
map("i", "jk", "<ESC>")

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
