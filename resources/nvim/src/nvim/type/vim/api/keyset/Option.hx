package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.option
	```
**/
@:structInit extern class Option {
	/**
		```lua
		(field) vim.api.keyset.option.buf: integer?
		```
	**/
	var buf : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.option.filetype: string?
		```
	**/
	var filetype : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.option.scope: string?
		```
	**/
	var scope : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.option.win: integer?
		```
	**/
	var win : Null<Int>;
}