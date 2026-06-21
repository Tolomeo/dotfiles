package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentLinkOptions
	```
	
	---
	
	Provider options for a {@link DocumentLinkRequest}.
**/
@:structInit class DocumentLinkOptions {
	/**
		```lua
		(field) lsp.DocumentLinkOptions.resolveProvider: boolean?
		```
		
		---
		
		
		Document links have a resolve provider as well.
	**/
	@:optional
	extern var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentLinkOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}