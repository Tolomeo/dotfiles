package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentOnTypeFormattingOptions
	```
	
	---
	
	Provider options for a {@link DocumentOnTypeFormattingRequest}.
**/
@:structInit extern class DocumentOnTypeFormattingOptions {
	/**
		```lua
		(field) lsp.DocumentOnTypeFormattingOptions.firstTriggerCharacter: string
		```
		
		---
		
		
		A character on which formatting should be triggered, like `{`.
	**/
	var firstTriggerCharacter : String;
	/**
		```lua
		(field) lsp.DocumentOnTypeFormattingOptions.moreTriggerCharacter: string[]?
		```
		
		---
		
		
		More trigger characters.
	**/
	var moreTriggerCharacter : Null<Array<String>>;
}