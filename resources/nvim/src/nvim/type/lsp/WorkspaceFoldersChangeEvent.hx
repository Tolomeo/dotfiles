package nvim.type.lsp;

/**
	```lua
	(class) lsp.WorkspaceFoldersChangeEvent
	```
	
	---
	
	The workspace folder change event.
**/
@:structInit extern class WorkspaceFoldersChangeEvent {
	/**
		```lua
		(field) lsp.WorkspaceFoldersChangeEvent.added: lsp.WorkspaceFolder[]
		```
		
		---
		
		
		The array of added workspace folders
	**/
	var added : Array<nvim.type.lsp.WorkspaceFolder>;
	/**
		```lua
		(field) lsp.WorkspaceFoldersChangeEvent.removed: lsp.WorkspaceFolder[]
		```
		
		---
		
		
		The array of the removed workspace folders
	**/
	var removed : Array<nvim.type.lsp.WorkspaceFolder>;
}