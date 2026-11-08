-- 原則：不覆蓋任何原生按鍵，自訂功能一律放在 <leader> 底下
local map = vim.keymap.set

-- 貼上「最後一次 yank」的內容（register 0），不受中間 d / c 影響
map({ "n", "x" }, "<leader>p", '"0p', { desc = "Paste last yank" })
map({ "n", "x" }, "<leader>P", '"0P', { desc = "Paste last yank before" })

-- 刪除但不存進 register（black hole "_），不會蓋掉剪貼簿
map({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete without yank" })
map({ "n", "x" }, "<leader>D", '"_D', { desc = "Delete to EOL without yank" })

-- 執行目前檔案：在下方開 terminal，方便對照 Python / Java 的輸出
map("n", "<leader>r", function()
  local runners = { python = "python3", java = "java" }
  local cmd = runners[vim.bo.filetype]
  if not cmd then
    vim.notify("No runner for filetype: " .. vim.bo.filetype, vim.log.levels.WARN)
    return
  end
  vim.cmd("write")
  vim.cmd("botright split | resize 12 | terminal " .. cmd .. " " .. vim.fn.shellescape(vim.fn.expand("%:p")))
end, { desc = "Run current file" })
