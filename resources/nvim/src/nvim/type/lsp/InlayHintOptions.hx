package nvim.type.lsp;

/**
	```lua
	(class) lsp.InlayHintOptions
	```
	
	---
	
	Inlay hint options used during static registration.
	
**/
@:structInit extern class InlayHintOptions {
	/**
		```lua
		(field) lsp.InlayHintOptions.resolveProvider: boolean?
		```
		
		---
		
		
		The server provides support to resolve additional
		information for an inlay hint item.
	**/
	var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.InlayHintOptions.workDoneProgress: boolean?
		```
	**/
	var workDoneProgress : Null<Bool>;
}