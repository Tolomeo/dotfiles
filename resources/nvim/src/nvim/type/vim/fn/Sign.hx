package nvim.type.vim.fn;

/**
	```lua
	(class) vim.fn.sign
	```
**/
@:structInit class Sign {
	/**
		```lua
		(field) vim.fn.sign.group: string
		```
	**/
	extern public var group : String;
	/**
		```lua
		(field) vim.fn.sign.id: integer
		```
	**/
	extern public var id : Int;
	/**
		```lua
		(field) vim.fn.sign.lnum: integer
		```
	**/
	extern public var lnum : Int;
	/**
		```lua
		(field) vim.fn.sign.name: string
		```
	**/
	extern public var name : String;
	/**
		```lua
		(field) vim.fn.sign.priority: integer
		```
	**/
	extern public var priority : Int;
}