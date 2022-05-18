local M = {}

local ls = require("luasnip")

local defaults = require("spoon.defaults")
local snippets = require("spoon.snippets")

M.setup = function(opts)
  -- Merges the given opts with default opts (prefers theirs)
  if opts == nil then opts = {} end
  for key, value in pairs(defaults.opts) do
    if opts[key] ~= nil then goto continue end

    opts[key] = value

    ::continue::
  end

  -- Adds enabled languages' snippets
  for lang, enable in pairs(opts.langs) do
    if not enable then goto continue end

    ls.add_snippets(lang, snippets[lang])

    ::continue::
  end
end

return M
