package nvim.type.lsp;

/**
	```lua
	(class) lsp.SignatureHelpOptions
	```
	
	---
	
	Server Capabilities for a {@link SignatureHelpRequest}.
**/
@:structInit extern class SignatureHelpOptions {
	/**
		```lua
		(field) lsp.SignatureHelpOptions.retriggerCharacters: string[]?
		```
		
		---
		
		
		List of characters that re-trigger signature help.
		
		These trigger characters are only active when signature help is already showing. All trigger characters
		are also counted as re-trigger characters.
		
	**/
	var retriggerCharacters : Null<Array<String>>;
	/**
		```lua
		(field) lsp.SignatureHelpOptions.triggerCharacters: string[]?
		```
		
		---
		
		
		List of characters that trigger signature help automatically.
	**/
	var triggerCharacters : Null<Array<String>>;
	/**
		```lua
		(field) lsp.SignatureHelpOptions.workDoneProgress: boolean?
		```
	**/
	var workDoneProgress : Null<Bool>;
}