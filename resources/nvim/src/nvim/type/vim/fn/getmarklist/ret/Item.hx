package nvim.type.vim.fn.getmarklist.ret;

/**
	```lua
	(class) vim.fn.getmarklist.ret.item
	```
**/
@:structInit extern class Item {
	/**
		```lua
		(field) vim.fn.getmarklist.ret.item.file: string
		```
	**/
	var file : String;
	/**
		```lua
		(field) vim.fn.getmarklist.ret.item.mark: string
		```
	**/
	var mark : String;
	/**
		```lua
		(field) vim.fn.getmarklist.ret.item.pos: [integer, integer, integer, integer]
		```
	**/
	var pos : Dynamic;
}