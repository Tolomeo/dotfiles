package nvim.type.vim.api.keyset.create_autocmd;

/**
	```lua
	(class) vim.api.keyset.create_autocmd.callback_args
	```
**/
@:structInit class CallbackArgs {
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.callback_args.buf: integer
		```
		
		---
		
		expanded value of <abuf>
	**/
	extern public var buf : Int;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.callback_args.data: any
		```
		
		---
		
		arbitrary data passed from |nvim_exec_autocmds()|                       *event-data*
	**/
	@:optional
	extern public var data : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.callback_args.event: string
		```
		
		---
		
		name of the triggered event |autocmd-events|
	**/
	extern public var event : String;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.callback_args.file: string
		```
		
		---
		
		expanded value of <afile>
	**/
	extern public var file : String;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.callback_args.group: integer?
		```
		
		---
		
		autocommand group id, if any
	**/
	@:optional
	extern public var group : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.callback_args.id: integer
		```
		
		---
		
		autocommand id
	**/
	extern public var id : Int;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.callback_args.match: string
		```
		
		---
		
		expanded value of <amatch>
	**/
	extern public var match : String;
}