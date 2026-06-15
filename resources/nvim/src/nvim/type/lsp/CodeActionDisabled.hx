package nvim.type.lsp;

/**
	```lua
	(class) lsp.CodeActionDisabled
	```
	
	---
	
	Captures why the code action is currently disabled.
	
**/
@:structInit extern class CodeActionDisabled {
	/**
		```lua
		(field) lsp.CodeActionDisabled.reason: string
		```
		
		---
		
		
		Human readable description of why the code action is currently disabled.
		
		This is displayed in the code actions UI.
	**/
	var reason : String;
}