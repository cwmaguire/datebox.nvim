-- By Gemini
-- "Please rewrite this plugin so that instead of printing out the datebox
--  in the message area, it inserts the datebox as text at the cursor"

-- ┏━━━━━━━━━━━━━━━━┓
-- ┃   2025-06-14   ┃
-- ┗━━━━━━━━━━━━━━━━┛

local M = {}

function M.show_datebox()
    local date = os.date("%Y-%m-%d")

    -- Calculate dimensions for the box
    local date_length = #date
    local padding = "  "
    local box_width = date_length + (#padding * 2)
    local line = string.rep("━", box_width)
    local top_line = "┏" .. line .. "┓"
    local content_line = "┃" .. padding .. date .. padding .. "┃"
    local bottom_line = "┗" .. line .. "┛"

    -- Prepare the lines to insert
    local lines_to_insert = {
        top_line,
        content_line,
        bottom_line,
	"" -- empty line
    }

    -- Get current buffer and cursor position
    local current_buf = vim.api.nvim_get_current_buf()
    local cursor_row = vim.api.nvim_win_get_cursor(0)[1] - 1 -- -1 because nvim_buf_set_lines is 0-indexed

    -- Insert the lines at the cursor position
    -- 'strict_indexing': start and end are exclusive for removal
    -- Here we want to insert, so start and end are the same, effectively inserting before that line.
    local strict_indexing = false
    local start_row = cursor_row
    local end_row = cursor_row
    vim.api.nvim_buf_set_lines(current_buf, start_row, end_row, strict_indexing, lines_to_insert)

    local new_cursor_row = cursor_row + 4
    local new_cursor_col = 0
    vim.api.nvim_win_set_cursor(0, {new_cursor_row, new_cursor_col})
end

return M
