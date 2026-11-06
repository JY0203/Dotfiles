-- blink.cmp：自動補全選單；Step 4 接上 LSP 後才會有 method / class 補全
require("blink.cmp").setup({
  -- default preset 跟原生 insert 補全一致：C-n / C-p 選擇、C-y 確認、C-e 取消
  -- 每個鍵都有 fallback：選單沒出現時就執行原生行為
  keymap = { preset = "default" },

  completion = {
    -- 選到某一項時，旁邊顯示它的說明
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },

  sources = {
    -- lsp：Step 4 才有；path：檔案路徑；snippets：程式碼片段；buffer：已開檔案中出現過的字
    default = { "lsp", "path", "snippets", "buffer" },
  },
})
