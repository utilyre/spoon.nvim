local M = {}

-- TODO: Language specific options
M.opts = {
  preferSingleQuotes = true,
  langs = {
    all = true,
    lua = true,
    -- TODO: preferCommonJs (defaults to false)
    javascript = true,
    javascriptreact = true,
  },
}

return M
