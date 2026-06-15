package nvim.type.lsp;

/**
	```lua
	(class) lsp.ServerInfo
	```
	
	---
	
	Information about the server
	
**/
@:structInit extern class ServerInfo {
	/**
		```lua
		(field) lsp.ServerInfo.name: string
		```
		
		---
		
		
		The name of the server as defined by the server.
	**/
	var name : String;
	/**
		```lua
		(field) lsp.ServerInfo.version: string?
		```
		
		---
		
		
		The server's version as defined by the server.
	**/
	var version : Null<String>;
}