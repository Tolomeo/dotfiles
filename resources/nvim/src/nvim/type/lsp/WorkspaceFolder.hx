package nvim.type.lsp;

/**
	```lua
	(class) lsp.WorkspaceFolder
	```
	
	---
	
	A workspace folder inside a client.
**/
@:structInit class WorkspaceFolder {
	/**
		```lua
		(field) lsp.WorkspaceFolder.name: string
		```
		
		---
		
		
		The name of the workspace folder. Used to refer to this
		workspace folder in the user interface.
	**/
	extern var name : String;
	/**
		```lua
		(field) lsp.WorkspaceFolder.uri: string
		```
		
		---
		
		
		The associated URI for this workspace folder.
	**/
	extern var uri : nvim.type.lsp.URI;
}