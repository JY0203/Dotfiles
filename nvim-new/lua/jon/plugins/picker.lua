-- snacks 是工具箱，這裡只開 picker；找檔用 fd、grep 用 rg（都由 snacks 呼叫）
local Snacks = require("snacks")

Snacks.setup({
  picker = { enabled = true },
})

local map = vim.keymap.set

-- <leader>f = find
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find files" })
map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Grep project" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Find buffers" })
map("n", "<leader>fr", function() Snacks.picker.resume() end, { desc = "Resume last picker" })
map("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Find help" })
