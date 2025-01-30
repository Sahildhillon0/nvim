
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", "clangd", "rust_analyzer", "jdtls"  -- Java LSP
    }
}

-- Setup LSP servers
local lspconfig = require("lspconfig")

local servers = {
    lua_ls = {},  -- Lua
    clangd = {},  -- C/C++
    rust_analyzer = {},  -- Rust
    jdtls = {},  -- Java
}

for server, config in pairs(servers) do
    lspconfig[server].setup(config)
end
