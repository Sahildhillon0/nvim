
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- Enable fuzzy matching
      override_generic_sorter = true,  -- Override default sorter with fzf
      override_file_sorter = true,     -- Override file sorter with fzf
    },
  },
}

-- Ensure the fzf extension is loaded
telescope.load_extension('fzf')
