-- lua/loop/init.lua
local M = {}

---@param name string
---@param matcher fun(line:string,context:table):loop.task.QuickFixItem?
function M.register_quickfix_matcher(name, matcher)
    local build = require("loop-build.build")
    build.register_qfmatcher(name, matcher)
end

return M
