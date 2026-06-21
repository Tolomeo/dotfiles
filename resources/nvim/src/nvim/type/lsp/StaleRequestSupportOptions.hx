package nvim.type.lsp;

/**
	```lua
	(class) lsp.StaleRequestSupportOptions
	```
**/
@:structInit class StaleRequestSupportOptions {
	/**
		```lua
		(field) lsp.StaleRequestSupportOptions.cancel: boolean
		```
		
		---
		
		
		The client will actively cancel the request.
	**/
	extern var cancel : Bool;
	/**
		```lua
		(field) lsp.StaleRequestSupportOptions.retryOnContentModified: string[]
		```
		
		---
		
		
		The list of requests for which the client
		will retry the request if it receives a
		response with error code `ContentModified`
	**/
	extern var retryOnContentModified : Array<String>;
}