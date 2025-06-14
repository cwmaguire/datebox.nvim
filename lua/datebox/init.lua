
local M = {}

function M.show_datebox()
    local date = os.date("%Y-%m-%d")
    local line_length = #date + 4 -- Date length + 2 for padding + 2 for borders
    local horizontal_line = "+" .. string.rep("-", line_length - 2) .. "+"
    local content_line = "|  " .. date .. "  |"

    print(horizontal_line)
    print(content_line)
    print(horizontal_line)
end

-- Expose the function as a Neovim command
vim.api.nvim_create_user_command('DateBox', M.show_datebox, {})

-- Simple datebox plugin for Neovim
return M
