package nvim.type.vim.treesitter.languagetree.tree_for_range;

/**
	```lua
	(class) vim.treesitter.LanguageTree.tree_for_range.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.treesitter.LanguageTree.tree_for_range.Opts.ignore_injections: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Ignore injected languages
		 (default: `true`)
	**/
	@:optional
	extern public var ignore_injections : Null<Bool>;
}