-- 載入順序有意義：options 先設 leader，keymaps 才能用 <leader>
require("jon.config.options")
require("jon.config.keymaps")
require("jon.config.autocmds")
require("jon.plugins")

vim.cmd.colorscheme("cream-black")
