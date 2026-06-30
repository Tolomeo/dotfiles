package nvim.type.vim.lsp.semantic_tokens.highlight_token;

/**
	```lua
	(class) vim.lsp.semantic_tokens.highlight_token.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.lsp.semantic_tokens.highlight_token.Opts.priority: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Priority for the applied extmark.
		 (Default: `vim.hl.priorities.semantic_tokens + 3`)
	**/
	@:optional
	extern public var priority : Null<Float>;
}