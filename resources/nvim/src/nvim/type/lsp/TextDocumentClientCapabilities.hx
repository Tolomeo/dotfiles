package nvim.type.lsp;

/**
	```lua
	(class) lsp.TextDocumentClientCapabilities
	```
	
	---
	
	Text document specific client capabilities.
**/
@:structInit class TextDocumentClientCapabilities {
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.callHierarchy: (lsp.CallHierarchyClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the various call hierarchy requests.
		
	**/
	@:optional
	extern public var callHierarchy : Null<nvim.type.lsp.CallHierarchyClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.codeAction: (lsp.CodeActionClientCapabilities)?
		```
		
		---
		
		The Client Capabilities of a {@link CodeActionRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/codeAction` request.
	**/
	@:optional
	extern public var codeAction : Null<nvim.type.lsp.CodeActionClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.codeLens: (lsp.CodeLensClientCapabilities)?
		```
		
		---
		
		The client capabilities  of a {@link CodeLensRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/codeLens` request.
	**/
	@:optional
	extern public var codeLens : Null<nvim.type.lsp.CodeLensClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.colorProvider: (lsp.DocumentColorClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/documentColor` and the
		`textDocument/colorPresentation` request.
		
	**/
	@:optional
	extern public var colorProvider : Null<nvim.type.lsp.DocumentColorClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.completion: (lsp.CompletionClientCapabilities)?
		```
		
		---
		
		Completion client capabilities
		
		---
		
		
		Capabilities specific to the `textDocument/completion` request.
	**/
	@:optional
	extern public var completion : Null<nvim.type.lsp.CompletionClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.declaration: (lsp.DeclarationClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/declaration` request.
		
	**/
	@:optional
	extern public var declaration : Null<nvim.type.lsp.DeclarationClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.definition: (lsp.DefinitionClientCapabilities)?
		```
		
		---
		
		Client Capabilities for a {@link DefinitionRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/definition` request.
	**/
	@:optional
	extern public var definition : Null<nvim.type.lsp.DefinitionClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.diagnostic: (lsp.DiagnosticClientCapabilities)?
		```
		
		---
		
		Client capabilities specific to diagnostic pull requests.
		
		
		---
		
		
		Capabilities specific to the diagnostic pull model.
		
	**/
	@:optional
	extern public var diagnostic : Null<nvim.type.lsp.DiagnosticClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.documentHighlight: (lsp.DocumentHighlightClientCapabilities)?
		```
		
		---
		
		Client Capabilities for a {@link DocumentHighlightRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/documentHighlight` request.
	**/
	@:optional
	extern public var documentHighlight : Null<nvim.type.lsp.DocumentHighlightClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.documentLink: (lsp.DocumentLinkClientCapabilities)?
		```
		
		---
		
		The client capabilities of a {@link DocumentLinkRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/documentLink` request.
	**/
	@:optional
	extern public var documentLink : Null<nvim.type.lsp.DocumentLinkClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.documentSymbol: (lsp.DocumentSymbolClientCapabilities)?
		```
		
		---
		
		Client Capabilities for a {@link DocumentSymbolRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/documentSymbol` request.
	**/
	@:optional
	extern public var documentSymbol : Null<nvim.type.lsp.DocumentSymbolClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.filters: (lsp.TextDocumentFilterClientCapabilities)?
		```
		
		---
		
		
		Defines which filters the client supports.
		
	**/
	@:optional
	extern public var filters : Null<nvim.type.lsp.TextDocumentFilterClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.foldingRange: (lsp.FoldingRangeClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/foldingRange` request.
		
	**/
	@:optional
	extern public var foldingRange : Null<nvim.type.lsp.FoldingRangeClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.formatting: (lsp.DocumentFormattingClientCapabilities)?
		```
		
		---
		
		Client capabilities of a {@link DocumentFormattingRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/formatting` request.
	**/
	@:optional
	extern public var formatting : Null<nvim.type.lsp.DocumentFormattingClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.hover: (lsp.HoverClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/hover` request.
	**/
	@:optional
	extern public var hover : Null<nvim.type.lsp.HoverClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.implementation: (lsp.ImplementationClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/implementation` request.
		
	**/
	@:optional
	extern public var implementation : Null<nvim.type.lsp.ImplementationClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.inlayHint: (lsp.InlayHintClientCapabilities)?
		```
		
		---
		
		Inlay hint client capabilities.
		
		
		---
		
		
		Capabilities specific to the `textDocument/inlayHint` request.
		
	**/
	@:optional
	extern public var inlayHint : Null<nvim.type.lsp.InlayHintClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.inlineCompletion: (lsp.InlineCompletionClientCapabilities)?
		```
		
		---
		
		Client capabilities specific to inline completions.
		
		
		---
		
		
		Client capabilities specific to inline completions.
		
	**/
	@:optional
	extern public var inlineCompletion : Null<nvim.type.lsp.InlineCompletionClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.inlineValue: (lsp.InlineValueClientCapabilities)?
		```
		
		---
		
		Client capabilities specific to inline values.
		
		
		---
		
		
		Capabilities specific to the `textDocument/inlineValue` request.
		
	**/
	@:optional
	extern public var inlineValue : Null<nvim.type.lsp.InlineValueClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.linkedEditingRange: (lsp.LinkedEditingRangeClientCapabilities)?
		```
		
		---
		
		Client capabilities for the linked editing range request.
		
		
		---
		
		
		Capabilities specific to the `textDocument/linkedEditingRange` request.
		
	**/
	@:optional
	extern public var linkedEditingRange : Null<nvim.type.lsp.LinkedEditingRangeClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.moniker: (lsp.MonikerClientCapabilities)?
		```
		
		---
		
		Client capabilities specific to the moniker request.
		
		
		---
		
		
		Client capabilities specific to the `textDocument/moniker` request.
		
	**/
	@:optional
	extern public var moniker : Null<nvim.type.lsp.MonikerClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.onTypeFormatting: (lsp.DocumentOnTypeFormattingClientCapabilities)?
		```
		
		---
		
		Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/onTypeFormatting` request.
	**/
	@:optional
	extern public var onTypeFormatting : Null<nvim.type.lsp.DocumentOnTypeFormattingClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.publishDiagnostics: (lsp.PublishDiagnosticsClientCapabilities)?
		```
		
		---
		
		The publish diagnostic client capabilities.
		
		---
		
		
		Capabilities specific to the `textDocument/publishDiagnostics` notification.
	**/
	@:optional
	extern public var publishDiagnostics : Null<nvim.type.lsp.PublishDiagnosticsClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.rangeFormatting: (lsp.DocumentRangeFormattingClientCapabilities)?
		```
		
		---
		
		Client capabilities of a {@link DocumentRangeFormattingRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/rangeFormatting` request.
	**/
	@:optional
	extern public var rangeFormatting : Null<nvim.type.lsp.DocumentRangeFormattingClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.references: (lsp.ReferenceClientCapabilities)?
		```
		
		---
		
		Client Capabilities for a {@link ReferencesRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/references` request.
	**/
	@:optional
	extern public var references : Null<nvim.type.lsp.ReferenceClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.rename: (lsp.RenameClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/rename` request.
	**/
	@:optional
	extern public var rename : Null<nvim.type.lsp.RenameClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.selectionRange: (lsp.SelectionRangeClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/selectionRange` request.
		
	**/
	@:optional
	extern public var selectionRange : Null<nvim.type.lsp.SelectionRangeClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.semanticTokens: (lsp.SemanticTokensClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the various semantic token request.
		
	**/
	@:optional
	extern public var semanticTokens : Null<nvim.type.lsp.SemanticTokensClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.signatureHelp: (lsp.SignatureHelpClientCapabilities)?
		```
		
		---
		
		Client Capabilities for a {@link SignatureHelpRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/signatureHelp` request.
	**/
	@:optional
	extern public var signatureHelp : Null<nvim.type.lsp.SignatureHelpClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.synchronization: (lsp.TextDocumentSyncClientCapabilities)?
		```
		
		---
		
		
		Defines which synchronization capabilities the client supports.
	**/
	@:optional
	extern public var synchronization : Null<nvim.type.lsp.TextDocumentSyncClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.typeDefinition: (lsp.TypeDefinitionClientCapabilities)?
		```
		
		---
		
		Since 3.6.0
		
		---
		
		
		Capabilities specific to the `textDocument/typeDefinition` request.
		
	**/
	@:optional
	extern public var typeDefinition : Null<nvim.type.lsp.TypeDefinitionClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.typeHierarchy: (lsp.TypeHierarchyClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the various type hierarchy requests.
		
	**/
	@:optional
	extern public var typeHierarchy : Null<nvim.type.lsp.TypeHierarchyClientCapabilities>;
}