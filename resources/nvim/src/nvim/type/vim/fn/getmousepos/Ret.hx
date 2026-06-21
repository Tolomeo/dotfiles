package nvim.type.vim.fn.getmousepos;

/**
	```lua
	(class) vim.fn.getmousepos.ret
	```
**/
@:structInit class Ret {
	/**
		```lua
		(field) vim.fn.getmousepos.ret.column: integer
		```
	**/
	extern var column : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.line: integer
		```
	**/
	extern var line : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.screencol: integer
		```
	**/
	extern var screencol : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.screenrow: integer
		```
	**/
	extern var screenrow : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.wincol: integer
		```
	**/
	extern var wincol : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.winid: integer
		```
	**/
	extern var winid : Int;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.winrow: integer
		```
	**/
	extern var winrow : Int;
}