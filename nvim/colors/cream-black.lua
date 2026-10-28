vim.cmd("hi clear")
vim.g.colors_name = "cream-black"
vim.o.termguicolors = true
vim.o.background = "dark"

local c = {
  bg = "#0d0d0d", alt = "#161614", sel = "#2a2825",
  fg = "#e6dfc8", dim = "#6b675c", mid = "#9a9484",
  red = "#d9776b", orange = "#d9a066", yellow = "#e0c98a",
  green = "#a3b18a", cyan = "#8bb5ad", blue = "#8fa8b8", purple = "#b89bb5",
}

local groups = {
  -- UI（背景 NONE = 透出 Ghostty 的透明度）
  SnacksPickerGitStatusUntracked = { fg = c.mid },
  Normal = { fg = c.fg, bg = "NONE" },
  NormalFloat = { fg = c.fg, bg = "NONE" },
  FloatBorder = { fg = c.dim, bg = "NONE" },
  SignColumn = { bg = "NONE" },
  EndOfBuffer = { fg = c.bg },
  LineNr = { fg = c.dim },
  CursorLineNr = { fg = c.yellow, bold = true },
  CursorLine = { bg = c.alt },
  Visual = { bg = c.sel },
  Search = { fg = c.bg, bg = c.yellow },
  IncSearch = { fg = c.bg, bg = c.orange },
  MatchParen = { fg = c.orange, bold = true },
  WinSeparator = { fg = c.sel },
  Pmenu = { fg = c.fg, bg = c.alt },
  PmenuSel = { fg = c.fg, bg = c.sel, bold = true },
  Folded = { fg = c.mid, bg = c.alt },
  Directory = { fg = c.blue },
  Title = { fg = c.yellow, bold = true },
  NonText = { fg = c.sel },
  Whitespace = { fg = c.sel },

  -- 基本語法
  Comment = { fg = c.dim, italic = true },
  String = { fg = c.green },
  Number = { fg = c.orange },
  Boolean = { fg = c.orange },
  Constant = { fg = c.orange },
  Identifier = { fg = c.fg },
  Function = { fg = c.blue },
  Keyword = { fg = c.purple },
  Statement = { fg = c.purple },
  Operator = { fg = c.mid },
  Type = { fg = c.yellow },
  Special = { fg = c.cyan },
  PreProc = { fg = c.purple },
  Delimiter = { fg = c.mid },

  -- Treesitter
  ["@variable"] = { fg = c.fg },
  ["@variable.builtin"] = { fg = c.dim, italic = true }, -- self, cls
  ["@variable.parameter"] = { fg = c.fg, italic = true },
  ["@variable.member"] = { fg = c.cyan },                -- Go struct field
  ["@property"] = { fg = c.cyan },                       -- YAML key
  ["@function.builtin"] = { fg = c.cyan },
  ["@function.method"] = { fg = c.blue },
  ["@constructor"] = { fg = c.yellow },
  ["@type.builtin"] = { fg = c.yellow, italic = true },
  ["@attribute"] = { fg = c.orange },                    -- Python decorator
  ["@module"] = { fg = c.mid },                          -- Go package
  ["@constant.builtin"] = { fg = c.orange, italic = true }, -- nil / None
  ["@string.escape"] = { fg = c.cyan },
  ["@string.special"] = { fg = c.yellow },
  ["@keyword.import"] = { fg = c.purple },
  ["@keyword.return"] = { fg = c.red },
  ["@punctuation.delimiter"] = { fg = c.mid },
  ["@punctuation.bracket"] = { fg = c.mid },
  ["@label.yaml"] = { fg = c.yellow },                   -- anchor / alias
  ["@type.yaml"] = { fg = c.yellow },                    -- tag

  -- Diagnostics / Git
  DiagnosticError = { fg = c.red },
  DiagnosticWarn = { fg = c.yellow },
  DiagnosticInfo = { fg = c.blue },
  DiagnosticHint = { fg = c.cyan },
  DiagnosticUnderlineError = { undercurl = true, sp = c.red },
  DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
  DiffAdd = { bg = "#1c2118" },
  DiffChange = { bg = "#1f1d15" },
  DiffDelete = { bg = "#261614" },
  GitSignsAdd = { fg = c.green },
  GitSignsChange = { fg = c.yellow },
  GitSignsDelete = { fg = c.red },
}

for name, opts in pairs(groups) do
  vim.api.nvim_set_hl(0, name, opts)
end
