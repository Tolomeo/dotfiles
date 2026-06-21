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
	extern var botline : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.bufnr: integer
		```
	**/
	extern var bufnr : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.height: integer
		```
	**/
	extern var height : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.loclist: integer
		```
	**/
	extern var loclist : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.quickfix: integer
		```
	**/
	extern var quickfix : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.tabnr: integer
		```
	**/
	extern var tabnr : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.terminal: integer
		```
	**/
	extern var terminal : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.textoff: integer
		```
	**/
	extern var textoff : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.topline: integer
		```
	**/
	extern var topline : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.width: integer
		```
	**/
	extern var width : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winbar: integer
		```
	**/
	extern var winbar : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.wincol: integer
		```
	**/
	extern var wincol : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winid: integer
		```
	**/
	extern var winid : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winnr: integer
		```
	**/
	extern var winnr : Int;
	/**
		```lua
		(field) vim.fn.getwininfo.ret.item.winrow: integer
		```
	**/
	extern var winrow : Int;
}