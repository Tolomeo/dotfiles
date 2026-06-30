package nvim.type.lsp;

/**
	```lua
	(class) lsp.ReferenceContext
	```
	
	---
	
	Value-object that contains additional information when
	requesting references.
**/
@:structInit class ReferenceContext {
	/**
		```lua
		(field) lsp.ReferenceContext.includeDeclaration: boolean
		```
		
		---
		
		
		Include the declaration of the current symbol.
	**/
	extern public var includeDeclaration : Bool;
}