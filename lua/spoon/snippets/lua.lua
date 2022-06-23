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
  --- MODULE ---
  s({
    trig = "req",
    name = "Require",
  }, fmt("require(" .. quote .. "{}" .. quote .. ")", i(1, "module"))),

  s(
    {
      trig = "lreq",
      name = "Local Require",
    },
    fmt("local {} = require(" .. quote .. "{}" .. quote .. ")", {
      d(2, function(args)
        local name = "module"

        local parts = vim.split(args[1][1], ".", { plain = true })
        if parts[#parts] ~= "" then
          name = parts[#parts]
        end

        return sn(nil, i(1, name))
      end, 1),
      i(1),
    })
  ),

  s(
    {
      trig = "m",
      name = "Module",
    },
    fmt(
      [[
      local M = {{}}

      M.{}

      return M
      ]],
      i(0)
    )
  ),

  --- FUNCTION ---
  s(
    {
      trig = "fun",
      name = "Function",
    },
    fmt(
      [[
      local {} = function({})
        {}
      end
      ]],
      {
        i(1, "_"),
        i(2),
        i(0),
      }
    )
  ),

  s(
    {
      trig = "fune",
      name = "Function Expression",
    },
    fmt(
      [[
      function({})
        {}
      end
      ]],
      {
        i(1),
        i(0),
      }
    )
  ),
}
