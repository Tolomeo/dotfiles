package nvim.module.vim;

extern class Version {
	/**
		```lua
		function M.cmp(v1: string|number[]|vim.Version, v2: string|number[]|vim.Version)
		  -> integer
		```
		
		---
		
		 Parses and compares two version objects (the result of |vim.version.parse()|, or
		 specified literally as a `{major, minor, patch}` tuple, e.g. `{1, 0, 3}`).
		
		 Example:
		
		 ```lua
		 if vim.version.cmp({1,0,3}, {0,2,1}) == 0 then
		   -- ...
		 end
		 local v1 = vim.version.parse('1.0.3-pre')
		 local v2 = vim.version.parse('0.2.1')
		 if vim.version.cmp(v1, v2) == 0 then
		   -- ...
		 end
		 ```
		
		 @note Per semver, build metadata is ignored when comparing two otherwise-equivalent versions.
		 @since 11
		
		@*param* `v1` — Version object.
		
		@*param* `v2` — Version to compare with `v1`.
		
		@*return* — -1 if `v1 < v2`, 0 if `v1 == v2`, 1 if `v1 > v2`.
	**/
	@:luaDotMethod
	function cmp(v1:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>, v2:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>):Float;
	/**
		```lua
		function M.eq(v1: string|number[]|vim.Version, v2: string|number[]|vim.Version)
		  -> boolean
		```
		
		---
		
		Returns `true` if the given versions are equal. See |vim.version.cmp()| for usage.
	**/
	@:luaDotMethod
	function eq(v1:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>, v2:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>):Bool;
	/**
		```lua
		function M.ge(v1: string|number[]|vim.Version, v2: string|number[]|vim.Version)
		  -> boolean
		```
		
		---
		
		Returns `true` if `v1 >= v2`. See |vim.version.cmp()| for usage.
	**/
	@:luaDotMethod
	function ge(v1:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>, v2:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>):Bool;
	/**
		```lua
		function M.gt(v1: string|number[]|vim.Version, v2: string|number[]|vim.Version)
		  -> boolean
		```
		
		---
		
		Returns `true` if `v1 > v2`. See |vim.version.cmp()| for usage.
	**/
	@:luaDotMethod
	function gt(v1:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>, v2:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>):Bool;
	/**
		```lua
		function M.last(versions: <T:vim.Version>[])
		  -> <T:vim.Version>?
		```
		
		---
		
		TODO: generalize this, move to func.lua
	**/
	@:luaDotMethod
	function last<T:(nvim.type.vim.Version)>(versions:lua.Table<Int, T>):Null<T>;
	/**
		```lua
		function M.le(v1: string|number[]|vim.Version, v2: string|number[]|vim.Version)
		  -> boolean
		```
		
		---
		
		Returns `true` if `v1 <= v2`. See |vim.version.cmp()| for usage.
	**/
	@:luaDotMethod
	function le(v1:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>, v2:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>):Bool;
	/**
		```lua
		function M.lt(v1: string|number[]|vim.Version, v2: string|number[]|vim.Version)
		  -> boolean
		```
		
		---
		
		Returns `true` if `v1 < v2`. See |vim.version.cmp()| for usage.
	**/
	@:luaDotMethod
	function lt(v1:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>, v2:haxe.extern.EitherType<nvim.type.vim.Version, haxe.extern.EitherType<lua.Table<Int, Float>, String>>):Bool;
	/**
		```lua
		function M.parse(version: string, opts: table|nil)
		  -> parsed_version: (vim.Version)?
		```
		
		---
		
		 Parses a semantic version string and returns a version object which can be used with other
		 `vim.version` functions. For example "1.0.1-rc1+build.2" returns:
		
		 ```
		 { major = 1, minor = 0, patch = 1, prerelease = "rc1", build = "build.2" }
		 ```
		
		
		@*param* `version` — Version string to parse.
		
		@*param* `opts` — Optional keyword arguments:
		
		                      - strict (boolean):  Default false. If `true`, no coercion is attempted on
		                      input not conforming to semver v2.0.0. If `false`, `parse()` attempts to
		                      coerce input such as "1.0", "0-x", "tmux 3.2a" into valid versions.
		
		@*return* `parsed_version` — Version object or `nil` if input is invalid.
	**/
	@:luaDotMethod
	function parse(version:String, ?opts:Null<lua.Table.AnyTable>):Null<nvim.type.vim.Version>;
	/**
		```lua
		function M.range(spec: string)
		  -> (vim.VersionRange)?
		```
		
		---
		
		 Parses a semver |version-range| "spec" and returns a range object:
		
		 ```
		 {
		   from: Version
		   to: Version
		   has(v: string|Version)
		 }
		 ```
		
		 `:has()` checks if a version is in the range (inclusive `from`, exclusive `to`).
		
		 Example:
		
		 ```lua
		 local r = vim.version.range('1.0.0 - 2.0.0')
		 print(r:has('1.9.9'))       -- true
		 print(r:has('2.0.0'))       -- false
		 print(r:has(vim.version())) -- check against current Nvim version
		 ```
		
		 Or use cmp(), le(), lt(), ge(), gt(), and/or eq() to compare a version
		 against `.to` and `.from` directly:
		
		 ```lua
		 local r = vim.version.range('1.0.0 - 2.0.0') -- >=1.0, <2.0
		 print(vim.version.ge({1,0,3}, r.from) and vim.version.lt({1,0,3}, r.to))
		 ```
		
		 @see # https://github.com/npm/node-semver#ranges
		 @since 11
		
		@*param* `spec` — Version range "spec"
		
		 Adapted from https://github.com/folke/lazy.nvim
	**/
	@:luaDotMethod
	function range(spec:String):Null<nvim.type.vim.VersionRange>;
}