package nvim.type.vim.hl.range;

/**
	```lua
	(class) vim.hl.range.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.hl.range.Opts.inclusive: boolean?
		```
		
		---
		
		
		 Indicates whether the range is end-inclusive
		 (default: `false`)
	**/
	@:optional
	extern var inclusive : Null<Bool>;
	/**
		```lua
		(field) vim.hl.range.Opts.priority: integer?
		```
		
		---
		
		
		 Highlight priority
		 (default: `vim.hl.priorities.user`)
	**/
	@:optional
	extern var priority : Null<Int>;
	/**
		```lua
		(field) vim.hl.range.Opts.regtype: string?
		```
		
		---
		
		 @inlinedoc
		
		 Type of range. See [getregtype()]
		 (default: `'v'` i.e. charwise)
	**/
	@:optional
	extern var regtype : Null<String>;
	/**
		```lua
		(field) vim.hl.range.Opts.timeout: integer?
		```
		
		---
		
		
		 Time in ms before highlight is cleared
		 (default: -1 no timeout)
	**/
	@:optional
	extern var timeout : Null<Int>;
}