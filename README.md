# Neovim Configuration

This is a Neovim configuration for a beginner who wants to set up a robust development environment with essential plugins, including `telescope.nvim` with the `fzf-native` extension for faster searching.

## Prerequisites

### 1. **Install Neovim**
Ensure you have Neovim installed. If not, you can install it via your package manager:

For Arch Linux:
```bash
sudo pacman -S neovim
```

### 2. **Install Required Dependencies**

- **ripgrep**: Used by `telescope` for searching files efficiently.

  ```bash
  sudo pacman -S ripgrep
  ```

- **fzf**: Required for the `telescope-fzf-native.nvim` extension.

  ```bash
  sudo pacman -S fzf
  ```

### 3. **Install `lazy.nvim`**

We'll be using `lazy.nvim` to manage plugins. If you don't have it installed yet, follow these steps:

**Clone `lazy.nvim`** to your local Neovim configuration directory:

  ```bash
    git clone --filter=blob:none https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
  ```

## Installing Plugins

### `telescope.nvim` and `telescope-fzf-native.nvim`

 **Run `:Lazy install` to Install the Plugins**:
    In Neovim, run the following to install the plugins:

  ```vim
    :Lazy install
  ```

---

## Troubleshooting Plugin Errors

If you encounter errors, follow these steps:

### 1. **Error: `module 'nvim-treesitter.configs' not found`**

- **Solution**: Install `nvim-treesitter`:

  In your `plugins.lua`, add:

  ```lua
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  ```

  Then run:
  
  ```vim
  :Lazy sync
  ```

  After installation, you can set up Treesitter for code highlighting and more.

---

### 2. **Error: `fzf extension doesn't exist or isn't installed`**

- **Solution**: Build the `fzf-native` extension manually if it wasn't built correctly.

  1. Go to the plugin directory:

     ```bash
     cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim
     ```

  2. Run the following to build the extension:

     ```bash
     make
     ```

  3. After that, reload Neovim and check again.

---

## Key Bindings

Once everything is set up, you can use `Telescope` with keybindings. For example, you can bind `Telescope` commands to your preferred keys:

```lua
-- Example keybindings for Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true })
```

---

## Final Steps

1. **Sync and Update Plugins**:

   After everything is set up, make sure all your plugins are synced and updated:

   ```
   :Lazy sync
   ```

2. **Restart Neovim**:

   After the plugins are installed and the setup is complete, restart Neovim to make sure everything is loaded properly.

3. **Check Health**:

   If you want to check for any issues with your Neovim setup, you can use:

   ```vim
   :checkhealth
   ```

---
