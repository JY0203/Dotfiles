-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")




-- 用 ColorScheme autocmd,避免被主題載入後覆蓋
local function set_cursor_hl()
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#ff5555", fg = "#000000" })
end
set_cursor_hl()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_cursor_hl })

-- 只在有焦點的視窗顯示 cursorline
local aug = vim.api.nvim_create_augroup("FocusCursorline", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained" }, {
  group = aug, callback = function() vim.wo.cursorline = true end,
})
vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost" }, {
  group = aug, callback = function() vim.wo.cursorline = false end,
})
