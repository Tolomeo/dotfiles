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
	extern public var culhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.icon: string?
		```
	**/
	@:optional
	extern public var icon : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.linehl: string?
		```
	**/
	@:optional
	extern public var linehl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.numhl: string?
		```
	**/
	@:optional
	extern public var numhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.text: string
		```
	**/
	extern public var text : String;
	/**
		```lua
		(field) vim.fn.sign_define.dict.texthl: string?
		```
	**/
	@:optional
	extern public var texthl : Null<String>;
}