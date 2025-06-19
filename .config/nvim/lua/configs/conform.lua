local options = {
  formatters = {
    biome = { require_cwd = true }, -- Only run if biome.json or biome.jsonc is present
  },
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    css = { "biome" },
    html = { "biome" },
    json = { "biome" },
    jsonc = { "biome" },
    graphql = { "biome" },
    javascript = { "biome", stop_after_first = true },
    typescript = { "biome", stop_after_first = true },
    javascriptreact = { "biome", stop_after_first = true }, -- .jsx
    typescriptreact = { "biome", stop_after_first = true }, -- .tsx
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
