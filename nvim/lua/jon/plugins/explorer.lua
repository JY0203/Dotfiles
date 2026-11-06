-- oil：目錄就是一個 buffer，dd 刪檔、改名後 :w 就是 rename、- 回上層
local oil = require("oil")

oil.setup({
  -- 每個檔案旁顯示權限 / 大小 / 修改時間，類似 ls -l
  columns = {
    "icon",
    { "permissions", highlight = "Type" },
    { "size", highlight = "String" },
    { "mtime", highlight = "Keyword" },
  },
  view_options = { show_hidden = true },
  keymaps = {
    -- 只在 oil 的 buffer 內生效，不影響一般編輯時的原生 q（錄製巨集）
    ["q"] = { "actions.close", mode = "n" },
  },
  float = { border = "rounded" },
  preview_win = { update_on_cursor_moved = true }, -- 游標移動時預覽跟著換檔案
})

-- preview = {}：開浮窗時同時開右側預覽
vim.keymap.set("n", "<leader>e", function() oil.toggle_float(nil, { preview = {} }) end, { desc = "File explorer" })
