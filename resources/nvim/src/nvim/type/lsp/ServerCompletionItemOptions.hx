package nvim.type.lsp;

/**
	```lua
	(class) lsp.ServerCompletionItemOptions
	```
**/
@:structInit extern class ServerCompletionItemOptions {
	/**
		```lua
		(field) lsp.ServerCompletionItemOptions.labelDetailsSupport: boolean?
		```
		
		---
		
		
		The server has support for completion item label
		details (see also `CompletionItemLabelDetails`) when
		receiving a completion item in a resolve call.
		
	**/
	var labelDetailsSupport : Null<Bool>;
}