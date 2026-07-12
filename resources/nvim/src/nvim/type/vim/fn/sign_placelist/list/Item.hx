package nvim.type.vim.fn.sign_placelist.list;

/**
	```lua
	(class) vim.fn.sign_placelist.list.item
	```
**/
@:structInit class Item {
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.buffer: string|integer
		```
	**/
	extern public var buffer : haxe.extern.EitherType<Int, String>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.group: string?
		```
	**/
	@:optional
	extern public var group : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.id: integer?
		```
	**/
	@:optional
	extern public var id : Null<Int>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.lnum: (string|integer)?
		```
	**/
	@:optional
	extern public var lnum : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.name: string
		```
	**/
	extern public var name : String;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.priority: integer?
		```
	**/
	@:optional
	extern public var priority : Null<Int>;
}