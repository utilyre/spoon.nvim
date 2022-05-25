local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l

local cfg = vim.g.spoon_config
local quote = cfg.preferSingleQuotes and "'" or '"'

return {
  -- Module
  s("req", fmt("require(" .. quote .. "{}" .. quote .. ")", i(1, "module"))),
  s(
    "lreq",
    fmt("local {} = require(" .. quote .. "{}" .. quote .. ")", {
      f(function(args)
        local module = args[1][1] or ""
        local parts = vim.split(module, ".", { plain = true })
        return parts[#parts]
      end, { 1 }),
      i(1, "module"),
    })
  ),
  s(
    "m",
    fmt(
      [[
      local M = {{}}

      M.{}

      return M
      ]],
      i(0)
    )
  ),
}
