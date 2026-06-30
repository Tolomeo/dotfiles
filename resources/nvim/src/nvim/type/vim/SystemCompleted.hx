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
	extern public var code : Float;
	/**
		```lua
		(field) vim.SystemCompleted.signal: integer
		```
	**/
	extern public var signal : Float;
	/**
		```lua
		(field) vim.SystemCompleted.stderr: string?
		```
	**/
	@:optional
	extern public var stderr : Null<String>;
	/**
		```lua
		(field) vim.SystemCompleted.stdout: string?
		```
	**/
	@:optional
	extern public var stdout : Null<String>;
}