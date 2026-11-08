-- nvim-treesitter（main 分支）只負責安裝 parser；高亮、折疊由 nvim 本身提供
-- 編譯 parser 需要 tree-sitter-cli（brew install tree-sitter-cli）和 C 編譯器
local parsers = {
  -- 開發（優先順序：Python > Go > Rust）
  "python",
  "go", "gomod", "gosum", "gowork",
  "rust",
  "java", -- 對照學習用
  "lua", "luadoc", "sql",
  -- SRE / 設定檔
  "bash", "yaml", "helm", "json", "toml", "xml", "dockerfile",
  -- git / 文件
  "diff", "gitignore", "markdown", "markdown_inline",
  -- nvim 自己
  "vim", "vimdoc", "query", "regex",
}

if vim.fn.executable("tree-sitter") == 1 then
  require("nvim-treesitter").install(parsers) -- 非同步；已安裝的會略過
else
  vim.notify("tree-sitter-cli not found: brew install tree-sitter-cli", vim.log.levels.WARN)
end

-- 開檔時，如果有對應的 parser 就啟用 treesitter
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("jon_treesitter", { clear = true }),
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang or not vim.treesitter.language.add(lang) then
      return
    end

    vim.treesitter.start(ev.buf, lang) -- 語法高亮

    -- 折疊：依語法結構折疊（zc 收合、zo 展開、za 切換），預設全部展開
    vim.wo[0][0].foldmethod = "expr"
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldlevel = 99

    -- 縮排：官方標記為 experimental，有問題再拿掉
    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
