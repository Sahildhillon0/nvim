
-- Advent of Neovim
print("advent of neovim")

require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

-- Custom Keymaps
-- Source current file (for Lua config)
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Quickfix navigation
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable line numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- Terminal mappings for new terminal window and sending commands
local job_id = 0
vim.keymap.set("n", "<space>to", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)

  job_id = vim.bo.channel
end)

local current_command = ""
vim.keymap.set("n", "<space>te", function()
  current_command = vim.fn.input("Command: ")
end)

vim.keymap.set("n", "<space>tr", function()
  if current_command == "" then
    current_command = vim.fn.input("Command: ")
  end

  vim.fn.chansend(job_id, { current_command .. "\r\n" })
end)

vim.keymap.set("n", "-", "<cmd>Oil<CR>")

-- New Keymaps
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("c", "W", "w")
vim.keymap.set("c", "Q", "q")

-- File Explorer
vim.keymap.set("n", "<leader>pv", ":Oil<CR>") -- Open file explorer

-- Quick exit from insert mode
vim.keymap.set("i", "jk", "<Esc>")  -- Exit insert mode quickly

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")  -- Move to the left window
vim.keymap.set("n", "<C-l>", "<C-w>l")  -- Move to the right window
vim.keymap.set("n", "<C-j>", "<C-w>j")  -- Move to the bottom window
vim.keymap.set("n", "<C-k>", "<C-w>k")  -- Move to the top window

-- Set transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")  -- Sets the background of normal text to transparent
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")  -- Sets the background of inactive windows to transparent
vim.cmd("hi VertSplit guibg=NONE ctermbg=NONE")  -- Makes the vertical split line transparent
vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")  -- Sets the status line background to transparent
vim.cmd("hi TabLine guibg=NONE ctermbg=NONE")  -- Makes the tabline transparent

-- Optional: Set transparent background for floating windows (e.g., popups)
vim.cmd("hi FloatBorder guibg=NONE ctermbg=NONE")

