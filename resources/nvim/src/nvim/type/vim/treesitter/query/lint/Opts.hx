package nvim.type.vim.treesitter.query.lint;

/**
	```lua
	(class) vim.treesitter.query.lint.Opts
	```
	
	---
	
	 Optional keyword arguments:
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.treesitter.query.lint.Opts.clear: boolean
		```
		
		---
		
		
		 Just clear current lint errors
	**/
	var clear : Bool;
	/**
		```lua
		(field) vim.treesitter.query.lint.Opts.langs: (string|string[])?
		```
		
		---
		
		 @inlinedoc
		
		 Language(s) to use for checking the query.
		 If multiple languages are specified, queries are validated for all of them
	**/
	var langs : Null<haxe.extern.EitherType<String, Array<String>>>;
}