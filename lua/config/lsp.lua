-- lsp.lua
local lspconfig = require("lspconfig")

-- Rust Analyzer setup
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
})
