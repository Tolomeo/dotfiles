-- https://github.com/luvit/luvit/blob/master/deps/los.lua

local jit = require("jit")

local map = {
	["Windows"] = "win32",
	["Linux"] = "linux",
	["OSX"] = "darwin",
	["BSD"] = "bsd",
	["POSIX"] = "posix",
	["Other"] = "other",
}

local function type()
	return map[jit.os]
end

-- https://github.com/neovim/neovim/issues/12642#issuecomment-658944841
local function is_wsl()
	if type() ~= "linux" then
		return false
	end

	local proc_version = "/proc/version"

	-- Check for file readability using vim.fn.filereadable
	if vim.fn.filereadable(proc_version) == 1 then
		-- Read file contents using vim.fn.readfile
		local file_contents = vim.fn.readfile(proc_version, "", 1)

		-- Use string.match to search for 'microsoft', returning true if found
		for _, line in pairs(file_contents) do
			if string.match(line, "microsoft") then
				return true
			end
		end
	end

	-- If not found, return false
	return false
end

return { type = type, is_wsl = is_wsl }
