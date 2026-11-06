-- vim.pack（nvim 0.12 內建）：第一次啟動會 git clone 到 stdpath("data")/site/pack/core/opt/
-- 版本記錄在 nvim-pack-lock.json；更新用 :lua vim.pack.update()
local gh = function(repo)
  return "https://github.com/" .. repo
end

-- plugin 更新後的 hook：必須在 vim.pack.add 之前建立，才收得到事件
vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("jon_pack_hooks", { clear = true }),
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    -- treesitter 更新後，parser 也要跟著更新到對應版本
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  gh("nvim-mini/mini.icons"), -- 檔案圖示，snacks / oil 共用
  gh("folke/snacks.nvim"), -- 只用 picker 模組
  gh("stevearc/oil.nvim"), -- 用編輯文字的方式管理檔案
  gh("nvim-treesitter/nvim-treesitter"), -- 語法解析：高亮、縮排、折疊
  -- 鎖在 1.x 的 release tag，blink 才會下載預編譯的 fuzzy matcher
  { src = gh("saghen/blink.cmp"), version = vim.version.range("^1") },
})

require("mini.icons").setup()

require("jon.plugins.picker")
require("jon.plugins.explorer")
require("jon.plugins.treesitter")
require("jon.plugins.completion")
