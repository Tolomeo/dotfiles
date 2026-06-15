package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.buf_delete
	```
**/
@:structInit extern class BufDelete {
	/**
		```lua
		(field) vim.api.keyset.buf_delete.force: boolean?
		```
	**/
	var force : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.buf_delete.unload: boolean?
		```
	**/
	var unload : Null<Bool>;
}