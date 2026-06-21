package nvim.type.vim.fn.winrestview;

/**
	```lua
	(class) vim.fn.winrestview.dict
	```
**/
@:structInit class Dict {
	/**
		```lua
		(field) vim.fn.winrestview.dict.col: integer?
		```
	**/
	@:optional
	extern var col : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.coladd: integer?
		```
	**/
	@:optional
	extern var coladd : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.curswant: integer?
		```
	**/
	@:optional
	extern var curswant : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.leftcol: integer?
		```
	**/
	@:optional
	extern var leftcol : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.lnum: integer?
		```
	**/
	@:optional
	extern var lnum : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.skipcol: integer?
		```
	**/
	@:optional
	extern var skipcol : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.topfill: integer?
		```
	**/
	@:optional
	extern var topfill : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.topline: integer?
		```
	**/
	@:optional
	extern var topline : Null<Int>;
}