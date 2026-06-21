package nvim.type.lsp;

/**
	```lua
	(class) lsp.Unregistration
	```
	
	---
	
	General parameters to unregister a request or notification.
**/
@:structInit class Unregistration {
	/**
		```lua
		(field) lsp.Unregistration.id: string
		```
		
		---
		
		
		The id used to unregister the request or notification. Usually an id
		provided during the register request.
	**/
	extern var id : String;
	/**
		```lua
		(field) lsp.Unregistration.method: string
		```
		
		---
		
		
		The method to unregister for.
	**/
	extern var method : String;
}