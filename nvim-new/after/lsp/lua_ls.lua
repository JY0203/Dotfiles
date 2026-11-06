-- 讓 lua_ls 認得 nvim 的 API（vim.*），寫 nvim 設定時才有補全、不會報 undefined global
---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
}
