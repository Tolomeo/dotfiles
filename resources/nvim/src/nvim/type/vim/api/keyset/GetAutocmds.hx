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
	extern var buffer : Null<haxe.extern.EitherType<Int, Array<Int>>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.event: (string|string[])?
		```
	**/
	@:optional
	extern var event : Null<haxe.extern.EitherType<String, Array<String>>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.group: (string|integer)?
		```
	**/
	@:optional
	extern var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.id: integer?
		```
	**/
	@:optional
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.pattern: (string|string[])?
		```
	**/
	@:optional
	extern var pattern : Null<haxe.extern.EitherType<String, Array<String>>>;
}