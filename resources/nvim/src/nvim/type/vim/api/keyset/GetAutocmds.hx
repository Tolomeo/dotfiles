package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_autocmds
	```
**/
@:structInit extern class GetAutocmds {
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.buffer: (integer|integer[])?
		```
	**/
	var buffer : Null<haxe.extern.EitherType<Int, Array<Int>>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.event: (string|string[])?
		```
	**/
	var event : Null<haxe.extern.EitherType<String, Array<String>>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.group: (string|integer)?
		```
	**/
	var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.id: integer?
		```
	**/
	var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.pattern: (string|string[])?
		```
	**/
	var pattern : Null<haxe.extern.EitherType<String, Array<String>>>;
}