package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.exec_autocmds
	```
**/
@:structInit class ExecAutocmds {
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.buffer: integer?
		```
	**/
	@:optional
	extern public var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.data: any
		```
	**/
	@:optional
	extern public var data : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.group: (string|integer)?
		```
	**/
	@:optional
	extern public var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.modeline: boolean?
		```
	**/
	@:optional
	extern public var modeline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.pattern: (string|string[])?
		```
	**/
	@:optional
	extern public var pattern : Null<haxe.extern.EitherType<String, lua.Table<Int, String>>>;
}