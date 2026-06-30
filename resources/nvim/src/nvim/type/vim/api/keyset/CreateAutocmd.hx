package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.create_autocmd
	```
**/
@:structInit class CreateAutocmd {
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.buffer: integer?
		```
	**/
	@:optional
	extern public var buffer : Null<Float>;
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
	@:optional
	extern public var callback : Null<haxe.extern.EitherType<String, (args:nvim.type.vim.api.keyset.create_autocmd.CallbackArgs) -> Null<Bool>>>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.command: string?
		```
	**/
	@:optional
	extern public var command : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.desc: string?
		```
	**/
	@:optional
	extern public var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.group: (string|integer)?
		```
	**/
	@:optional
	extern public var group : Null<haxe.extern.EitherType<Float, String>>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.nested: boolean?
		```
	**/
	@:optional
	extern public var nested : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.once: boolean?
		```
	**/
	@:optional
	extern public var once : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.pattern: (string|string[])?
		```
	**/
	@:optional
	extern public var pattern : Null<haxe.extern.EitherType<String, lua.Table<Int, String>>>;
}