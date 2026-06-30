package nvim.type.vim.filetype.add;

/**
	```lua
	(class) vim.filetype.add.filetypes
	```
**/
@:structInit class Filetypes {
	/**
		```lua
		(field) vim.filetype.add.filetypes.extension: table<string, string|[string|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?, { priority: number }]|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?>?
		```
	**/
	@:optional
	extern public var extension : Null<nvim.type.vim.filetype.Mapping>;
	/**
		```lua
		(field) vim.filetype.add.filetypes.filename: table<string, string|[string|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?, { priority: number }]|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?>?
		```
	**/
	@:optional
	extern public var filename : Null<nvim.type.vim.filetype.Mapping>;
	/**
		```lua
		(field) vim.filetype.add.filetypes.pattern: table<string, string|[string|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?, { priority: number }]|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?>?
		```
		
		---
		
		 @inlinedoc
	**/
	@:optional
	extern public var pattern : Null<nvim.type.vim.filetype.Mapping>;
}