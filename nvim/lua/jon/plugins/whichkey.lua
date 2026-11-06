-- which-key：按下前綴停 200ms 後跳出提示；只顯示提示，按鍵照原樣送出，不改原生行為
-- 預設的 presets 也會提示原生操作：d / y / c 後的 motion 與 text object、" 的 register、' 的 mark
local wk = require("which-key")

wk.setup({
  spec = {
    -- 群組名稱：對應 keymap 裡的 <leader>f / c / g
    { "<leader>f", group = "find" },
    { "<leader>c", group = "code" },
    { "<leader>g", group = "git" },
    { "gr", group = "lsp" }, -- nvim 內建的 grr / gri / grn / gra / grt
  },
})

-- 列出目前 buffer 可用的 buffer-local 快捷鍵（例如 LSP、gitsigns 的鍵）
vim.keymap.set("n", "<leader>?", function() wk.show({ global = false }) end, { desc = "Buffer keymaps" })
