package nvim.type.vim;

/**
	```lua
	(class) vim.SystemOpts
	```
**/
@:structInit extern class SystemOpts {
	/**
		```lua
		(field) vim.SystemOpts.clear_env: boolean?
		```
	**/
	var clear_env : Null<Bool>;
	/**
		```lua
		(field) vim.SystemOpts.cwd: string?
		```
	**/
	var cwd : Null<String>;
	/**
		```lua
		(field) vim.SystemOpts.detach: boolean?
		```
	**/
	var detach : Null<Bool>;
	/**
		```lua
		(field) vim.SystemOpts.env: table<string, string|number>?
		```
	**/
	var env : Null<lua.Table<String, haxe.extern.EitherType<String, Float>>>;
	/**
		```lua
		(field) vim.SystemOpts.stderr: (fun(err?: string, data?: string)|false)?
		```
		
		---
		
		```lua
		function (err: string?, data: string?)
		```
	**/
	var stderr : Null<haxe.extern.EitherType<(err:Null<String>, data:Null<String>) -> Dynamic, Bool>>;
	/**
		```lua
		(field) vim.SystemOpts.stdin: (string|string[]|true)?
		```
	**/
	var stdin : Null<haxe.extern.EitherType<String, haxe.extern.EitherType<Array<String>, Bool>>>;
	/**
		```lua
		(field) vim.SystemOpts.stdout: (fun(err?: string, data?: string)|false)?
		```
		
		---
		
		```lua
		function (err: string?, data: string?)
		```
	**/
	var stdout : Null<haxe.extern.EitherType<(err:Null<String>, data:Null<String>) -> Dynamic, Bool>>;
	/**
		```lua
		(field) vim.SystemOpts.text: boolean?
		```
	**/
	var text : Null<Bool>;
	/**
		```lua
		(field) vim.SystemOpts.timeout: integer?
		```
		
		---
		
		Timeout in ms
	**/
	var timeout : Null<Int>;
}