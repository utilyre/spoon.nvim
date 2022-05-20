local M = {}

local ls = require("luasnip")

local defaults = require("spoon.defaults")
local snippets = require("spoon.snippets")

M.setup = function(opts)
  if opts == nil then
    opts = {}
  end

  -- Merges the given opts with default opts (prefers theirs)
  for key, value in pairs(defaults.opts) do
    if opts[key] == nil then
      opts[key] = value
    end
  end

  -- Adds enabled languages' snippets
  for lang, enable in pairs(opts.langs) do
    if enable then
      ls.add_snippets(lang, snippets[lang])
    end
  end
end

return M
