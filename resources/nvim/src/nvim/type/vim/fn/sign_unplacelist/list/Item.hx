package nvim.type.vim.fn.sign_unplacelist.list;

/**
	```lua
	(class) vim.fn.sign_unplacelist.list.item
	```
**/
@:structInit extern class Item {
	/**
		```lua
		(field) vim.fn.sign_unplacelist.list.item.buffer: (string|integer)?
		```
	**/
	var buffer : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.fn.sign_unplacelist.list.item.group: string?
		```
	**/
	var group : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_unplacelist.list.item.id: integer?
		```
	**/
	var id : Null<Int>;
}