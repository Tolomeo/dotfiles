package nvim.type.vim.lsp.formatexpr;

/**
	```lua
	(class) vim.lsp.formatexpr.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.lsp.formatexpr.Opts.timeout_ms: integer
		```
		
		---
		
		 @inlinedoc
		
		 The timeout period for the formatting request.
		 (default: 500ms).
	**/
	extern var timeout_ms : Int;
}