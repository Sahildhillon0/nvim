# Neovim Configuration

A customized Neovim configuration that I use.

## Table of Contents
- [Installation](#installation)
  - [Arch Linux](#arch-linux)
  - [Other Linux Distributions](#other-linux-distributions)
- [Keymaps](#keymaps)
  - [General Keymaps](#general-keymaps)
  - [Plugin Keymaps](#plugin-keymaps)
- [Plugins](#plugins)
- [Custom Configurations](#custom-configurations)

---

## Installation

### Arch Linux

1. **Install Neovim**: First, make sure that Neovim is installed on your system.
   ```bash
   sudo pacman -S neovim
   ```

2. **Install Git**: You'll need `git` to clone the repository.
   ```bash
   sudo pacman -S git
   ```

3. **Clone the Repository**: Clone the repository into your Neovim configuration directory.
   ```bash
   git clone https://github.com/Sahildhillon0/nvim ~/.config/nvim
   ```

4. **Install Dependencies**: Install any required dependencies for the plugins and configuration. You can either use `vim-plug` or any plugin manager.
   - If using `vim-plug`, run the following command inside Neovim:
     ```bash
     :PlugInstall
     ```

5. **Set Neovim to Use the Configuration**: Ensure Neovim uses the configuration you just cloned.
   ```bash
   nvim
   ```

---

### Other Linux Distributions

1. **Install Neovim**: Use your package manager to install Neovim. For example, on Ubuntu-based systems:
   ```bash
   sudo apt install neovim
   ```

2. **Install Git**:
   ```bash
   sudo apt install git
   ```

3. **Clone the Repository**:
   ```bash
   git clone https://github.com/Sahildhillon0/nvim ~/.config/nvim
   ```

4. **Install Dependencies**: Use a plugin manager like `vim-plug` to install plugins.
   ```bash
   nvim
   :PlugInstall
   ```

---

## Keymaps

### General Keymaps

- **Normal Mode**:
  - `:w` : Save the current file.
  - `:q` : Quit Neovim.
  - `:wq` : Save and quit Neovim.
  - `:x` : Save and exit (equivalent to `:wq`).
  - `u` : Undo the last action.
  - `Ctrl + r` : Redo the last undone action.
  - `dd` : Delete the current line.
  - `yy` : Copy the current line.
  - `p` : Paste after the cursor.
  - `P` : Paste before the cursor.
  
- **Visual Mode**:
  - `v` : Enter visual mode (select characters).
  - `V` : Enter line-wise visual mode.
  - `Ctrl + v` : Enter block visual mode (select a block).
  - `y` : Yank (copy) the selected text.
  - `d` : Delete the selected text.
  
- **Insert Mode**:
  - `i` : Enter insert mode at the current cursor position.
  - `I` : Enter insert mode at the beginning of the current line.
  - `a` : Enter insert mode after the current cursor position.
  - `A` : Enter insert mode at the end of the current line.
  
- **Command Mode**:
  - `:` : Open command-line mode to enter commands.
  - `:help` : Open help for a specific command.

### Plugin Keymaps

- **Telescope** (File Finder):
  - `<Leader>ff` : Find files.
  - `<Leader>fg` : Live grep (search text in files).
  - `<Leader>fb` : Find buffers.
  - `<Leader>fh` : Find help tags.
  
- **NerdTree** (File Explorer):
  - `<Leader>e` : Toggle the file explorer.
  
- **LSP (Language Server Protocol)**:
  - `gd` : Go to definition.
  - `gr` : Go to references.
  - `gi` : Go to implementation.
  - `K` : Show documentation for the symbol under the cursor.
  
- **Autocomplete** (Using `nvim-cmp`):
  - `Tab` : Complete the current word.
  - `Shift + Tab` : Go to the previous completion suggestion.

---

## Plugins

- **telescope.nvim**: A fuzzy finder for files, buffers, and more.
- **nvim-tree.lua**: A fast file explorer with support for Git, buffers, and more.
- **nvim-lspconfig**: Easily configure LSP (Language Server Protocol) in Neovim.
- **nvim-cmp**: A completion plugin for autocomplete functionality.
- **treesitter**: Better syntax highlighting and code understanding.

For a full list of installed plugins, refer to the `init.lua` file.

---

## Custom Configurations

1. **Themes**: The configuration includes a dark theme with support for popular color schemes. You can modify or change the theme by editing the `colorscheme` line in the `init.lua`.

2. **Autocompletion**: Using `nvim-cmp`, the config sets up autocomplete for various languages, making coding faster and easier.

3. **LSP**: The configuration enables Language Server Protocol for languages like Python, JavaScript, Go, etc. Ensure that the necessary language servers are installed.

4. **Keymaps and Aliases**: Custom key mappings and aliases are defined to speed up your workflow. You can modify them to suit your needs.

---
