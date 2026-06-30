package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_autocmds
	```
**/
@:structInit class GetAutocmds {
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.buffer: (integer|integer[])?
		```
	**/
	@:optional
	extern public var buffer : Null<haxe.extern.EitherType<Float, lua.Table<Int, Float>>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.event: (string|string[])?
		```
	**/
	@:optional
	extern public var event : Null<haxe.extern.EitherType<String, lua.Table<Int, String>>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.group: (string|integer)?
		```
	**/
	@:optional
	extern public var group : Null<haxe.extern.EitherType<Float, String>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.id: integer?
		```
	**/
	@:optional
	extern public var id : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.pattern: (string|string[])?
		```
	**/
	@:optional
	extern public var pattern : Null<haxe.extern.EitherType<String, lua.Table<Int, String>>>;
}