package nvim.type.vim.tbl_contains;

/**
	```lua
	(class) vim.tbl_contains.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.tbl_contains.Opts.predicate: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 `value` is a function reference to be checked (default false)
	**/
	var predicate : Null<Bool>;
}