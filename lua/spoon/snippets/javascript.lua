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

return {
  s("cl", fmt([[console.log({})]], i(1))),
  s("ci", fmt([[console.info({})]], i(1))),
  s("cd", fmt([[console.debug({})]], i(1))),
  s("ce", fmt([[console.error({})]], i(1))),
  s(
    "fun",
    c(1, {
      fmt(
        [[
    const {} = ({}) => {{
      {}
    }}
    ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      fmt(
        [[
      function {}({}) {{
        {}
      }}
      ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
    })
  ),
}
