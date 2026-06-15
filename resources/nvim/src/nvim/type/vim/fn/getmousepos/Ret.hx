package nvim.type.vim.fn.getmousepos;

/**
	```lua
	(class) vim.fn.getmousepos.ret
	```
**/
@:structInit extern class Ret {
	/**
		```lua
		(field) vim.fn.getmousepos.ret.column: integer
		```
	**/
	var column : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.line: integer
		```
	**/
	var line : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.screencol: integer
		```
	**/
	var screencol : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.screenrow: integer
		```
	**/
	var screenrow : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.wincol: integer
		```
	**/
	var wincol : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.winid: integer
		```
	**/
	var winid : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.winrow: integer
		```
	**/
	var winrow : Int;
}