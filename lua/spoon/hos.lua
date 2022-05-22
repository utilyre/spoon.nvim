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

local M = {}

---Has the same text as the given node
---@param node table
---@return table
M.same = function(node)
  return f(function(args)
    local text = args[1][1] or ""
    return text
  end, node)
end

---Inserts current time
---@param format string
---@return table
M.time = function(format)
  return f(function()
    local date = vim.fn.strftime(format)
    return date
  end)
end

return M
