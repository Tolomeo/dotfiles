package nvim.type.lsp;

/**
	```lua
	(class) lsp.ExecuteCommandClientCapabilities
	```
	
	---
	
	The client capabilities of a {@link ExecuteCommandRequest}.
**/
@:structInit extern class ExecuteCommandClientCapabilities {
	/**
		```lua
		(field) lsp.ExecuteCommandClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Execute command supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
}