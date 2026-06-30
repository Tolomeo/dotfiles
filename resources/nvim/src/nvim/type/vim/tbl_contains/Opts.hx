package nvim.type.vim.tbl_contains;

/**
	```lua
	(class) vim.tbl_contains.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.tbl_contains.Opts.predicate: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 `value` is a function reference to be checked (default false)
	**/
	@:optional
	extern public var predicate : Null<Bool>;
}