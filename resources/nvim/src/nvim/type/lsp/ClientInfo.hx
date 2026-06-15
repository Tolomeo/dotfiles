package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientInfo
	```
	
	---
	
	Information about the client
	
**/
@:structInit extern class ClientInfo {
	/**
		```lua
		(field) lsp.ClientInfo.name: string
		```
		
		---
		
		
		The name of the client as defined by the client.
	**/
	var name : String;
	/**
		```lua
		(field) lsp.ClientInfo.version: string?
		```
		
		---
		
		
		The client's version as defined by the client.
	**/
	var version : Null<String>;
}