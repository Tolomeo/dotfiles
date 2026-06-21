package nvim.type.vim;

/**
	```lua
	(class) vim.VersionRange
	```
**/
@:structInit class VersionRange {
	/**
		```lua
		(field) vim.VersionRange.from: vim.Version
		```
	**/
	extern var from : nvim.type.vim.Version;
	/**
		```lua
		(field) vim.VersionRange.to: (vim.Version)?
		```
	**/
	@:optional
	extern var to : Null<nvim.type.vim.Version>;
	/**
		```lua
		(method) vim.VersionRange:has(version: string|vim.Version)
		  -> boolean
		```
	**/
	extern function has(version:haxe.extern.EitherType<String, nvim.type.vim.Version>):Dynamic;
}