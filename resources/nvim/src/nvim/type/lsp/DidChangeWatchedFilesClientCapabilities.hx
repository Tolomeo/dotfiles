package nvim.type.lsp;

/**
	```lua
	(class) lsp.DidChangeWatchedFilesClientCapabilities
	```
**/
@:structInit class DidChangeWatchedFilesClientCapabilities {
	/**
		```lua
		(field) lsp.DidChangeWatchedFilesClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Did change watched files notification supports dynamic registration. Please note
		that the current protocol doesn't support static configuration for file changes
		from the server side.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DidChangeWatchedFilesClientCapabilities.relativePatternSupport: boolean?
		```
		
		---
		
		
		Whether the client has support for {@link  RelativePattern relative pattern}
		or not.
		
	**/
	@:optional
	extern var relativePatternSupport : Null<Bool>;
}