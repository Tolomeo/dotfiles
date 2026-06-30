package nvim.type.lsp;

/**
	```lua
	(class) lsp.ShowMessageRequestClientCapabilities
	```
	
	---
	
	Show message request client capabilities
**/
@:structInit class ShowMessageRequestClientCapabilities {
	/**
		```lua
		(field) lsp.ShowMessageRequestClientCapabilities.messageActionItem: (lsp.ClientShowMessageActionItemOptions)?
		```
		
		---
		
		
		Capabilities specific to the `MessageActionItem` type.
	**/
	@:optional
	extern public var messageActionItem : Null<nvim.type.lsp.ClientShowMessageActionItemOptions>;
}