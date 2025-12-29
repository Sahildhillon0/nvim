return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",  -- Use stable branch (avoids new API issues)
  build = ":TSUpdate",
  lazy = false,  -- Load immediately to avoid race conditions
  opts = {
    ensure_installed = {
      "lua", "vim", "vimdoc", "rust", "toml", "markdown", "markdown_inline",
      "bash", "python", "c", "cpp", "javascript", "typescript", "html", "css", "json",
      -- Add any other languages you use
    },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
  },
  config = function(_, opts)
    -- Safe fallback: if module not loaded yet, skip without error
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if ok then
      configs.setup(opts)
    end
  end,
}
