package nvim.type.lsp;

/**
	```lua
	(class) lsp.CompletionClientCapabilities
	```
	
	---
	
	Completion client capabilities
**/
@:structInit class CompletionClientCapabilities {
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.completionItem: (lsp.ClientCompletionItemOptions)?
		```
		
		---
		
		
		The client supports the following `CompletionItem` specific
		capabilities.
	**/
	@:optional
	extern public var completionItem : Null<nvim.type.lsp.ClientCompletionItemOptions>;
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.completionItemKind: (lsp.ClientCompletionItemOptionsKind)?
		```
	**/
	@:optional
	extern public var completionItemKind : Null<nvim.type.lsp.ClientCompletionItemOptionsKind>;
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.completionList: (lsp.CompletionListCapabilities)?
		```
		
		---
		
		The client supports the following `CompletionList` specific
		capabilities.
		
		
		---
		
		
		The client supports the following `CompletionList` specific
		capabilities.
		
	**/
	@:optional
	extern public var completionList : Null<nvim.type.lsp.CompletionListCapabilities>;
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.contextSupport: boolean?
		```
		
		---
		
		
		The client supports to send additional context information for a
		`textDocument/completion` request.
	**/
	@:optional
	extern public var contextSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether completion supports dynamic registration.
	**/
	@:optional
	extern public var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.insertTextMode: (1|2)?
		```
		
		---
		
		How whitespace and indentation is handled during completion
		item insertion.
		
		
		---
		
		
		Defines how the client handles whitespace and indentation
		when accepting a completion item that uses multi line
		text in either `insertText` or `textEdit`.
		
		
		---
		
		```lua
		-- How whitespace and indentation is handled during completion
		-- item insertion.
		-- 
		lsp.InsertTextMode:
		    | 1 -- asIs
		    | 2 -- adjustIndentation
		```
	**/
	@:optional
	extern public var insertTextMode : Null<nvim.type.lsp.InsertTextMode>;
}