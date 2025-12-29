return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      {
        "mrcjkb/rustaceanvim",
        version = "^7",  -- Latest as of Dec 2025
        ft = { "rust" },  -- Lazy-load on .rs files
        init = function()
          vim.g.rustaceanvim = {
            server = {
              capabilities = function()
                return require("blink.cmp").get_lsp_capabilities()
              end,
              on_attach = function(client, bufnr)
                -- Format on save for Rust
                vim.api.nvim_create_autocmd("BufWritePre", {
                  buffer = bufnr,
                  callback = function()
                    vim.lsp.buf.format({ async = false })
                  end,
                })
              end,
              default_settings = {
                ["rust-analyzer"] = {
                  cargo = { allFeatures = true },
                  check = { command = "clippy" },
                  procMacro = { enable = true },
                },
              },
            },
          }
        end,
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Modern native API (no require("lspconfig") → no deprecation warning)
      vim.lsp.config("lua_ls", { capabilities = capabilities })
      vim.lsp.config("clangd", { capabilities = capabilities })
      vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.config("jdtls", { capabilities = capabilities })
      vim.lsp.config("bashls", { capabilities = capabilities })
      vim.lsp.config("remark_ls", { capabilities = capabilities })

      vim.lsp.enable({ "lua_ls", "clangd", "pyright", "jdtls", "bashls", "remark_ls" })

      -- Your diagnostics + other settings (unchanged)
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.o.updatetime = 300
      vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])

      vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
        callback = function()
          if vim.fn.mode() == "i" then
            vim.diagnostic.hide()
          else
            vim.diagnostic.show()
          end
        end,
      })

      vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
          local bufnr = vim.api.nvim_get_current_buf()
          local ft = vim.bo[bufnr].filetype
          if ft == "lua" and vim.fn.mode() == "n" then
            vim.lsp.buf.format({ bufnr = bufnr })
          end
        end,
      })

      vim.keymap.set("n", "K", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
    end,
  },
}
