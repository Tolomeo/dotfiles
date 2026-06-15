package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.exec_autocmds
	```
**/
@:structInit extern class ExecAutocmds {
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.buffer: integer?
		```
	**/
	var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.data: any
		```
	**/
	var data : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.group: (string|integer)?
		```
	**/
	var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.modeline: boolean?
		```
	**/
	var modeline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.pattern: (string|string[])?
		```
	**/
	var pattern : Null<haxe.extern.EitherType<String, Array<String>>>;
}