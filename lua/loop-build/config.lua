---@class loop-build.Config
---@field quickfix_matchers table<string,function>?

local M = {}

---@type loop-build.Config|nil
M.current = nil

return M
