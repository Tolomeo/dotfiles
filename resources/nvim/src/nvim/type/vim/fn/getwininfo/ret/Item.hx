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
	extern public var botline : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.bufnr: integer
		```
	**/
	extern public var bufnr : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.height: integer
		```
	**/
	extern public var height : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.loclist: integer
		```
	**/
	extern public var loclist : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.quickfix: integer
		```
	**/
	extern public var quickfix : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.tabnr: integer
		```
	**/
	extern public var tabnr : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.terminal: integer
		```
	**/
	extern public var terminal : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.textoff: integer
		```
	**/
	extern public var textoff : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.topline: integer
		```
	**/
	extern public var topline : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.variables: table<string, any>
		```
	**/
	extern public var variables : Variables;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.width: integer
		```
	**/
	extern public var width : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winbar: integer
		```
	**/
	extern public var winbar : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.wincol: integer
		```
	**/
	extern public var wincol : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winid: integer
		```
	**/
	extern public var winid : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winnr: integer
		```
	**/
	extern public var winnr : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winrow: integer
		```
	**/
	extern public var winrow : Int;
}