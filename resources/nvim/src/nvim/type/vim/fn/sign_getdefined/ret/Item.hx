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
	extern var culhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.icon: string?
		```
	**/
	@:optional
	extern var icon : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.linehl: string?
		```
	**/
	@:optional
	extern var linehl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.name: string
		```
	**/
	extern var name : String;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.numhl: string?
		```
	**/
	@:optional
	extern var numhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.text: string
		```
	**/
	extern var text : String;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.texthl: string?
		```
	**/
	@:optional
	extern var texthl : Null<String>;
}