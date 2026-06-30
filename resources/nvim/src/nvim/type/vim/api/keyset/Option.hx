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
	extern public var buf : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.option.filetype: string?
		```
	**/
	@:optional
	extern public var filetype : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.option.scope: string?
		```
	**/
	@:optional
	extern public var scope : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.option.win: integer?
		```
	**/
	@:optional
	extern public var win : Null<Float>;
}