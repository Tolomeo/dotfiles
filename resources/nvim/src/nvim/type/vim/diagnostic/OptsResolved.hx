package nvim.type.vim.diagnostic;

/**
	```lua
	(field) vim.diagnostic.OptsResolved.severity_sort: { reverse: boolean }
	```
**/
@:structInit class SeveritySort {
	@:optional
	extern public var reverse : Null<Bool>;
}

/**
	```lua
	(class) vim.diagnostic.OptsResolved
	```
**/
@:structInit class OptsResolved {
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.float: vim.diagnostic.Opts.Float
		```
	**/
	extern public var float : nvim.type.vim.diagnostic.opts.Float;
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.signs: vim.diagnostic.Opts.Signs
		```
	**/
	extern public var signs : nvim.type.vim.diagnostic.opts.Signs;
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.underline: vim.diagnostic.Opts.Underline
		```
	**/
	extern public var underline : nvim.type.vim.diagnostic.opts.Underline;
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.update_in_insert: boolean
		```
	**/
	extern public var update_in_insert : Bool;
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.virtual_lines: vim.diagnostic.Opts.VirtualLines
		```
	**/
	extern public var virtual_lines : nvim.type.vim.diagnostic.opts.VirtualLines;
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.virtual_text: vim.diagnostic.Opts.VirtualText
		```
	**/
	extern public var virtual_text : nvim.type.vim.diagnostic.opts.VirtualText;
}