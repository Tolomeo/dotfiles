package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.create_autocmd
	```
**/
@:structInit extern class CreateAutocmd {
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.buffer: integer?
		```
	**/
	var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.callback: (string|fun(args: vim.api.keyset.create_autocmd.callback_args):boolean?)?
		```
		
		---
		
		```lua
		function (args: vim.api.keyset.create_autocmd.callback_args)
		  -> boolean?
		```
	**/
	var callback : Null<haxe.extern.EitherType<String, (args:nvim.type.vim.api.keyset.create_autocmd.CallbackArgs) -> Null<Bool>>>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.command: string?
		```
	**/
	var command : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.desc: string?
		```
	**/
	var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.group: (string|integer)?
		```
	**/
	var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.nested: boolean?
		```
	**/
	var nested : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.once: boolean?
		```
	**/
	var once : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.pattern: (string|string[])?
		```
	**/
	var pattern : Null<haxe.extern.EitherType<String, Array<String>>>;
}