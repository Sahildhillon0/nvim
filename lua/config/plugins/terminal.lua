return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    {
      "<M-h>",
      function()
        local dir = vim.fn.expand("%:p:h")  -- Current file's directory (or cwd if no file)
        if dir == "" then dir = "git_dir" end  -- Fallback to git root if empty (optional)
        require("toggleterm").toggle(1, 0, dir, "float")  -- Toggle #1 terminal in float with dynamic dir
      end,
      mode = { "n", "t" },
      desc = "Toggle floating terminal (in current buffer directory)",
    },
  },
  opts = {
    direction = "float",
    float_opts = {
      border = "curved",
      width = function() return math.ceil(vim.o.columns * 0.9) end,
      height = function() return math.ceil(vim.o.lines * 0.4) end,
      winblend = 10,
    },
    start_in_insert = true,
    persist_size = true,
    close_on_exit = false,
    shell = vim.o.shell,
  },
}
