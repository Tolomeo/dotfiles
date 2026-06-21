package nvim.type.vim.fn.sign_getplaced.ret;

/**
	```lua
	(class) vim.fn.sign_getplaced.ret.item
	```
**/
@:structInit class Item {
	/**
		```lua
		(field) vim.fn.sign_getplaced.ret.item.bufnr: integer
		```
	**/
	extern var bufnr : Int;
	/**
		```lua
		(field) vim.fn.sign_getplaced.ret.item.signs: vim.fn.sign[]
		```
	**/
	extern var signs : Array<nvim.type.vim.fn.Sign>;
}