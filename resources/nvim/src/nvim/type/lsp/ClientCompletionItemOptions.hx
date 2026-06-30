package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCompletionItemOptions
	```
**/
@:structInit class ClientCompletionItemOptions {
	/**
		```lua
		(field) lsp.ClientCompletionItemOptions.commitCharactersSupport: boolean?
		```
		
		---
		
		
		Client supports commit characters on a completion item.
	**/
	@:optional
	extern public var commitCharactersSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.ClientCompletionItemOptions.deprecatedSupport: boolean?
		```
		
		---
		
		
		Client supports the deprecated property on a completion item.
	**/
	@:optional
	extern public var deprecatedSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.ClientCompletionItemOptions.documentationFormat: "markdown"|"plaintext"[]?
		```
		
		---
		
		
		Client supports the following content formats for the documentation
		property. The order describes the preferred format of the client.
	**/
	@:optional
	extern public var documentationFormat : Null<lua.Table<Int, nvim.type.lsp.MarkupKind>>;
	/**
		```lua
		(field) lsp.ClientCompletionItemOptions.insertReplaceSupport: boolean?
		```
		
		---
		
		
		Client support insert replace edit to control different behavior if a
		completion item is inserted in the text or should replace text.
		
	**/
	@:optional
	extern public var insertReplaceSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.ClientCompletionItemOptions.insertTextModeSupport: (lsp.ClientCompletionItemInsertTextModeOptions)?
		```
		
		---
		
		
		The client supports the `insertTextMode` property on
		a completion item to override the whitespace handling mode
		as defined by the client (see `insertTextMode`).
		
	**/
	@:optional
	extern public var insertTextModeSupport : Null<nvim.type.lsp.ClientCompletionItemInsertTextModeOptions>;
	/**
		```lua
		(field) lsp.ClientCompletionItemOptions.labelDetailsSupport: boolean?
		```
		
		---
		
		
		The client has support for completion item label
		details (see also `CompletionItemLabelDetails`).
		
	**/
	@:optional
	extern public var labelDetailsSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.ClientCompletionItemOptions.preselectSupport: boolean?
		```
		
		---
		
		
		Client supports the preselect property on a completion item.
	**/
	@:optional
	extern public var preselectSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.ClientCompletionItemOptions.resolveSupport: (lsp.ClientCompletionItemResolveOptions)?
		```
		
		---
		
		
		Indicates which properties a client can resolve lazily on a completion
		item. Before version 3.16.0 only the predefined properties `documentation`
		and `details` could be resolved lazily.
		
	**/
	@:optional
	extern public var resolveSupport : Null<nvim.type.lsp.ClientCompletionItemResolveOptions>;
	/**
		```lua
		(field) lsp.ClientCompletionItemOptions.snippetSupport: boolean?
		```
		
		---
		
		
		Client supports snippets as insert text.
		
		A snippet can define tab stops and placeholders with `$1`, `$2`
		and `${3:foo}`. `$0` defines the final tab stop, it defaults to
		the end of the snippet. Placeholders with equal identifiers are linked,
		that is typing in one will update others too.
	**/
	@:optional
	extern public var snippetSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.ClientCompletionItemOptions.tagSupport: (lsp.CompletionItemTagOptions)?
		```
		
		---
		
		
		Client supports the tag property on a completion item. Clients supporting
		tags have to handle unknown tags gracefully. Clients especially need to
		preserve unknown tags when sending a completion item back to the server in
		a resolve call.
		
	**/
	@:optional
	extern public var tagSupport : Null<nvim.type.lsp.CompletionItemTagOptions>;
}