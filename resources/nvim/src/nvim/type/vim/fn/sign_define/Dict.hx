package nvim.type.vim.fn.sign_define;

/**
	```lua
	(class) vim.fn.sign_define.dict
	```
**/
@:structInit class Dict {
	/**
		```lua
		(field) vim.fn.sign_define.dict.culhl: string?
		```
	**/
	@:optional
	extern var culhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.icon: string?
		```
	**/
	@:optional
	extern var icon : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.linehl: string?
		```
	**/
	@:optional
	extern var linehl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.numhl: string?
		```
	**/
	@:optional
	extern var numhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.text: string
		```
	**/
	extern var text : String;
	/**
		```lua
		(field) vim.fn.sign_define.dict.texthl: string?
		```
	**/
	@:optional
	extern var texthl : Null<String>;
}