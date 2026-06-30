package nvim.type.lsp;

/**
	```lua
	(class) lsp.InlineValueWorkspaceClientCapabilities
	```
	
	---
	
	Client workspace capabilities specific to inline values.
	
**/
@:structInit class InlineValueWorkspaceClientCapabilities {
	/**
		```lua
		(field) lsp.InlineValueWorkspaceClientCapabilities.refreshSupport: boolean?
		```
		
		---
		
		
		Whether the client implementation supports a refresh request sent from the
		server to the client.
		
		Note that this event is global and will force the client to refresh all
		inline values currently shown. It should be used with absolute care and is
		useful for situation where a server for example detects a project wide
		change that requires such a calculation.
	**/
	@:optional
	extern public var refreshSupport : Null<Bool>;
}