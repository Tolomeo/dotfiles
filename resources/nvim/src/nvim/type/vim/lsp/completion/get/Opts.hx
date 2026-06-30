package nvim.type.vim.lsp.completion.get;

/**
	```lua
	(class) vim.lsp.completion.get.Opts
	```
	
	---
	
	 @inlinedoc
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.lsp.completion.get.Opts.ctx: (lsp.CompletionContext)?
		```
		
		---
		
		Contains additional information about the context in which a completion request is triggered.
		
		---
		
		Completion context. Defaults to a trigger kind of `invoked`.
	**/
	@:optional
	extern public var ctx : Null<nvim.type.lsp.CompletionContext>;
}