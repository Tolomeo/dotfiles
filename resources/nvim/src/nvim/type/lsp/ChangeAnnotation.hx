package nvim.type.lsp;

/**
	```lua
	(class) lsp.ChangeAnnotation
	```
	
	---
	
	Additional information that describes document changes.
	
**/
@:structInit class ChangeAnnotation {
	/**
		```lua
		(field) lsp.ChangeAnnotation.description: string?
		```
		
		---
		
		
		A human-readable string which is rendered less prominent in
		the user interface.
	**/
	@:optional
	extern public var description : Null<String>;
	/**
		```lua
		(field) lsp.ChangeAnnotation.label: string
		```
		
		---
		
		
		A human-readable string describing the actual change. The string
		is rendered prominent in the user interface.
	**/
	extern public var label : String;
	/**
		```lua
		(field) lsp.ChangeAnnotation.needsConfirmation: boolean?
		```
		
		---
		
		
		A flag which indicates that user confirmation is needed
		before applying the change.
	**/
	@:optional
	extern public var needsConfirmation : Null<Bool>;
}