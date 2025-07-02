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
      {
        "simrat39/rust-tools.nvim",
        config = function()
          local capabilities = require('blink.cmp').get_lsp_capabilities()
          local rt = require("rust-tools")

          rt.setup({
            server = {
              capabilities = capabilities,
              on_attach = function(_, bufnr)
                -- Format Rust on save
                vim.api.nvim_create_autocmd("BufWritePre", {
                  buffer = bufnr,
                  callback = function()
                    vim.lsp.buf.format({ async = false })
                  end,
                })
              end,
            },
          })
        end,
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Set up LSPs
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }

      lspconfig.clangd.setup {
        capabilities = capabilities,
      }

      lspconfig.pyright.setup {
        capabilities = capabilities,
      }

      -- rust-analyzer is handled by rust-tools, no need to set it up here

      lspconfig.jdtls.setup {
        capabilities = capabilities,
      }

      lspconfig.bashls.setup {
        capabilities = capabilities,
      }

      lspconfig.remark_ls.setup {
        capabilities = capabilities,
      }

      -- Diagnostics config: show inline + float
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Automatically show diagnostic in float on CursorHold
      vim.o.updatetime = 300
      vim.cmd [[
        autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
      ]]

      -- Toggle diagnostics when entering/leaving insert mode
      vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
        callback = function()
          if vim.fn.mode() == 'i' then
            vim.diagnostic.hide()
          else
            vim.diagnostic.show()
          end
        end,
      })

      -- Autoformat Lua on insert leave
      vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
          local bufnr = vim.api.nvim_get_current_buf()
          local ft = vim.bo[bufnr].filetype
          if ft == "lua" and vim.fn.mode() == "n" then
            vim.lsp.buf.format({ bufnr = bufnr })
          end
        end,
      })

      -- Keymap: show diagnostic float
      vim.keymap.set("n", "K", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
    end,
  },
}

