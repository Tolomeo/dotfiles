package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.option
	```
**/
@:structInit class Option {
	/**
		```lua
		(field) vim.api.keyset.option.buf: integer?
		```
	**/
	@:optional
	extern var buf : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.option.filetype: string?
		```
	**/
	@:optional
	extern var filetype : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.option.scope: string?
		```
	**/
	@:optional
	extern var scope : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.option.win: integer?
		```
	**/
	@:optional
	extern var win : Null<Int>;
}