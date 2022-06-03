local M = {}

local ls = require("luasnip")

local defaults = require("spoon.defaults")

M.setup = function(opts)
  if opts == nil then
    opts = {}
  end

  -- Merges the given opts with default opts (prefers theirs)
  opts = vim.tbl_deep_extend("force", defaults, opts)

  -- Make cfg global so it will be accessible in snippets
  vim.g.spoon_config = opts
  local snippets = require("spoon.snippets")

  -- Adds enabled languages' snippets
  for lang, enable in pairs(opts.langs) do
    if enable then
      ls.add_snippets(lang, snippets[lang])
    end
  end
end

return M
