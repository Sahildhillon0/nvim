
-- GitHub theme plugin configuration
require("github-theme").setup({
    styles = {
        comments = "italic",  -- Style for comments
        keywords = "bold",    -- Style for keywords
        functions = "none",   -- Style for functions (optional)
        variables = "none",   -- Style for variables (optional)
    },
    hide_background = true,  -- Set background transparency
})

-- Set the GitHub theme (dark mode)
vim.cmd("colorscheme github_dark")

-- Transparent background configuration
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')  -- Transparent background for Normal
vim.cmd('hi NormalNC guibg=NONE ctermbg=NONE')  -- Transparent background for NormalNC
vim.cmd('hi SignColumn guibg=NONE ctermbg=NONE')  -- Transparent background for SignColumn
vim.cmd('hi VertSplit guibg=NONE ctermbg=NONE')  -- Transparent background for VertSplit
vim.cmd('hi StatusLineNC guibg=NONE ctermbg=NONE')  -- Transparent background for StatusLineNC
