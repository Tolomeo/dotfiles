package nvim.type.lsp;

/**
	```lua
	(class) lsp.InlayHintOptions
	```
	
	---
	
	Inlay hint options used during static registration.
	
**/
@:structInit class InlayHintOptions {
	/**
		```lua
		(field) lsp.InlayHintOptions.resolveProvider: boolean?
		```
		
		---
		
		
		The server provides support to resolve additional
		information for an inlay hint item.
	**/
	@:optional
	extern var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.InlayHintOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}