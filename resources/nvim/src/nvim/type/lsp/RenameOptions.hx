package nvim.type.lsp;

/**
	```lua
	(class) lsp.RenameOptions
	```
	
	---
	
	Provider options for a {@link RenameRequest}.
**/
@:structInit class RenameOptions {
	/**
		```lua
		(field) lsp.RenameOptions.prepareProvider: boolean?
		```
		
		---
		
		
		Renames should be checked and tested before being executed.
		
	**/
	@:optional
	extern public var prepareProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.RenameOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern public var workDoneProgress : Null<Bool>;
}