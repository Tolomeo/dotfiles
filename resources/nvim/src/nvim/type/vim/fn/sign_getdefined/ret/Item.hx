package nvim.type.vim.fn.sign_getdefined.ret;

/**
	```lua
	(class) vim.fn.sign_getdefined.ret.item
	```
**/
@:structInit class Item {
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.culhl: string?
		```
	**/
	@:optional
	extern public var culhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.icon: string?
		```
	**/
	@:optional
	extern public var icon : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.linehl: string?
		```
	**/
	@:optional
	extern public var linehl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.name: string
		```
	**/
	extern public var name : String;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.numhl: string?
		```
	**/
	@:optional
	extern public var numhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.text: string
		```
	**/
	extern public var text : String;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.texthl: string?
		```
	**/
	@:optional
	extern public var texthl : Null<String>;
}