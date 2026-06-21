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
	extern var group : String;
	/**
		```lua
		(field) vim.fn.sign.id: integer
		```
	**/
	extern var id : Int;
	/**
		```lua
		(field) vim.fn.sign.lnum: integer
		```
	**/
	extern var lnum : Int;
	/**
		```lua
		(field) vim.fn.sign.name: string
		```
	**/
	extern var name : String;
	/**
		```lua
		(field) vim.fn.sign.priority: integer
		```
	**/
	extern var priority : Int;
}