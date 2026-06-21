package nvim.type.vim.fn.getmarklist.ret;

/**
	```lua
	(class) vim.fn.getmarklist.ret.item
	```
**/
@:structInit class Item {
	/**
		```lua
		(field) vim.fn.getmarklist.ret.item.file: string
		```
	**/
	extern var file : String;
	/**
		```lua
		(field) vim.fn.getmarklist.ret.item.mark: string
		```
	**/
	extern var mark : String;
	/**
		```lua
		(field) vim.fn.getmarklist.ret.item.pos: [integer, integer, integer, integer]
		```
	**/
	extern var pos : Dynamic;
}