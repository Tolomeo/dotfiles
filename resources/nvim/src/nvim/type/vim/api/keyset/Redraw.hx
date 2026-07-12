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
	extern public var buf : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.redraw.cursor: boolean?
		```
	**/
	@:optional
	extern public var cursor : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.flush: boolean?
		```
	**/
	@:optional
	extern public var flush : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.range: any[]?
		```
	**/
	@:optional
	extern public var range : Null<lua.Table<Int, Any>>;
	/**
		```lua
		(field) vim.api.keyset.redraw.statuscolumn: boolean?
		```
	**/
	@:optional
	extern public var statuscolumn : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.statusline: boolean?
		```
	**/
	@:optional
	extern public var statusline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.tabline: boolean?
		```
	**/
	@:optional
	extern public var tabline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.valid: boolean?
		```
	**/
	@:optional
	extern public var valid : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.win: integer?
		```
	**/
	@:optional
	extern public var win : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.redraw.winbar: boolean?
		```
	**/
	@:optional
	extern public var winbar : Null<Bool>;
}