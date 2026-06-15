package nvim.type.vim.fn.getwininfo.ret;

/**
	```lua
	(field) vim.fn.getwininfo.ret.item.variables: table<string, any>
	```
**/
@:structInit extern class Variables {

}

/**
	```lua
	(class) vim.fn.getwininfo.ret.item
	```
**/
@:structInit extern class Item {
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.botline: integer
		```
	**/
	var botline : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.bufnr: integer
		```
	**/
	var bufnr : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.height: integer
		```
	**/
	var height : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.loclist: integer
		```
	**/
	var loclist : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.quickfix: integer
		```
	**/
	var quickfix : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.tabnr: integer
		```
	**/
	var tabnr : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.terminal: integer
		```
	**/
	var terminal : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.textoff: integer
		```
	**/
	var textoff : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.topline: integer
		```
	**/
	var topline : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.width: integer
		```
	**/
	var width : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winbar: integer
		```
	**/
	var winbar : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.wincol: integer
		```
	**/
	var wincol : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winid: integer
		```
	**/
	var winid : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winnr: integer
		```
	**/
	var winnr : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winrow: integer
		```
	**/
	var winrow : Int;
}