# datebox.nvim

A simple Neovim plugin to help with date manipulation.

## Installation

This plugin can be easily installed using [Lazy.nvim](https://github.com/folke/lazy.nvim).

1.  Create a new file, for example, `datebox.lua`, inside your `~/.config/nvim/lua/plugins/` directory. If the `plugins` directory doesn't exist, create it.

    ```bash
    mkdir -p ~/.config/nvim/lua/plugins/
    touch ~/.config/nvim/lua/plugins/datebox.lua
    ```

2.  Open the newly created `datebox.lua` file and paste the following content into it:

    ```lua
    return {
      'cwmaguire/datebox.nvim',
      -- You can add any additional configuration for your plugin here,
      -- such as dependencies, event triggers, or setup functions.
      -- Example:
      -- dependencies = { 'nvim-tree/nvim-web-devicons' },
      -- config = function()
      --   require('datebox').setup()
      -- end,
    }
    ```

3.  Save the file.

4.  The next time you open Neovim, Lazy.nvim will automatically detect, download, and install `datebox.nvim` into `~/.local/share/nvim/lazy/datebox.nvim`.

## Usage

(Add your plugin's usage instructions here once the basic installation is complete.)
