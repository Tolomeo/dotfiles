package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.redraw
	```
**/
@:structInit class Redraw {
	/**
		```lua
		(field) vim.api.keyset.redraw.buf: integer?
		```
	**/
	@:optional
	extern var buf : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.redraw.cursor: boolean?
		```
	**/
	@:optional
	extern var cursor : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.flush: boolean?
		```
	**/
	@:optional
	extern var flush : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.range: any[]?
		```
	**/
	@:optional
	extern var range : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.redraw.statuscolumn: boolean?
		```
	**/
	@:optional
	extern var statuscolumn : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.statusline: boolean?
		```
	**/
	@:optional
	extern var statusline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.tabline: boolean?
		```
	**/
	@:optional
	extern var tabline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.valid: boolean?
		```
	**/
	@:optional
	extern var valid : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.win: integer?
		```
	**/
	@:optional
	extern var win : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.redraw.winbar: boolean?
		```
	**/
	@:optional
	extern var winbar : Null<Bool>;
}