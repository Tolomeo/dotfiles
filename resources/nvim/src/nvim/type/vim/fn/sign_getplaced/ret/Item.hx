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
	extern public var bufnr : Float;
	/**
		```lua
		(field) vim.fn.sign_getplaced.ret.item.signs: vim.fn.sign[]
		```
	**/
	extern public var signs : lua.Table<Int, nvim.type.vim.fn.Sign>;
}