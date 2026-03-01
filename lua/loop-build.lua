-- lua/loop/init.lua
local M = {}

-- Dependencies
local config = require("loop-build.config")
local build = require("loop-build.build")

-----------------------------------------------------------
-- Defaults
-----------------------------------------------------------

---@type loop-build.Config
local DEFAULT_CONFIG = {
}

-----------------------------------------------------------
-- State
-----------------------------------------------------------

local setup_done = false
local initialized = false

-----------------------------------------------------------
-- Setup (user config only)
-----------------------------------------------------------

---@param opts loop-build.Config?
function M.setup(opts)
    if vim.fn.has("nvim-0.10") ~= 1 then
        error("loop.nvim requires Neovim >= 0.10")
    end

    config.current = vim.tbl_deep_extend("force", DEFAULT_CONFIG, opts or {})
    setup_done = true

    M.init()
end

-----------------------------------------------------------
-- Initialization (runs once)
-----------------------------------------------------------

function M.init()
    if initialized then
        return
    end
    initialized = true

    -- Apply defaults if setup() was never called
    if not setup_done then
        config.current = DEFAULT_CONFIG
    end
end

---@param name string
---@param matcher fun(line:string,context:table):loop.task.QuickFixItem?
function M.register_quickfix_matcher(name, matcher)
    build.register_qfmatcher(name, matcher)
end

return M
