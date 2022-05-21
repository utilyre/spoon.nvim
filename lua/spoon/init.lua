local M = {}

local ls = require("luasnip")

local defaults = require("spoon.defaults")

M.setup = function(opts)
  if opts == nil then
    opts = {}
  end

  -- Merges the given opts with default opts (prefers theirs)
  local cfg = opts
  for key, value in pairs(defaults.opts) do
    if cfg[key] == nil then
      cfg[key] = value
    end
  end

  -- Make cfg global so it will be accessible in snippets
  vim.g.spoon_config = cfg
  local snippets = require("spoon.snippets")

  -- Adds enabled languages' snippets
  for lang, enable in pairs(cfg.langs) do
    if enable then
      ls.add_snippets(lang, snippets[lang])
    end
  end
end

return M
