package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCodeActionLiteralOptions
	```
**/
@:structInit class ClientCodeActionLiteralOptions {
	/**
		```lua
		(field) lsp.ClientCodeActionLiteralOptions.codeActionKind: lsp.ClientCodeActionKindOptions
		```
		
		---
		
		
		The code action kind is support with the following value
		set.
	**/
	extern var codeActionKind : nvim.type.lsp.ClientCodeActionKindOptions;
}