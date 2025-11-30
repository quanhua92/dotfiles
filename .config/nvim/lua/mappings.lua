require "nvchad.mappings"

-- Remove the default mapping - use :verbose nmap <leader>ds or <leader>tk to see it
vim.keymap.del("n", "<leader>ds")

local map = vim.keymap.set

map("n", "<C-m>", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree Window" })

map("n", "<leader>l", "<cmd>checktime<CR>", { desc = "Reload buffer if file changed externally" })
map("n", "<leader>ce", "<cmd>%bd<CR>", { desc = "Close all buffers" })
map("n", "<leader>co", "<cmd>%bd|e#|bd#<CR>", { desc = "Close other buffers" })
map("i", "jk", "<ESC>")

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

-- Telescope
local tb = require "telescope.builtin"
map("n", "<leader>tk", tb.keymaps, { desc = "Telescope: Keymaps" })
map("n", "<leader>tl", tb.highlights, { desc = "Telescope: Highlights" })
map("n", "<leader>tj", tb.jumplist, { desc = "Telescope: Jumplist" })
map("n", "<leader>tr", tb.registers, { desc = "Telescope: Registers" })
map("n", "<leader>tc", tb.commands, { desc = "Telescope: Commands" })
map("n", "<leader>ta", tb.autocommands, { desc = "Telescope: Autocommands" })
map("n", "<leader>to", tb.vim_options, { desc = "Telescope: Vim Options" })
map("n", "<leader>tw", tb.help_tags, { desc = "Telescope: Help Tags" })
map("n", "<leader>tm", tb.marks, { desc = "Telescope: Marks" })

map("n", "<leader>gt", tb.git_status, { desc = "Telescope: Git Status" })
map("n", "<leader>gc", tb.git_commits, { desc = "Telescope: Git Commits" })
map("n", "<leader>gb", tb.git_bcommits, { desc = "Telescope: Git Buffer Commits" })
map("v", "<leader>gB", tb.git_bcommits_range, { desc = "Telescope: Git Buffer Commits (Range)" })
map("n", "<leader>gg", tb.git_branches, { desc = "Telescope: Git Branches" })
map("n", "<leader>gs", tb.git_stash, { desc = "Telescope: Git Stash" })
