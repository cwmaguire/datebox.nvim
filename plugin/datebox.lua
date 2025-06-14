-- Created by Gemini

-- This file will be automatically sourced by Neovim because it's in `plugin/`

-- Require your datebox module to get its functions
local datebox_module = require("datebox")

-- Now create the user command using the function from your module
vim.api.nvim_create_user_command('DateBox', datebox_module.show_datebox, {})
