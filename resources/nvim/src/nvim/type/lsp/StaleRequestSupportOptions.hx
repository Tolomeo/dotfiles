package nvim.type.lsp;

/**
	```lua
	(class) lsp.StaleRequestSupportOptions
	```
**/
@:structInit extern class StaleRequestSupportOptions {
	/**
		```lua
		(field) lsp.StaleRequestSupportOptions.cancel: boolean
		```
		
		---
		
		
		The client will actively cancel the request.
	**/
	var cancel : Bool;
	/**
		```lua
		(field) lsp.StaleRequestSupportOptions.retryOnContentModified: string[]
		```
		
		---
		
		
		The list of requests for which the client
		will retry the request if it receives a
		response with error code `ContentModified`
	**/
	var retryOnContentModified : Array<String>;
}