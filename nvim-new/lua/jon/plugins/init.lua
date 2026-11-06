-- vim.pack（nvim 0.12 內建）：第一次啟動會 git clone 到 stdpath("data")/site/pack/core/opt/
-- 版本記錄在 nvim-pack-lock.json；更新用 :lua vim.pack.update()
local gh = function(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  gh("nvim-mini/mini.icons"), -- 檔案圖示，snacks / oil 共用
  gh("folke/snacks.nvim"), -- 只用 picker 模組
  gh("stevearc/oil.nvim"), -- 用編輯文字的方式管理檔案
})

require("mini.icons").setup()

require("jon.plugins.picker")
require("jon.plugins.explorer")
