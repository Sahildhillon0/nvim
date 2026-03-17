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

-- JavaScript / TypeScript
lspconfig.tsserver.setup({})

-- C / C++
lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
  },
})
