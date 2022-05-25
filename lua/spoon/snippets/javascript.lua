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
  s("cl", fmt("console.log({})", i(1))),
  s("ci", fmt("console.info({})", i(1))),
  s("cd", fmt("console.debug({})", i(1))),
  s("ce", fmt("console.error({})", i(1))),
  -- Module
  -- TODO: Dynamic node for import name (dynamic because user should be able to change the generated name)
  s(
    "i",
    c(1, {
      fmt("import {{ {} }} from " .. quote .. "{}" .. quote, {
        i(2),
        i(1),
      }),
      fmt("const {{ {} }} = require(" .. quote .. "{}" .. quote .. ")", {
        i(2),
        i(1),
      }),
    })
  ),
  s(
    "id",
    c(1, {
      fmt("import {} from " .. quote .. "{}" .. quote, {
        i(2, "{}"),
        i(1),
      }),
      fmt("const {} = require(" .. quote .. "{}" .. quote .. ")", {
        i(2, "{}"),
        i(1),
      }),
    })
  ),
  s(
    "e",
    c(1, {
      fmt("export {}", i(1)),
      fmt("module.exports = {{ {} }}", i(1)),
    })
  ),
  s(
    "ed",
    c(1, {
      fmt("export default {}", i(1)),
      fmt("module.exports = {}", i(1)),
    })
  ),
  -- Function
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
  s(
    "afun",
    c(1, {
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
      ),
      fmt(
        [[
        async function {}({}) {{
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
  s(
    "efun",
    c(1, {
      fmt(
        [[
        ({}) = {{
          {}
        }}
        ]],
        {
          i(1),
          i(0),
        }
      ),
      fmt(
        [[
        function({}) {{
          {}
        }}
        ]],
        {
          i(1),
          i(0),
        }
      ),
    })
  ),
  s(
    "aefun",
    c(1, {
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
      ),
      fmt(
        [[
        async function({}) {{
          {}
        }}
        ]],
        {
          i(1),
          i(0),
        }
      ),
    })
  ),
}
