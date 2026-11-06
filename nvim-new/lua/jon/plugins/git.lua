-- gitsigns：sign column 顯示「跟 git index 相比」改了哪些行；存檔不會消失，git add / commit 後才消失
require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = require("gitsigns")
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- diff 模式下保留原生 ]c / [c，其他時候跳 hunk
    map("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gs.nav_hunk("next")
      end
    end, "Next hunk")
    map("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gs.nav_hunk("prev")
      end
    end, "Prev hunk")

    -- <leader>g = git
    map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
    map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
    map("x", "<leader>gs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, "Stage selected lines")
    map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
    -- 還原只改 buffer，存檔前可以 u 復原
    map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
    map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
    map("n", "<leader>gB", gs.blame, "Blame buffer")
    map("n", "<leader>gd", gs.diffthis, "Diff against index")
  end,
})
