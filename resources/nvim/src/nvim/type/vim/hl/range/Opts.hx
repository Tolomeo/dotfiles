package nvim.type.vim.hl.range;

/**
	```lua
	(class) vim.hl.range.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.hl.range.Opts.inclusive: boolean?
		```
		
		---
		
		
		 Indicates whether the range is end-inclusive
		 (default: `false`)
	**/
	var inclusive : Null<Bool>;
	/**
		```lua
		(field) vim.hl.range.Opts.priority: integer?
		```
		
		---
		
		
		 Highlight priority
		 (default: `vim.hl.priorities.user`)
	**/
	var priority : Null<Int>;
	/**
		```lua
		(field) vim.hl.range.Opts.regtype: string?
		```
		
		---
		
		 @inlinedoc
		
		 Type of range. See [getregtype()]
		 (default: `'v'` i.e. charwise)
	**/
	var regtype : Null<String>;
	/**
		```lua
		(field) vim.hl.range.Opts.timeout: integer?
		```
		
		---
		
		
		 Time in ms before highlight is cleared
		 (default: -1 no timeout)
	**/
	var timeout : Null<Int>;
}