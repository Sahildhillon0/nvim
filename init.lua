-- Set leader key
vim.g.mapleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Disable swap files
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable mouse support
vim.opt.mouse = "a"

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Split window behavior
vim.opt.splitright = true
vim.opt.splitbelow = true


-- Set transparent background
vim.cmd('colorscheme default')
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi NormalNC guibg=NONE ctermbg=NONE')
vim.cmd('hi SignColumn guibg=NONE ctermbg=NONE')
--vim.cmd('hi VertSplit guibg=NONE ctermbg=NONE')
--vim.cmd('hi StatusLine guibg=NONE ctermbg=NONE')
--vim.cmd('hi StatusLineNC guibg=NONE ctermbg=NONE')


require("core.keymaps")
--require("config.lsp")
require("config.treesitter")
-- Set leader key
--vim.g.mapleader = " "

-- Auto-install lazy.nvim if not found
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("config.telescope")

require("config.lsp")
