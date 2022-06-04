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
  --- CONSOLE ---
  s("cl", fmt("console.log({})", i(1))),
  s("ci", fmt("console.info({})", i(1))),
  s("cd", fmt("console.debug({})", i(1))),
  s("ce", fmt("console.error({})", i(1))),

  --- MODULE ---
  s(
    "im",
    fmt("import {{ {} }} from " .. quote .. "{}" .. quote, {
      i(2),
      i(1),
    })
  ),

  s(
    "imd",
    fmt("import {} from " .. quote .. "{}" .. quote, {
      d(2, function(args)
          local name = "{}"

          local parts = vim.split(args[1][1], "/")
          if parts[#parts] ~= "" then
            name = parts[#parts]
          end

          return sn(nil, i(1, name))
        end, 1),
      i(1),
    })
  ),

  s("ex", t("export ")),
  s("exd", t("export default ")),

  --- FUNCTION ---
  s(
    "fun",
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
    )
  ),

  s(
    "afun",
    fmt(
      [[
      const {} = async ({}) => {{
        {}
      }}
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    )
  ),

  s(
    "fune",
    fmt(
      [[
      ({}) => {{
        {}
      }}
      ]],
      {
        i(1),
        i(0),
      }
    )
  ),

  s(
    "afune",
    fmt(
      [[
      async ({}) => {{
        {}
      }}
      ]],
      {
        i(1),
        i(0),
      }
    )
  ),
}
