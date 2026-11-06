-- leader 必須在任何 <leader> mapping 之前設定
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- 行號：絕對行號 + 相對行號（看相對行號就知道 5j、3dd 要打幾）
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "both"
opt.signcolumn = "yes" -- 永遠留一欄給 git / diagnostic 符號，避免畫面左右跳動

-- 捲動：游標上下保留 10 行、左右保留 8 欄
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.wrap = false

-- 縮排：Tab 轉空白、寬度 2（Java 之後可用 ftplugin 改成 4）
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true

-- 搜尋：全小寫時不分大小寫，出現大寫才區分
opt.ignorecase = true
opt.smartcase = true

-- 外觀
opt.termguicolors = true
opt.winborder = "rounded" -- 浮動視窗（hover、picker）預設圓角邊框
opt.laststatus = 3 -- 多個 split 共用一條 statusline
opt.pumheight = 10 -- 補全選單最多 10 項
opt.guicursor = "n-v-c:block-Cursor,i-ci:ver25-Cursor"

-- 檔案：不產生 swap，改用持久化 undo（關檔再開還能 u）
opt.swapfile = false
opt.writebackup = false
opt.undofile = true

-- 反應速度
opt.updatetime = 300 -- CursorHold 觸發時間，影響 diagnostic 浮窗、gitsigns
opt.timeoutlen = 500 -- 多鍵 mapping（如 <leader>ff）兩鍵之間的等待時間
opt.ttimeoutlen = 0 -- Esc 立即生效

-- 分割：新視窗開在右邊 / 下面
opt.splitright = true
opt.splitbelow = true

-- 剪貼簿：y / d / p 直接使用 macOS 系統剪貼簿
opt.clipboard = "unnamedplus"

-- 關閉滑鼠，強迫用鍵盤
opt.mouse = ""
