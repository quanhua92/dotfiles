return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    disabled_keys = {
      ["<Up>"] = false, -- Allow Up Key
      ["<Down>"] = false, -- Allow Down Key
      ["<Left>"] = false, -- Allow Left Key
      ["<Right>"] = false, -- Allow Right Key
    },
  },
}
