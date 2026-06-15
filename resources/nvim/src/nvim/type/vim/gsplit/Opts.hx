package nvim.type.vim.gsplit;

/**
	```lua
	(class) vim.gsplit.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.gsplit.Opts.plain: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Use `sep` literally (as in string.find).
	**/
	var plain : Null<Bool>;
	/**
		```lua
		(field) vim.gsplit.Opts.trimempty: boolean?
		```
		
		---
		
		
		 Discard empty segments at start and end of the sequence.
	**/
	var trimempty : Null<Bool>;
}