local build = require("loop-build.build")

---@param ext_data loop.ExtensionData
local function make_tasktype_provider(ext_data)
    ---@type loop.TaskTypeProvider
    return {
        get_task_schema = function()
            return require("loop-build.schema")
        end,
        start_one_task = function(task, page_group, on_exit)
            ---@cast task loop.coretasks.build.Task
            return build.start_task(ext_data, task, page_group, on_exit)
        end
    }
end

---@param ext_data loop.ExtensionData
local function _make_template_provider(ext_data)
    ---@type loop.TaskTemplateProvider
    return {
        get_task_templates = function()
            return require("loop-build.templates")
        end,
    }
end

---@type loop.Extension
local extension =
{
    on_workspace_load = function(ext_data)
        ext_data.register_task_type("build", make_tasktype_provider(ext_data))
        ext_data.register_task_templates("Build", _make_template_provider(ext_data))
    end,
    on_workspace_unload = function(ext_data)
    end,
}

return extension
