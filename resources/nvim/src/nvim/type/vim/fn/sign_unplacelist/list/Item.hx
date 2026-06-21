package nvim.type.vim.fn.sign_unplacelist.list;

/**
	```lua
	(class) vim.fn.sign_unplacelist.list.item
	```
**/
@:structInit class Item {
	/**
		```lua
		(field) vim.fn.sign_unplacelist.list.item.buffer: (string|integer)?
		```
	**/
	@:optional
	extern var buffer : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.fn.sign_unplacelist.list.item.group: string?
		```
	**/
	@:optional
	extern var group : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_unplacelist.list.item.id: integer?
		```
	**/
	@:optional
	extern var id : Null<Int>;
}