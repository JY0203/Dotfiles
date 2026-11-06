-- mason：把 server 裝到 stdpath("data")/mason/，並把它的 bin/ 加到 PATH 最前面
require("mason").setup()

-- 用 mason 的套件名稱（不是 lspconfig 的名稱）
require("mason-tool-installer").setup({
  ensure_installed = {
    "pyright", -- Python：型別、跳轉、補全
    "ruff", -- Python：lint、format、整理 import
    "lua-language-server",
    "yaml-language-server",
    "bash-language-server",
    "shellcheck", -- bashls 會自動呼叫它做 lint
  },
  run_on_start = true,
  auto_update = false,
})

-- 用 lspconfig 的名稱；開到對應 filetype 時才會啟動
-- 個別設定放在 after/lsp/<name>.lua，會跟 lspconfig 的預設值合併
vim.lsp.enable({ "pyright", "ruff", "lua_ls", "yamlls", "bashls" })

-- 錯誤顯示：行尾顯示訊息（nvim 0.11 起預設關閉），嚴重的排前面
vim.diagnostic.config({
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
  float = { source = "if_many" },
})

-- server attach 到 buffer 時才設快捷鍵（buffer-local）
-- 沒有 LSP 的 buffer，gd 還是原生行為
-- nvim 內建的 grr / gri / grn / gra / grt / K / ]d 不用另外設
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("jon_lsp_attach", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- hover 交給 pyright，避免 K 同時跳出兩個 server 的內容
    if client and client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "Goto definition")
    map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
    map({ "n", "x" }, "<leader>cf", function() vim.lsp.buf.format() end, "Format")
    map("n", "<leader>fs", function() require("snacks").picker.lsp_symbols() end, "Find symbols")
  end,
})
