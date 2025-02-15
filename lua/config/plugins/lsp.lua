
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Set up Lua LSP
      require("lspconfig").lua_ls.setup {
        capabilities = capabilities,
      }

      -- Set up C LSP (clangd)
      require("lspconfig").clangd.setup {
        capabilities = capabilities,
      }

      -- Set up Python LSP (pyright)
      require("lspconfig").pyright.setup {
        capabilities = capabilities,
      }

      -- Set up Rust LSP (rust-analyzer)
      require("lspconfig").rust_analyzer.setup {
        capabilities = capabilities,
      }

      -- Set up Java LSP (jdtls)
      require("lspconfig").jdtls.setup {
        capabilities = capabilities,
      }

      -- Set up Makefile LSP (bashls)
      require("lspconfig").bashls.setup {
        capabilities = capabilities,
      }

      -- Set up Markdown LSP (remark_lsp)
      require("lspconfig").remark_ls.setup {
        capabilities = capabilities,
      }

      -- Set up other LSPs similarly for each language...

      -- Show diagnostics only in normal mode
      vim.api.nvim_create_autocmd({'InsertEnter', 'InsertLeave'}, {
        callback = function()
          -- If we're in Insert mode, clear the diagnostics
          if vim.fn.mode() == 'i' then
            vim.diagnostic.hide()
          else
            -- If we're in Normal mode, show diagnostics
            vim.diagnostic.show()
          end
        end,
      })

      -- Trigger LSP formatting only on exiting Insert mode
      vim.api.nvim_create_autocmd('InsertLeave', {
        callback = function()
          -- Run the formatting if necessary (for example, on Lua files)
          local bufnr = vim.api.nvim_get_current_buf()
          local filetype = vim.bo[bufnr].filetype

          -- Trigger LSP formatting only if in Normal mode and filetype matches
          if vim.fn.mode() == 'n' and filetype == 'lua' then
            vim.lsp.buf.format({ bufnr = bufnr })
          end
        end,
      })
    end,
  }
}

