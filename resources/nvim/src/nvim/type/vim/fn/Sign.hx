package nvim.type.vim.fn;

/**
	```lua
	(class) vim.fn.sign
	```
**/
@:structInit extern class Sign {
	/**
		```lua
		(field) vim.fn.sign.group: string
		```
	**/
	var group : String;
	/**
		```lua
		(field) vim.fn.sign.id: integer
		```
	**/
	var id : Int;
	/**
		```lua
		(field) vim.fn.sign.lnum: integer
		```
	**/
	var lnum : Int;
	/**
		```lua
		(field) vim.fn.sign.name: string
		```
	**/
	var name : String;
	/**
		```lua
		(field) vim.fn.sign.priority: integer
		```
	**/
	var priority : Int;
}