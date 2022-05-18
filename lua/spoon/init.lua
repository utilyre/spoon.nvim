local M = {}

local defaults = require("spoon.defaults")

M.setup = function(opts)
  -- Merges the given opts with default opts (prefers theirs)
  if opts == nil then opts = {} end
  for key, value in pairs(defaults.opts) do
    if opts[key] ~= nil then goto continue end

    opts[key] = value

    ::continue::
  end
end

return M
