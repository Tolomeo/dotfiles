local Module = require("_shared.module")

local Integration = Module:extend({
	modules = {
		"integration.terminal",
		"integration.location",
		"integration.finder",
	},
})

return Integration:new()
