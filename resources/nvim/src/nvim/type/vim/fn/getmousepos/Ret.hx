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
	extern public var column : Float;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.line: integer
		```
	**/
	extern public var line : Float;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.screencol: integer
		```
	**/
	extern public var screencol : Float;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.screenrow: integer
		```
	**/
	extern public var screenrow : Float;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.wincol: integer
		```
	**/
	extern public var wincol : Float;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.winid: integer
		```
	**/
	extern public var winid : Float;
	/**
		```lua
		(field) vim.fn.getmousepos.ret.winrow: integer
		```
	**/
	extern public var winrow : Float;
}