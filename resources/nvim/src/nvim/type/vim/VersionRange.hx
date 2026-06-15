package nvim.type.vim;

/**
	```lua
	(class) vim.VersionRange
	```
**/
@:structInit extern class VersionRange {
	/**
		```lua
		(field) vim.VersionRange.from: vim.Version
		```
	**/
	var from : nvim.type.vim.Version;
	/**
		```lua
		(field) vim.VersionRange.to: (vim.Version)?
		```
	**/
	var to : Null<nvim.type.vim.Version>;
	/**
		```lua
		(method) vim.VersionRange:has(version: string|vim.Version)
		  -> boolean
		```
	**/
	function has(version:haxe.extern.EitherType<String, nvim.type.vim.Version>):Dynamic;
}