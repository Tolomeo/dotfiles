package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentLinkOptions
	```
	
	---
	
	Provider options for a {@link DocumentLinkRequest}.
**/
@:structInit extern class DocumentLinkOptions {
	/**
		```lua
		(field) lsp.DocumentLinkOptions.resolveProvider: boolean?
		```
		
		---
		
		
		Document links have a resolve provider as well.
	**/
	var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentLinkOptions.workDoneProgress: boolean?
		```
	**/
	var workDoneProgress : Null<Bool>;
}