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
	extern public var inclusive : Null<Bool>;
	/**
		```lua
		(field) vim.hl.range.Opts.priority: integer?
		```
		
		---
		
		
		 Highlight priority
		 (default: `vim.hl.priorities.user`)
	**/
	@:optional
	extern public var priority : Null<Float>;
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
	extern public var regtype : Null<String>;
	/**
		```lua
		(field) vim.hl.range.Opts.timeout: integer?
		```
		
		---
		
		
		 Time in ms before highlight is cleared
		 (default: -1 no timeout)
	**/
	@:optional
	extern public var timeout : Null<Float>;
}