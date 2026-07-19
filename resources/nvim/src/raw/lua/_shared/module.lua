local Object = require("_shared.object")
local logger = require("_shared.logger")

---@alias ModuleSpec string | { [1]: string, [2]: string }

---@class Modules
local Modules = {}

function Modules:require(module_path, module_name)
	local module_id = module_name and string.format("%s['%s']", module_path, module_name) or module_path

	if self[module_id] then
		return self[module_id]
	end

	return nil
end

---@param module_path string
---@param module_name string | nil
function Modules:load(module_path, module_name)
	local module_id = module_name and string.format("%s['%s']", module_path, module_name) or module_path

	local ok, module = pcall(require, module_path)

	if not ok then
		return false, nil
	end

	self[module_id] = module_name and module[module_name].new() or module

	return true, self[module_id]
end

---Represents a configuration module
local Module = Object:extend({
	plugins = {},
	modules = {},
	setup = function() end,
})

---@diagnostic disable-next-line
function Module:constructor()
	for _, child_module in ipairs(self.modules) do
		local success, loaded = Modules:load(self.to_spec(child_module))

		if not success then
			logger.error(
				string.format(
					"Failed to load configuration module '%s' with the error: %s",
					child_module,
					loaded
				)
			)
		end
	end
end

---@param spec string | Array<string>
---@return string
---@return string | nil
function Module.to_spec(spec)
	if type(spec) == "string" then
		return spec, nil
	end

	if type(spec) == "table" then
		return spec[1], spec[2]
	end

	error(string.format("Invalid module spec %s", vim.inspect(spec)))
end

--- Initializes the module
function Module:init()
	self:setup()

	for _, child in ipairs(self.modules) do
		local child_module = Modules:require(self.to_spec(child))

		if not child_module then
			logger.error(
				string.format("Cannot initialize module '%s' with the error: the module was not loaded", child)
			)
			goto continue
		end

		---@diagnostic disable-next-line
		child_module:init()

		::continue::
	end
end

--[[ function Module:require(module_name)
	return Modules:require(module_name)
end ]]

--- Returns a list of all the plugins used by the module and by its children
---@return table
function Module:list_plugins()
	local plugins = vim.deepcopy(self.plugins)
	local child_modules = self.modules

	for _, child in ipairs(child_modules) do
		local child_module = Modules:require(self.to_spec(child))

		if not child_module then
			logger.error(
				string.format("Failed to list plugins for '%s' module: the module was not found", child)
			)
			goto continue
		end

		---@diagnostic disable-next-line
		local child_module_plugins = child_module:list_plugins()

		for _, child_module_plugin in ipairs(child_module_plugins) do
			table.insert(plugins, child_module_plugin)
		end

		::continue::
	end

	return plugins
end

--[[ --- Returns a tree structure of all modules
---@return table
function Module:list_modules()
	return map.reduce(
		self.modules,
		function(_modules, module, module_name)
			_modules[module_name] = module:list_modules()
			return _modules
		end,
		setmetatable({}, {
			__index = self,
		})
	)
end ]]

return Module
