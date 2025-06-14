-- By Gemini
-- "Please rewrite this plugin so that instead of printing out the datebox
--  in the message area, it inserts the datebox as text at the cursor"

local M = {}

function M.show_datebox()
    -- Get current date
    local date = os.date("%Y-%m-%d")

    -- Calculate dimensions for the box
    local date_length = #date
    local padding = 2 -- spaces on each side of the date
    local box_width = date_length + (padding * 2) + 2 -- Date + padding + borders (| |)

    local horizontal_line = "+" .. string.rep("-", box_width - 2) .. "+"
    local content_line = "|" .. string.rep(" ", padding) .. date .. string.rep(" ", padding) .. "|"

    -- Prepare the lines to insert
    local lines_to_insert = {
        horizontal_line,
        content_line,
        horizontal_line
    }

    -- Get current buffer and cursor position
    local current_buf = vim.api.nvim_get_current_buf()
    local cursor_row = vim.api.nvim_win_get_cursor(0)[1] - 1 -- -1 because nvim_buf_set_lines is 0-indexed

    -- Insert the lines at the cursor position
    -- The third argument 'true' means 'strict_indexing' (start and end are exclusive for removal)
    -- Here we want to insert, so start and end are the same, effectively inserting before that line.
    vim.api.nvim_buf_set_lines(current_buf, cursor_row, cursor_row, false, lines_to_insert)

    -- Optionally, move the cursor to the middle of the inserted box (on the date line)
    -- This calculation places the cursor at the beginning of the date string
    vim.api.nvim_win_set_cursor(0, {cursor_row + 2, padding + 1}) -- +2 for the middle line, +1 for initial |
end

-- Expose the function as a Neovim command
-- (CM: According to Gemini this needs to be in a file auto-loaded by Lazy.nvim,
--  which means it needs to be in the plugin directory)
--vim.api.nvim_create_user_command('DateBox', M.show_datebox, {})

-- Simple datebox plugin for Neovim
return M

-- Original by xAI (I didn't give a good prompt)
-- local M = {}
-- 
-- function M.show_datebox()
--     local date = os.date("%Y-%m-%d")
--     local line_length = #date + 4 -- Date length + 2 for padding + 2 for borders
--     local horizontal_line = "+" .. string.rep("-", line_length - 2) .. "+"
--     local content_line = "|  " .. date .. "  |"
-- 
--     print(horizontal_line)
--     print(content_line)
--     print(horizontal_line)
-- end
-- 
-- -- Expose the function as a Neovim command
-- vim.api.nvim_create_user_command('DateBox', M.show_datebox, {})
-- 
-- -- Simple datebox plugin for Neovim
-- return M
