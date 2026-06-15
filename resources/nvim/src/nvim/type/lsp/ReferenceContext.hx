package nvim.type.lsp;

/**
	```lua
	(class) lsp.ReferenceContext
	```
	
	---
	
	Value-object that contains additional information when
	requesting references.
**/
@:structInit extern class ReferenceContext {
	/**
		```lua
		(field) lsp.ReferenceContext.includeDeclaration: boolean
		```
		
		---
		
		
		Include the declaration of the current symbol.
	**/
	var includeDeclaration : Bool;
}