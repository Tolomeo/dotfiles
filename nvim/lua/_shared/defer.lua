-- https://github.com/runiq/neovim-throttle-debounce
local validator = require("_shared.validator")

local Defer = {}

---Throttles a function on the leading edge. Automatically `schedule_wrap()`s.
--Returns (function, timer) throttled function and timer.
--Remember to call `timer:close()` at the end or you will leak memory!
---@type fun(fn: function, ms: number): function, table
Defer.throttle_leading = validator.f.arguments({ "function", validator.f.greater_than(0) })
	.. function(fn, ms)
		local timer = vim.loop.new_timer()
		local running = false

		local function wrapped_fn(...)
			if not running then
				timer:start(ms, 0, function()
					running = false
				end)
				running = true
				pcall(vim.schedule_wrap(fn), select(1, ...))
			end
		end

		return wrapped_fn, timer
	end

---Throttles a function on the trailing edge. Automatically `schedule_wrap()`s.
--Returns (function, timer) Throttled function and timer.
--Remember to call `timer:close()` at the end or you will leak memory!
---@type fun(fn: function, ms: number): function, table
Defer.throttle_trailing = validator.f.arguments({ "function", validator.f.greater_than(0) })
	.. function(fn, ms, last)
		local timer = vim.loop.new_timer()
		local running = false

		local wrapped_fn
		if not last then
			function wrapped_fn(...)
				if not running then
					local argv = { ... }
					local argc = select("#", ...)

					timer:start(ms, 0, function()
						running = false
						pcall(vim.schedule_wrap(fn), unpack(argv, 1, argc))
					end)
					running = true
				end
			end
		else
			local argv, argc
			function wrapped_fn(...)
				argv = { ... }
				argc = select("#", ...)

				if not running then
					timer:start(ms, 0, function()
						running = false
						pcall(vim.schedule_wrap(fn), unpack(argv, 1, argc))
					end)
					running = true
				end
			end
		end
		return wrapped_fn, timer
	end

---Debounces a function on the leading edge. Automatically `schedule_wrap()`s.
--Returns (function, timer) Throttled function and timer.
--Remember to call `timer:close()` at the end or you will leak memory!
---@type fun(fn: function, ms: number): function, table
Defer.debounce_leading = validator.f.arguments({ "function", validator.f.greater_than(0) })
	.. function(fn, ms)
		local timer = vim.loop.new_timer()
		local running = false

		local function wrapped_fn(...)
			timer:start(ms, 0, function()
				running = false
			end)

			if not running then
				running = true
				pcall(vim.schedule_wrap(fn), select(1, ...))
			end
		end
		return wrapped_fn, timer
	end

---Debounces a function on the trailing edge. Automatically `schedule_wrap()`s.
--Returns (function, timer) Throttled function and timer.
--Remember to call `timer:close()` at the end or you will leak memory!
---@type fun(fn: function, ms: number): function, table
Defer.debounce_trailing = validator.f.arguments({ "function", validator.f.greater_than(0) })
	.. function(fn, ms, first)
		local timer = vim.loop.new_timer()
		local wrapped_fn

		if not first then
			function wrapped_fn(...)
				local argv = { ... }
				local argc = select("#", ...)

				timer:start(ms, 0, function()
					pcall(vim.schedule_wrap(fn), unpack(argv, 1, argc))
				end)
			end
		else
			local argv, argc
			function wrapped_fn(...)
				argv = argv or { ... }
				argc = argc or select("#", ...)

				timer:start(ms, 0, function()
					pcall(vim.schedule_wrap(fn), unpack(argv, 1, argc))
				end)
			end
		end
		return wrapped_fn, timer
	end

return Defer
