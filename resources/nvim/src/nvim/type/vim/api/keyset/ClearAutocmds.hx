package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.clear_autocmds
	```
**/
@:structInit class ClearAutocmds {
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.buffer: integer?
		```
	**/
	@:optional
	extern public var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.event: (string|string[])?
		```
	**/
	@:optional
	extern public var event : Null<haxe.extern.EitherType<String, lua.Table<Int, String>>>;
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.group: (string|integer)?
		```
	**/
	@:optional
	extern public var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.pattern: (string|string[])?
		```
	**/
	@:optional
	extern public var pattern : Null<haxe.extern.EitherType<String, lua.Table<Int, String>>>;
}