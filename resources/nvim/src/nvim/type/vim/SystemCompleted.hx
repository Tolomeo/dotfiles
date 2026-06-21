package nvim.type.vim;

/**
	```lua
	(class) vim.SystemCompleted
	```
**/
@:structInit class SystemCompleted {
	/**
		```lua
		(field) vim.SystemCompleted.code: integer
		```
	**/
	extern var code : Int;
	/**
		```lua
		(field) vim.SystemCompleted.signal: integer
		```
	**/
	extern var signal : Int;
	/**
		```lua
		(field) vim.SystemCompleted.stderr: string?
		```
	**/
	@:optional
	extern var stderr : Null<String>;
	/**
		```lua
		(field) vim.SystemCompleted.stdout: string?
		```
	**/
	@:optional
	extern var stdout : Null<String>;
}