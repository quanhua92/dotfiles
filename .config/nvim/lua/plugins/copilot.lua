return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-e>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[c",
          jump_next = "]c",
          accept = "<C-l>",
          refresh = "gr",
          open = "<M-CR>",
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        gitcommit = true,
        rust = true,
      },
      copilot_node_command = "node", -- Node.js version must be > 16.x
    }
  end,
}

-- return {
-- "github/copilot.vim",
-- lazy = false,
-- config = function() -- Mapping tab is already used in NvChad
--   vim.g.copilot_no_tab_map = true -- Disable tab mapping
--   vim.g.copilot_assume_mapped = true -- Assume that the mapping is already done
-- end,
-- }
