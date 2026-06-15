package nvim.type.vim.fn.sign_getdefined.ret;

/**
	```lua
	(class) vim.fn.sign_getdefined.ret.item
	```
**/
@:structInit extern class Item {
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.culhl: string?
		```
	**/
	var culhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.icon: string?
		```
	**/
	var icon : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.linehl: string?
		```
	**/
	var linehl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.name: string
		```
	**/
	var name : String;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.numhl: string?
		```
	**/
	var numhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.text: string
		```
	**/
	var text : String;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.texthl: string?
		```
	**/
	var texthl : Null<String>;
}