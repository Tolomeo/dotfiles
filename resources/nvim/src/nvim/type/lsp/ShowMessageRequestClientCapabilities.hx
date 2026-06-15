package nvim.type.lsp;

/**
	```lua
	(class) lsp.ShowMessageRequestClientCapabilities
	```
	
	---
	
	Show message request client capabilities
**/
@:structInit extern class ShowMessageRequestClientCapabilities {
	/**
		```lua
		(field) lsp.ShowMessageRequestClientCapabilities.messageActionItem: (lsp.ClientShowMessageActionItemOptions)?
		```
		
		---
		
		
		Capabilities specific to the `MessageActionItem` type.
	**/
	var messageActionItem : Null<nvim.type.lsp.ClientShowMessageActionItemOptions>;
}