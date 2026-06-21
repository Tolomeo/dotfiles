package nvim.type.lsp;

/**
	```lua
	(class) lsp.CodeDescription
	```
	
	---
	
	Structure to capture a description for an error code.
	
**/
@:structInit class CodeDescription {
	/**
		```lua
		(field) lsp.CodeDescription.href: string
		```
		
		---
		
		
		An URI to open with more information about the diagnostic error.
	**/
	extern var href : nvim.type.lsp.URI;
}