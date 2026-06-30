package nvim.type.lsp;

/**
	```lua
	(class) lsp.SignatureHelpOptions
	```
	
	---
	
	Server Capabilities for a {@link SignatureHelpRequest}.
**/
@:structInit class SignatureHelpOptions {
	/**
		```lua
		(field) lsp.SignatureHelpOptions.retriggerCharacters: string[]?
		```
		
		---
		
		
		List of characters that re-trigger signature help.
		
		These trigger characters are only active when signature help is already showing. All trigger characters
		are also counted as re-trigger characters.
		
	**/
	@:optional
	extern public var retriggerCharacters : Null<lua.Table<Int, String>>;
	/**
		```lua
		(field) lsp.SignatureHelpOptions.triggerCharacters: string[]?
		```
		
		---
		
		
		List of characters that trigger signature help automatically.
	**/
	@:optional
	extern public var triggerCharacters : Null<lua.Table<Int, String>>;
	/**
		```lua
		(field) lsp.SignatureHelpOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern public var workDoneProgress : Null<Bool>;
}