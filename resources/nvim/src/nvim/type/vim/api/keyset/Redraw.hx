package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.redraw
	```
**/
@:structInit extern class Redraw {
	/**
		```lua
		(field) vim.api.keyset.redraw.buf: integer?
		```
	**/
	var buf : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.redraw.cursor: boolean?
		```
	**/
	var cursor : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.flush: boolean?
		```
	**/
	var flush : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.range: any[]?
		```
	**/
	var range : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.redraw.statuscolumn: boolean?
		```
	**/
	var statuscolumn : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.statusline: boolean?
		```
	**/
	var statusline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.tabline: boolean?
		```
	**/
	var tabline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.valid: boolean?
		```
	**/
	var valid : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.win: integer?
		```
	**/
	var win : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.redraw.winbar: boolean?
		```
	**/
	var winbar : Null<Bool>;
}