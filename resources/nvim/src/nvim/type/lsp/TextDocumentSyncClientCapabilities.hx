package nvim.type.lsp;

/**
	```lua
	(class) lsp.TextDocumentSyncClientCapabilities
	```
**/
@:structInit extern class TextDocumentSyncClientCapabilities {
	/**
		```lua
		(field) lsp.TextDocumentSyncClientCapabilities.didSave: boolean?
		```
		
		---
		
		
		The client supports did save notifications.
	**/
	var didSave : Null<Bool>;
	/**
		```lua
		(field) lsp.TextDocumentSyncClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether text document synchronization supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.TextDocumentSyncClientCapabilities.willSave: boolean?
		```
		
		---
		
		
		The client supports sending will save notifications.
	**/
	var willSave : Null<Bool>;
	/**
		```lua
		(field) lsp.TextDocumentSyncClientCapabilities.willSaveWaitUntil: boolean?
		```
		
		---
		
		
		The client supports sending a will save request and
		waits for a response providing text edits which will
		be applied to the document before it is saved.
	**/
	var willSaveWaitUntil : Null<Bool>;
}