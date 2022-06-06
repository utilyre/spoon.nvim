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
local hos = require("spoon.hos")
local javascript = require("spoon.snippets.javascript")

return {
  s(
    {
      trig = "rc",
      name = "React Component",
    },
    fmt(
      [[
      const {} = ({}{}{}) => {{
        {}

        return (
          <div>
            {}
          </div>
        )
      }}

      export default {}
      ]],
      {
        hos.ifilename(1),
        f(function(args)
          return args[1][1] == "" and "" or "{ "
        end, 2),
        i(2),
        f(function(args)
          return args[1][1] == "" and "" or " }"
        end, 2),
        i(0),
        hos.same(1),
        hos.same(1),
      }
    )
  ),

  s(
    {
      trig = "rh",
      name = "React Hook",
    },
    fmt(
      [[
      const {} = ({}) => {{
        {}

        return {}
      }}
      ]],
      {
        hos.ifilename(1),
        i(2),
        i(0),
        c(3, {
          fmt("[{}]", i(1)),
          fmt("{{ {} }}", i(1)),
        }),
      }
    )
  ),

  s(
    {
      trig = "state",
      name = "React useState",
    },
    fmt("const [{}, {}] = useState({})", {
      i(1, "state"),
      f(function(args)
        return "set" .. args[1][1]:gsub("^%l", string.upper)
      end, 1),
      i(2),
    })
  ),

  s(
    {
      trig = "effect",
      name = "React useEffect",
    },
    fmt(
      [[
      useEffect(() => {{
        {}
      }}, [{}])
      ]],
      {
        i(0),
        i(1),
      }
    )
  ),

  -- Loads all javascript snippets
  unpack(javascript),
}
