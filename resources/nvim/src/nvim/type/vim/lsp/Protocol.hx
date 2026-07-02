package nvim.type.vim.lsp;

/**
	```lua
	(field) vim.lsp.protocol.CodeActionKind: table
	```
	
	---
	
	 A set of predefined code action kinds
**/
@:structInit class CodeActionKind {
	/**
		```lua
		(field) CodeActionKind.Empty: unknown
		```
	**/
	extern public var Empty : Dynamic;
	/**
		```lua
		(field) CodeActionKind.QuickFix: unknown
		```
	**/
	extern public var QuickFix : Dynamic;
	/**
		```lua
		(field) CodeActionKind.Refactor: unknown
		```
	**/
	extern public var Refactor : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorExtract: unknown
		```
	**/
	extern public var RefactorExtract : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorInline: unknown
		```
	**/
	extern public var RefactorInline : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorRewrite: unknown
		```
	**/
	extern public var RefactorRewrite : Dynamic;
	/**
		```lua
		(field) CodeActionKind.Source: unknown
		```
	**/
	extern public var Source : Dynamic;
	/**
		```lua
		(field) CodeActionKind.SourceOrganizeImports: unknown
		```
	**/
	extern public var SourceOrganizeImports : Dynamic;
	/**
		```lua
		(field) CodeActionKind.quickfix: unknown
		```
	**/
	extern public var quickfix : Dynamic;
	/**
		```lua
		(field) CodeActionKind.refactor: unknown
		```
	**/
	extern public var refactor : Dynamic;
	/**
		```lua
		(field) CodeActionKind.source: unknown
		```
	**/
	extern public var source : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.CodeActionTriggerKind: table
	```
	
	---
	
	 The reason why code actions were requested.
**/
@:structInit class CodeActionTriggerKind {
	/**
		```lua
		(field) CodeActionTriggerKind.Automatic: unknown
		```
	**/
	extern public var Automatic : Dynamic;
	/**
		```lua
		(field) CodeActionTriggerKind.Invoked: unknown
		```
	**/
	extern public var Invoked : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.CompletionItemKind: table
	```
	
	---
	
	 The kind of a completion entry.
**/
@:structInit class CompletionItemKind {
	/**
		```lua
		(field) CompletionItemKind.Class: unknown
		```
	**/
	extern public var Class : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Color: unknown
		```
	**/
	extern public var Color : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Constant: unknown
		```
	**/
	extern public var Constant : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Constructor: unknown
		```
	**/
	extern public var Constructor : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Enum: unknown
		```
	**/
	extern public var Enum : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.EnumMember: unknown
		```
	**/
	extern public var EnumMember : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Event: unknown
		```
	**/
	extern public var Event : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Field: unknown
		```
	**/
	extern public var Field : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.File: unknown
		```
	**/
	extern public var File : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Folder: unknown
		```
	**/
	extern public var Folder : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Function: unknown
		```
	**/
	extern public var Function : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Interface: unknown
		```
	**/
	extern public var Interface : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Keyword: unknown
		```
	**/
	extern public var Keyword : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Method: unknown
		```
	**/
	extern public var Method : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Module: unknown
		```
	**/
	extern public var Module : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Operator: unknown
		```
	**/
	extern public var Operator : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Property: unknown
		```
	**/
	extern public var Property : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Reference: unknown
		```
	**/
	extern public var Reference : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Snippet: unknown
		```
	**/
	extern public var Snippet : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Struct: unknown
		```
	**/
	extern public var Struct : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Text: unknown
		```
	**/
	extern public var Text : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.TypeParameter: unknown
		```
	**/
	extern public var TypeParameter : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Unit: unknown
		```
	**/
	extern public var Unit : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Value: unknown
		```
	**/
	extern public var Value : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Variable: unknown
		```
	**/
	extern public var Variable : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.CompletionTag: table
	```
	
	---
	
	 Completion item tags are extra annotations that tweak the rendering of a
	 completion item
**/
@:structInit class CompletionTag {
	/**
		```lua
		(field) CompletionTag.Deprecated: unknown
		```
	**/
	extern public var Deprecated : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.CompletionTriggerKind: table
	```
	
	---
	
	 How a completion was triggered
**/
@:structInit class CompletionTriggerKind {
	/**
		```lua
		(field) CompletionTriggerKind.Invoked: unknown
		```
	**/
	extern public var Invoked : Dynamic;
	/**
		```lua
		(field) CompletionTriggerKind.TriggerCharacter: unknown
		```
	**/
	extern public var TriggerCharacter : Dynamic;
	/**
		```lua
		(field) CompletionTriggerKind.TriggerForIncompleteCompletions: unknown
		```
	**/
	extern public var TriggerForIncompleteCompletions : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.DiagnosticSeverity: table
	```
**/
@:structInit class DiagnosticSeverity {
	/**
		```lua
		(field) DiagnosticSeverity.Error: unknown
		```
	**/
	extern public var Error : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Hint: unknown
		```
	**/
	extern public var Hint : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Information: unknown
		```
	**/
	extern public var Information : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Warning: unknown
		```
	**/
	extern public var Warning : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.DiagnosticTag: table
	```
**/
@:structInit class DiagnosticTag {
	/**
		```lua
		(field) DiagnosticTag.Deprecated: unknown
		```
	**/
	extern public var Deprecated : Dynamic;
	/**
		```lua
		(field) DiagnosticTag.Unnecessary: unknown
		```
	**/
	extern public var Unnecessary : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.DocumentHighlightKind: table
	```
	
	---
	
	 A document highlight kind.
**/
@:structInit class DocumentHighlightKind {
	/**
		```lua
		(field) DocumentHighlightKind.Read: unknown
		```
	**/
	extern public var Read : Dynamic;
	/**
		```lua
		(field) DocumentHighlightKind.Text: unknown
		```
	**/
	extern public var Text : Dynamic;
	/**
		```lua
		(field) DocumentHighlightKind.Write: unknown
		```
	**/
	extern public var Write : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.ErrorCodes: table
	```
**/
@:structInit class ErrorCodes {
	/**
		```lua
		(field) ErrorCodes.ContentModified: unknown
		```
	**/
	extern public var ContentModified : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InternalError: unknown
		```
	**/
	extern public var InternalError : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InvalidParams: unknown
		```
	**/
	extern public var InvalidParams : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InvalidRequest: unknown
		```
	**/
	extern public var InvalidRequest : Dynamic;
	/**
		```lua
		(field) ErrorCodes.MethodNotFound: unknown
		```
	**/
	extern public var MethodNotFound : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ParseError: unknown
		```
	**/
	extern public var ParseError : Dynamic;
	/**
		```lua
		(field) ErrorCodes.RequestCancelled: unknown
		```
	**/
	extern public var RequestCancelled : Dynamic;
	/**
		```lua
		(field) ErrorCodes.RequestFailed: unknown
		```
	**/
	extern public var RequestFailed : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ServerCancelled: unknown
		```
	**/
	extern public var ServerCancelled : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ServerNotInitialized: unknown
		```
	**/
	extern public var ServerNotInitialized : Dynamic;
	/**
		```lua
		(field) ErrorCodes.UnknownErrorCode: unknown
		```
	**/
	extern public var UnknownErrorCode : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.FailureHandlingKind: table
	```
**/
@:structInit class FailureHandlingKind {
	/**
		```lua
		(field) FailureHandlingKind.Abort: unknown
		```
	**/
	extern public var Abort : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.TextOnlyTransactional: unknown
		```
	**/
	extern public var TextOnlyTransactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.Transactional: unknown
		```
	**/
	extern public var Transactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.Undo: unknown
		```
	**/
	extern public var Undo : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.abort: unknown
		```
	**/
	extern public var abort : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.textOnlyTransactional: unknown
		```
	**/
	extern public var textOnlyTransactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.transactional: unknown
		```
	**/
	extern public var transactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.undo: unknown
		```
	**/
	extern public var undo : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.FileChangeType: table
	```
	
	---
	
	 The file event type.
**/
@:structInit class FileChangeType {
	/**
		```lua
		(field) FileChangeType.Changed: unknown
		```
	**/
	extern public var Changed : Dynamic;
	/**
		```lua
		(field) FileChangeType.Created: unknown
		```
	**/
	extern public var Created : Dynamic;
	/**
		```lua
		(field) FileChangeType.Deleted: unknown
		```
	**/
	extern public var Deleted : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.InitializeError: table
	```
	
	---
	
	 Known error codes for an `InitializeError`;
**/
@:structInit class InitializeError {
	/**
		```lua
		(field) InitializeError.unknownProtocolVersion: unknown
		```
	**/
	extern public var unknownProtocolVersion : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.InsertTextFormat: table
	```
	
	---
	
	 Defines whether the insert text in a completion item should be interpreted as
	 plain text or a snippet.
**/
@:structInit class InsertTextFormat {
	/**
		```lua
		(field) InsertTextFormat.PlainText: unknown
		```
	**/
	extern public var PlainText : Dynamic;
	/**
		```lua
		(field) InsertTextFormat.Snippet: unknown
		```
	**/
	extern public var Snippet : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.MarkupKind: table
	```
	
	---
	
	 Describes the content type that a client supports in various
	 result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
	
	 Please note that `MarkupKinds` must not start with a `$`. This kinds
	 are reserved for internal usage.
**/
@:structInit class MarkupKind {
	/**
		```lua
		(field) MarkupKind.Markdown: unknown
		```
	**/
	extern public var Markdown : Dynamic;
	/**
		```lua
		(field) MarkupKind.PlainText: unknown
		```
	**/
	extern public var PlainText : Dynamic;
	/**
		```lua
		(field) MarkupKind.markdown: unknown
		```
	**/
	extern public var markdown : Dynamic;
	/**
		```lua
		(field) MarkupKind.plaintext: unknown
		```
	**/
	extern public var plaintext : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.MessageType: table
	```
**/
@:structInit class MessageType {
	/**
		```lua
		(field) MessageType.Debug: unknown
		```
	**/
	extern public var Debug : Dynamic;
	/**
		```lua
		(field) MessageType.Error: unknown
		```
	**/
	extern public var Error : Dynamic;
	/**
		```lua
		(field) MessageType.Info: unknown
		```
	**/
	extern public var Info : Dynamic;
	/**
		```lua
		(field) MessageType.Log: unknown
		```
	**/
	extern public var Log : Dynamic;
	/**
		```lua
		(field) MessageType.Warning: unknown
		```
	**/
	extern public var Warning : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.Methods: table
	```
	
	---
	
	 LSP method names.
	See: ~https~ ://microsoft.github.io/language-server-protocol/specification/#metaModel
**/
@:structInit class Methods {
	extern public var callHierarchy_incomingCalls : nvim.type.vim.lsp.protocol.Methods;
	extern public var callHierarchy_outgoingCalls : nvim.type.vim.lsp.protocol.Methods;
	extern public var client_registerCapability : nvim.type.vim.lsp.protocol.Methods;
	extern public var client_unregisterCapability : nvim.type.vim.lsp.protocol.Methods;
	extern public var codeAction_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern public var codeLens_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern public var completionItem_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern public var documentLink_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern public var dollar_cancelRequest : nvim.type.vim.lsp.protocol.Methods;
	extern public var dollar_logTrace : nvim.type.vim.lsp.protocol.Methods;
	extern public var dollar_progress : nvim.type.vim.lsp.protocol.Methods;
	extern public var dollar_setTrace : nvim.type.vim.lsp.protocol.Methods;
	extern public var exit : nvim.type.vim.lsp.protocol.Methods;
	extern public var initialize : nvim.type.vim.lsp.protocol.Methods;
	extern public var initialized : nvim.type.vim.lsp.protocol.Methods;
	extern public var inlayHint_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern public var notebookDocument_didChange : nvim.type.vim.lsp.protocol.Methods;
	extern public var notebookDocument_didClose : nvim.type.vim.lsp.protocol.Methods;
	extern public var notebookDocument_didOpen : nvim.type.vim.lsp.protocol.Methods;
	extern public var notebookDocument_didSave : nvim.type.vim.lsp.protocol.Methods;
	extern public var shutdown : nvim.type.vim.lsp.protocol.Methods;
	extern public var telemetry_event : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_codeAction : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_codeLens : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_colorPresentation : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_completion : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_declaration : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_definition : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_diagnostic : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_didChange : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_didClose : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_didOpen : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_didSave : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_documentColor : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_documentHighlight : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_documentLink : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_documentSymbol : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_foldingRange : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_formatting : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_hover : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_implementation : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_inlayHint : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_inlineCompletion : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_inlineValue : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_linkedEditingRange : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_moniker : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_onTypeFormatting : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_prepareCallHierarchy : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_prepareRename : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_prepareTypeHierarchy : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_publishDiagnostics : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_rangeFormatting : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_rangesFormatting : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_references : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_rename : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_selectionRange : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_semanticTokens_full : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_semanticTokens_full_delta : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_semanticTokens_range : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_signatureHelp : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_typeDefinition : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_willSave : nvim.type.vim.lsp.protocol.Methods;
	extern public var textDocument_willSaveWaitUntil : nvim.type.vim.lsp.protocol.Methods;
	extern public var typeHierarchy_subtypes : nvim.type.vim.lsp.protocol.Methods;
	extern public var typeHierarchy_supertypes : nvim.type.vim.lsp.protocol.Methods;
	extern public var window_logMessage : nvim.type.vim.lsp.protocol.Methods;
	extern public var window_showDocument : nvim.type.vim.lsp.protocol.Methods;
	extern public var window_showMessage : nvim.type.vim.lsp.protocol.Methods;
	extern public var window_showMessageRequest : nvim.type.vim.lsp.protocol.Methods;
	extern public var window_workDoneProgress_cancel : nvim.type.vim.lsp.protocol.Methods;
	extern public var window_workDoneProgress_create : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspaceSymbol_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_applyEdit : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_codeLens_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_configuration : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_diagnostic : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_diagnostic_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_didChangeConfiguration : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_didChangeWatchedFiles : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_didChangeWorkspaceFolders : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_didCreateFiles : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_didDeleteFiles : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_didRenameFiles : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_executeCommand : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_foldingRange_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_inlayHint_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_inlineValue_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_semanticTokens_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_symbol : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_textDocumentContent : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_textDocumentContent_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_willCreateFiles : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_willDeleteFiles : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_willRenameFiles : nvim.type.vim.lsp.protocol.Methods;
	extern public var workspace_workspaceFolders : nvim.type.vim.lsp.protocol.Methods;
}

/**
	```lua
	(field) vim.lsp.protocol.ResourceOperationKind: table
	```
**/
@:structInit class ResourceOperationKind {
	/**
		```lua
		(field) ResourceOperationKind.Create: unknown
		```
	**/
	extern public var Create : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.Delete: unknown
		```
	**/
	extern public var Delete : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.Rename: unknown
		```
	**/
	extern public var Rename : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.create: unknown
		```
	**/
	extern public var create : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.delete: unknown
		```
	**/
	extern public var delete : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.rename: unknown
		```
	**/
	extern public var rename : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.SymbolKind: table
	```
	
	---
	
	 A symbol kind.
**/
@:structInit class SymbolKind {
	/**
		```lua
		(field) SymbolKind.Array: unknown
		```
	**/
	extern public var Array : Dynamic;
	/**
		```lua
		(field) SymbolKind.Boolean: unknown
		```
	**/
	extern public var Boolean : Dynamic;
	/**
		```lua
		(field) SymbolKind.Class: unknown
		```
	**/
	extern public var Class : Dynamic;
	/**
		```lua
		(field) SymbolKind.Constant: unknown
		```
	**/
	extern public var Constant : Dynamic;
	/**
		```lua
		(field) SymbolKind.Constructor: unknown
		```
	**/
	extern public var Constructor : Dynamic;
	/**
		```lua
		(field) SymbolKind.Enum: unknown
		```
	**/
	extern public var Enum : Dynamic;
	/**
		```lua
		(field) SymbolKind.EnumMember: unknown
		```
	**/
	extern public var EnumMember : Dynamic;
	/**
		```lua
		(field) SymbolKind.Event: unknown
		```
	**/
	extern public var Event : Dynamic;
	/**
		```lua
		(field) SymbolKind.Field: unknown
		```
	**/
	extern public var Field : Dynamic;
	/**
		```lua
		(field) SymbolKind.File: unknown
		```
	**/
	extern public var File : Dynamic;
	/**
		```lua
		(field) SymbolKind.Function: unknown
		```
	**/
	extern public var Function : Dynamic;
	/**
		```lua
		(field) SymbolKind.Interface: unknown
		```
	**/
	extern public var Interface : Dynamic;
	/**
		```lua
		(field) SymbolKind.Key: unknown
		```
	**/
	extern public var Key : Dynamic;
	/**
		```lua
		(field) SymbolKind.Method: unknown
		```
	**/
	extern public var Method : Dynamic;
	/**
		```lua
		(field) SymbolKind.Module: unknown
		```
	**/
	extern public var Module : Dynamic;
	/**
		```lua
		(field) SymbolKind.Namespace: unknown
		```
	**/
	extern public var Namespace : Dynamic;
	/**
		```lua
		(field) SymbolKind.Null: unknown
		```
	**/
	extern public var Null : Dynamic;
	/**
		```lua
		(field) SymbolKind.Number: unknown
		```
	**/
	extern public var Number : Dynamic;
	/**
		```lua
		(field) SymbolKind.Object: unknown
		```
	**/
	extern public var Object : Dynamic;
	/**
		```lua
		(field) SymbolKind.Operator: unknown
		```
	**/
	extern public var Operator : Dynamic;
	/**
		```lua
		(field) SymbolKind.Package: unknown
		```
	**/
	extern public var Package : Dynamic;
	/**
		```lua
		(field) SymbolKind.Property: unknown
		```
	**/
	extern public var Property : Dynamic;
	/**
		```lua
		(field) SymbolKind.String: unknown
		```
	**/
	extern public var String : Dynamic;
	/**
		```lua
		(field) SymbolKind.Struct: unknown
		```
	**/
	extern public var Struct : Dynamic;
	/**
		```lua
		(field) SymbolKind.TypeParameter: unknown
		```
	**/
	extern public var TypeParameter : Dynamic;
	/**
		```lua
		(field) SymbolKind.Variable: unknown
		```
	**/
	extern public var Variable : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.TextDocumentSaveReason: table
	```
	
	---
	
	 Represents reasons why a text document is saved.
**/
@:structInit class TextDocumentSaveReason {
	/**
		```lua
		(field) TextDocumentSaveReason.AfterDelay: unknown
		```
	**/
	extern public var AfterDelay : Dynamic;
	/**
		```lua
		(field) TextDocumentSaveReason.FocusOut: unknown
		```
	**/
	extern public var FocusOut : Dynamic;
	/**
		```lua
		(field) TextDocumentSaveReason.Manual: unknown
		```
	**/
	extern public var Manual : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.TextDocumentSyncKind: table
	```
	
	---
	
	 Defines how the host (editor) should sync document changes to the language server.
**/
@:structInit class TextDocumentSyncKind {
	/**
		```lua
		(field) TextDocumentSyncKind.Full: unknown
		```
	**/
	extern public var Full : Dynamic;
	/**
		```lua
		(field) TextDocumentSyncKind.Incremental: unknown
		```
	**/
	extern public var Incremental : Dynamic;
	/**
		```lua
		(field) TextDocumentSyncKind.None: unknown
		```
	**/
	extern public var None : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.WatchKind: table
	```
**/
@:structInit class WatchKind {
	/**
		```lua
		(field) WatchKind.Change: unknown
		```
	**/
	extern public var Change : Dynamic;
	/**
		```lua
		(field) WatchKind.Create: unknown
		```
	**/
	extern public var Create : Dynamic;
	/**
		```lua
		(field) WatchKind.Delete: unknown
		```
	**/
	extern public var Delete : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol._request_name_to_capability: table
	```
	
	---
	
	 stylua: ignore start
	 Generated by gen_lsp.lua, keep at end of file.
	 Maps method names to the required server capability
**/
@:structInit class RequestNameToCapability {

}

/**
	```lua
	(class) vim.lsp.protocol
	```
	
	---
	
	 Protocol for the Microsoft Language Server Protocol (mslsp)
**/
@:structInit class Protocol {
	/**
		```lua
		(field) vim.lsp.protocol.CodeActionKind: table
		```
		
		---
		
		 A set of predefined code action kinds
	**/
	extern public var CodeActionKind : CodeActionKind;
	/**
		```lua
		(field) vim.lsp.protocol.CodeActionTriggerKind: table
		```
		
		---
		
		 The reason why code actions were requested.
	**/
	extern public var CodeActionTriggerKind : CodeActionTriggerKind;
	/**
		```lua
		(field) vim.lsp.protocol.CompletionItemKind: table
		```
		
		---
		
		 The kind of a completion entry.
	**/
	extern public var CompletionItemKind : CompletionItemKind;
	/**
		```lua
		(field) vim.lsp.protocol.CompletionTag: table
		```
		
		---
		
		 Completion item tags are extra annotations that tweak the rendering of a
		 completion item
	**/
	extern public var CompletionTag : CompletionTag;
	/**
		```lua
		(field) vim.lsp.protocol.CompletionTriggerKind: table
		```
		
		---
		
		 How a completion was triggered
	**/
	extern public var CompletionTriggerKind : CompletionTriggerKind;
	/**
		```lua
		(field) vim.lsp.protocol.DiagnosticSeverity: table
		```
	**/
	extern public var DiagnosticSeverity : DiagnosticSeverity;
	/**
		```lua
		(field) vim.lsp.protocol.DiagnosticTag: table
		```
	**/
	extern public var DiagnosticTag : DiagnosticTag;
	/**
		```lua
		(field) vim.lsp.protocol.DocumentHighlightKind: table
		```
		
		---
		
		 A document highlight kind.
	**/
	extern public var DocumentHighlightKind : DocumentHighlightKind;
	/**
		```lua
		(field) vim.lsp.protocol.ErrorCodes: table
		```
	**/
	extern public var ErrorCodes : ErrorCodes;
	/**
		```lua
		(field) vim.lsp.protocol.FailureHandlingKind: table
		```
	**/
	extern public var FailureHandlingKind : FailureHandlingKind;
	/**
		```lua
		(field) vim.lsp.protocol.FileChangeType: table
		```
		
		---
		
		 The file event type.
	**/
	extern public var FileChangeType : FileChangeType;
	/**
		```lua
		(field) vim.lsp.protocol.InitializeError: table
		```
		
		---
		
		 Known error codes for an `InitializeError`;
	**/
	extern public var InitializeError : InitializeError;
	/**
		```lua
		(field) vim.lsp.protocol.InsertTextFormat: table
		```
		
		---
		
		 Defines whether the insert text in a completion item should be interpreted as
		 plain text or a snippet.
	**/
	extern public var InsertTextFormat : InsertTextFormat;
	/**
		```lua
		(field) vim.lsp.protocol.MarkupKind: table
		```
		
		---
		
		 Describes the content type that a client supports in various
		 result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
		
		 Please note that `MarkupKinds` must not start with a `$`. This kinds
		 are reserved for internal usage.
	**/
	extern public var MarkupKind : MarkupKind;
	/**
		```lua
		(field) vim.lsp.protocol.MessageType: table
		```
	**/
	extern public var MessageType : MessageType;
	/**
		```lua
		(field) vim.lsp.protocol.Methods: table
		```
		
		---
		
		 LSP method names.
		See: ~https~ ://microsoft.github.io/language-server-protocol/specification/#metaModel
	**/
	extern public var Methods : Methods;
	/**
		```lua
		(field) vim.lsp.protocol.ResourceOperationKind: table
		```
	**/
	extern public var ResourceOperationKind : ResourceOperationKind;
	/**
		```lua
		(field) vim.lsp.protocol.SymbolKind: table
		```
		
		---
		
		 A symbol kind.
	**/
	extern public var SymbolKind : SymbolKind;
	/**
		```lua
		(field) vim.lsp.protocol.TextDocumentSaveReason: table
		```
		
		---
		
		 Represents reasons why a text document is saved.
	**/
	extern public var TextDocumentSaveReason : TextDocumentSaveReason;
	/**
		```lua
		(field) vim.lsp.protocol.TextDocumentSyncKind: table
		```
		
		---
		
		 Defines how the host (editor) should sync document changes to the language server.
	**/
	extern public var TextDocumentSyncKind : TextDocumentSyncKind;
	/**
		```lua
		(field) vim.lsp.protocol.WatchKind: table
		```
	**/
	extern public var WatchKind : WatchKind;
	/**
		```lua
		(field) vim.lsp.protocol._request_name_to_capability: table
		```
		
		---
		
		 stylua: ignore start
		 Generated by gen_lsp.lua, keep at end of file.
		 Maps method names to the required server capability
	**/
	extern public var _request_name_to_capability : RequestNameToCapability;
	/**
		```lua
		function vim.lsp.protocol.make_client_capabilities()
		  -> lsp.ClientCapabilities
		```
		
		---
		
		 Gets a new ClientCapabilities object describing the LSP client
		 capabilities.
	**/
	@:luaDotMethod
	extern public function make_client_capabilities():nvim.type.lsp.ClientCapabilities;
	@:native("resolve_capabilities")
	@:luaDotMethod
	private extern function __resolve_capabilities(server_capabilities:lua.Table.AnyTable):Null<nvim.type.lsp.ServerCapabilities>;
	/**
		```lua
		function vim.lsp.protocol.resolve_capabilities(server_capabilities: table)
		  -> lsp.ServerCapabilities|nil
		```
		
		---
		
		 Creates a normalized object describing LSP server capabilities.
		
		@*param* `server_capabilities` — Table of capabilities supported by the server
		
		@*return* — : Normalized table of capabilities
	**/
	@:luaDotMethod
	inline public function resolve_capabilities(server_capabilities:lua.Table.AnyTable):Null<nvim.type.lsp.ServerCapabilities> {
		server_capabilities = nvim.helper.Arg.pure(server_capabilities);
		final result = __resolve_capabilities(server_capabilities);
		return result;
	}
}