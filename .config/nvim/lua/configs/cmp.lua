-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/cmp.lua
local config = require "nvchad.configs.cmp"
local cmp = require "cmp"

config.mapping["<CR>"] = cmp.mapping.confirm {
  behavior = cmp.ConfirmBehavior.Insert,
  select = false,
}

config.completion = {
  completeopt = "menu,menuone,noselect",
}

config.preselect = cmp.PreselectMode.None

return config
