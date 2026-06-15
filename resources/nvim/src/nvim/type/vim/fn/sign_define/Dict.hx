package nvim.type.vim.fn.sign_define;

/**
	```lua
	(class) vim.fn.sign_define.dict
	```
**/
@:structInit extern class Dict {
	/**
		```lua
		(field) vim.fn.sign_define.dict.culhl: string?
		```
	**/
	var culhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.icon: string?
		```
	**/
	var icon : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.linehl: string?
		```
	**/
	var linehl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.numhl: string?
		```
	**/
	var numhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.text: string
		```
	**/
	var text : String;
	/**
		```lua
		(field) vim.fn.sign_define.dict.texthl: string?
		```
	**/
	var texthl : Null<String>;
}