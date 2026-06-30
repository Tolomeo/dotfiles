package nvim.type.lsp;

/**
	```lua
	(class) lsp.WorkspaceFoldersChangeEvent
	```
	
	---
	
	The workspace folder change event.
**/
@:structInit class WorkspaceFoldersChangeEvent {
	/**
		```lua
		(field) lsp.WorkspaceFoldersChangeEvent.added: lsp.WorkspaceFolder[]
		```
		
		---
		
		
		The array of added workspace folders
	**/
	extern public var added : lua.Table<Int, nvim.type.lsp.WorkspaceFolder>;
	/**
		```lua
		(field) lsp.WorkspaceFoldersChangeEvent.removed: lsp.WorkspaceFolder[]
		```
		
		---
		
		
		The array of the removed workspace folders
	**/
	extern public var removed : lua.Table<Int, nvim.type.lsp.WorkspaceFolder>;
}