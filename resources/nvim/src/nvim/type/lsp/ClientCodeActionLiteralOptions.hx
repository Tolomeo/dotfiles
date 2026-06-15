package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCodeActionLiteralOptions
	```
**/
@:structInit extern class ClientCodeActionLiteralOptions {
	/**
		```lua
		(field) lsp.ClientCodeActionLiteralOptions.codeActionKind: lsp.ClientCodeActionKindOptions
		```
		
		---
		
		
		The code action kind is support with the following value
		set.
	**/
	var codeActionKind : nvim.type.lsp.ClientCodeActionKindOptions;
}