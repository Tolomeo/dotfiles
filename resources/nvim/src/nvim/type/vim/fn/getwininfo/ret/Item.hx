package nvim.type.vim.fn.getwininfo.ret;

/**
	```lua
	(field) vim.fn.getwininfo.ret.item.variables: table<string, any>
	```
**/
@:structInit class Variables {

}

/**
	```lua
	(class) vim.fn.getwininfo.ret.item
	```
**/
@:structInit class Item {
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.botline: integer
		```
	**/
	extern public var botline : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.bufnr: integer
		```
	**/
	extern public var bufnr : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.height: integer
		```
	**/
	extern public var height : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.loclist: integer
		```
	**/
	extern public var loclist : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.quickfix: integer
		```
	**/
	extern public var quickfix : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.tabnr: integer
		```
	**/
	extern public var tabnr : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.terminal: integer
		```
	**/
	extern public var terminal : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.textoff: integer
		```
	**/
	extern public var textoff : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.topline: integer
		```
	**/
	extern public var topline : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.width: integer
		```
	**/
	extern public var width : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winbar: integer
		```
	**/
	extern public var winbar : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.wincol: integer
		```
	**/
	extern public var wincol : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winid: integer
		```
	**/
	extern public var winid : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winnr: integer
		```
	**/
	extern public var winnr : Float;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winrow: integer
		```
	**/
	extern public var winrow : Float;
}