package nvim.type.vim;

/**
	```lua
	(class) vim.SystemOpts
	```
**/
@:structInit class SystemOpts {
	/**
		```lua
		(field) vim.SystemOpts.clear_env: boolean?
		```
	**/
	@:optional
	extern public var clear_env : Null<Bool>;
	/**
		```lua
		(field) vim.SystemOpts.cwd: string?
		```
	**/
	@:optional
	extern public var cwd : Null<String>;
	/**
		```lua
		(field) vim.SystemOpts.detach: boolean?
		```
	**/
	@:optional
	extern public var detach : Null<Bool>;
	/**
		```lua
		(field) vim.SystemOpts.env: table<string, string|number>?
		```
	**/
	@:optional
	extern public var env : Null<lua.Table<String, haxe.extern.EitherType<String, Float>>>;
	/**
		```lua
		(field) vim.SystemOpts.stderr: (fun(err?: string, data?: string)|false)?
		```
		
		---
		
		```lua
		function (err: string?, data: string?)
		```
	**/
	@:optional
	extern public var stderr : Null<haxe.extern.EitherType<(?err:Null<String>, ?data:Null<String>) -> Dynamic, Bool>>;
	/**
		```lua
		(field) vim.SystemOpts.stdin: (string|string[]|true)?
		```
	**/
	@:optional
	extern public var stdin : Null<haxe.extern.EitherType<String, haxe.extern.EitherType<lua.Table<Int, String>, Bool>>>;
	/**
		```lua
		(field) vim.SystemOpts.stdout: (fun(err?: string, data?: string)|false)?
		```
		
		---
		
		```lua
		function (err: string?, data: string?)
		```
	**/
	@:optional
	extern public var stdout : Null<haxe.extern.EitherType<(?err:Null<String>, ?data:Null<String>) -> Dynamic, Bool>>;
	/**
		```lua
		(field) vim.SystemOpts.text: boolean?
		```
	**/
	@:optional
	extern public var text : Null<Bool>;
	/**
		```lua
		(field) vim.SystemOpts.timeout: integer?
		```
		
		---
		
		Timeout in ms
	**/
	@:optional
	extern public var timeout : Null<Float>;
}