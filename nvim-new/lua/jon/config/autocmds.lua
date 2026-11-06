local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 游標顏色：用 ColorScheme autocmd，避免被主題載入後覆蓋
local function set_cursor_hl()
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#ff5555", fg = "#000000" })
end
set_cursor_hl()
autocmd("ColorScheme", { group = augroup("jon_cursor", { clear = true }), callback = set_cursor_hl })

-- 只在有焦點的視窗顯示 cursorline
local focus = augroup("jon_focus_cursorline", { clear = true })
autocmd({ "WinEnter", "FocusGained" }, {
  group = focus,
  callback = function() vim.wo.cursorline = true end,
})
autocmd({ "WinLeave", "FocusLost" }, {
  group = focus,
  callback = function() vim.wo.cursorline = false end,
})

-- yank 時短暫高亮被複製的範圍
autocmd("TextYankPost", {
  group = augroup("jon_yank_highlight", { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
