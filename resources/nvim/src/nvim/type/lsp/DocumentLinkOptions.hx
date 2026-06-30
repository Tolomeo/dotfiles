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
	extern public var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentLinkOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern public var workDoneProgress : Null<Bool>;
}