require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "python", "javascript", "html", "css", "bash", "c", "cpp", "rust" }, -- Add more as needed
    sync_install = false,  -- Install parsers asynchronously
    auto_install = true,   -- Automatically install missing parsers

    highlight = {
        enable = true,     -- Enable syntax highlighting
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,     -- Better indentation
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",  -- Start selection
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },

    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Jump ahead to text objects
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
}

