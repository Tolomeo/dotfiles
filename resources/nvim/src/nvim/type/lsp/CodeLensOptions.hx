package nvim.type.lsp;

/**
	```lua
	(class) lsp.CodeLensOptions
	```
	
	---
	
	Code Lens provider options of a {@link CodeLensRequest}.
**/
@:structInit class CodeLensOptions {
	/**
		```lua
		(field) lsp.CodeLensOptions.resolveProvider: boolean?
		```
		
		---
		
		
		Code lens has a resolve provider as well.
	**/
	@:optional
	extern var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeLensOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}