package nvim.type.vim.lsp;

/**
	```lua
	(field) vim.lsp.protocol.CodeActionKind: table
	```
	
	---
	
	 A set of predefined code action kinds
**/
@:structInit extern class CodeActionKind {
	/**
		```lua
		(field) CodeActionKind.Empty: unknown
		```
	**/
	var Empty : Dynamic;
	/**
		```lua
		(field) CodeActionKind.QuickFix: unknown
		```
	**/
	var QuickFix : Dynamic;
	/**
		```lua
		(field) CodeActionKind.Refactor: unknown
		```
	**/
	var Refactor : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorExtract: unknown
		```
	**/
	var RefactorExtract : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorInline: unknown
		```
	**/
	var RefactorInline : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorRewrite: unknown
		```
	**/
	var RefactorRewrite : Dynamic;
	/**
		```lua
		(field) CodeActionKind.Source: unknown
		```
	**/
	var Source : Dynamic;
	/**
		```lua
		(field) CodeActionKind.SourceOrganizeImports: unknown
		```
	**/
	var SourceOrganizeImports : Dynamic;
	/**
		```lua
		(field) CodeActionKind.quickfix: unknown
		```
	**/
	var quickfix : Dynamic;
	/**
		```lua
		(field) CodeActionKind.refactor: unknown
		```
	**/
	var refactor : Dynamic;
	/**
		```lua
		(field) CodeActionKind.source: unknown
		```
	**/
	var source : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.CodeActionTriggerKind: table
	```
	
	---
	
	 The reason why code actions were requested.
**/
@:structInit extern class CodeActionTriggerKind {
	/**
		```lua
		(field) CodeActionTriggerKind.Automatic: unknown
		```
	**/
	var Automatic : Dynamic;
	/**
		```lua
		(field) CodeActionTriggerKind.Invoked: unknown
		```
	**/
	var Invoked : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.CompletionItemKind: table
	```
	
	---
	
	 The kind of a completion entry.
**/
@:structInit extern class CompletionItemKind {
	/**
		```lua
		(field) CompletionItemKind.Class: unknown
		```
	**/
	var Class : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Color: unknown
		```
	**/
	var Color : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Constant: unknown
		```
	**/
	var Constant : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Constructor: unknown
		```
	**/
	var Constructor : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Enum: unknown
		```
	**/
	var Enum : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.EnumMember: unknown
		```
	**/
	var EnumMember : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Event: unknown
		```
	**/
	var Event : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Field: unknown
		```
	**/
	var Field : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.File: unknown
		```
	**/
	var File : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Folder: unknown
		```
	**/
	var Folder : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Function: unknown
		```
	**/
	var Function : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Interface: unknown
		```
	**/
	var Interface : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Keyword: unknown
		```
	**/
	var Keyword : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Method: unknown
		```
	**/
	var Method : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Module: unknown
		```
	**/
	var Module : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Operator: unknown
		```
	**/
	var Operator : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Property: unknown
		```
	**/
	var Property : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Reference: unknown
		```
	**/
	var Reference : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Snippet: unknown
		```
	**/
	var Snippet : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Struct: unknown
		```
	**/
	var Struct : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Text: unknown
		```
	**/
	var Text : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.TypeParameter: unknown
		```
	**/
	var TypeParameter : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Unit: unknown
		```
	**/
	var Unit : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Value: unknown
		```
	**/
	var Value : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Variable: unknown
		```
	**/
	var Variable : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.CompletionTag: table
	```
	
	---
	
	 Completion item tags are extra annotations that tweak the rendering of a
	 completion item
**/
@:structInit extern class CompletionTag {
	/**
		```lua
		(field) CompletionTag.Deprecated: unknown
		```
	**/
	var Deprecated : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.CompletionTriggerKind: table
	```
	
	---
	
	 How a completion was triggered
**/
@:structInit extern class CompletionTriggerKind {
	/**
		```lua
		(field) CompletionTriggerKind.Invoked: unknown
		```
	**/
	var Invoked : Dynamic;
	/**
		```lua
		(field) CompletionTriggerKind.TriggerCharacter: unknown
		```
	**/
	var TriggerCharacter : Dynamic;
	/**
		```lua
		(field) CompletionTriggerKind.TriggerForIncompleteCompletions: unknown
		```
	**/
	var TriggerForIncompleteCompletions : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.DiagnosticSeverity: table
	```
**/
@:structInit extern class DiagnosticSeverity {
	/**
		```lua
		(field) DiagnosticSeverity.Error: unknown
		```
	**/
	var Error : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Hint: unknown
		```
	**/
	var Hint : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Information: unknown
		```
	**/
	var Information : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Warning: unknown
		```
	**/
	var Warning : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.DiagnosticTag: table
	```
**/
@:structInit extern class DiagnosticTag {
	/**
		```lua
		(field) DiagnosticTag.Deprecated: unknown
		```
	**/
	var Deprecated : Dynamic;
	/**
		```lua
		(field) DiagnosticTag.Unnecessary: unknown
		```
	**/
	var Unnecessary : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.DocumentHighlightKind: table
	```
	
	---
	
	 A document highlight kind.
**/
@:structInit extern class DocumentHighlightKind {
	/**
		```lua
		(field) DocumentHighlightKind.Read: unknown
		```
	**/
	var Read : Dynamic;
	/**
		```lua
		(field) DocumentHighlightKind.Text: unknown
		```
	**/
	var Text : Dynamic;
	/**
		```lua
		(field) DocumentHighlightKind.Write: unknown
		```
	**/
	var Write : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.ErrorCodes: table
	```
**/
@:structInit extern class ErrorCodes {
	/**
		```lua
		(field) ErrorCodes.ContentModified: unknown
		```
	**/
	var ContentModified : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InternalError: unknown
		```
	**/
	var InternalError : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InvalidParams: unknown
		```
	**/
	var InvalidParams : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InvalidRequest: unknown
		```
	**/
	var InvalidRequest : Dynamic;
	/**
		```lua
		(field) ErrorCodes.MethodNotFound: unknown
		```
	**/
	var MethodNotFound : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ParseError: unknown
		```
	**/
	var ParseError : Dynamic;
	/**
		```lua
		(field) ErrorCodes.RequestCancelled: unknown
		```
	**/
	var RequestCancelled : Dynamic;
	/**
		```lua
		(field) ErrorCodes.RequestFailed: unknown
		```
	**/
	var RequestFailed : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ServerCancelled: unknown
		```
	**/
	var ServerCancelled : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ServerNotInitialized: unknown
		```
	**/
	var ServerNotInitialized : Dynamic;
	/**
		```lua
		(field) ErrorCodes.UnknownErrorCode: unknown
		```
	**/
	var UnknownErrorCode : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.FailureHandlingKind: table
	```
**/
@:structInit extern class FailureHandlingKind {
	/**
		```lua
		(field) FailureHandlingKind.Abort: unknown
		```
	**/
	var Abort : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.TextOnlyTransactional: unknown
		```
	**/
	var TextOnlyTransactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.Transactional: unknown
		```
	**/
	var Transactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.Undo: unknown
		```
	**/
	var Undo : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.abort: unknown
		```
	**/
	var abort : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.textOnlyTransactional: unknown
		```
	**/
	var textOnlyTransactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.transactional: unknown
		```
	**/
	var transactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.undo: unknown
		```
	**/
	var undo : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.FileChangeType: table
	```
	
	---
	
	 The file event type.
**/
@:structInit extern class FileChangeType {
	/**
		```lua
		(field) FileChangeType.Changed: unknown
		```
	**/
	var Changed : Dynamic;
	/**
		```lua
		(field) FileChangeType.Created: unknown
		```
	**/
	var Created : Dynamic;
	/**
		```lua
		(field) FileChangeType.Deleted: unknown
		```
	**/
	var Deleted : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.InitializeError: table
	```
	
	---
	
	 Known error codes for an `InitializeError`;
**/
@:structInit extern class InitializeError {
	/**
		```lua
		(field) InitializeError.unknownProtocolVersion: unknown
		```
	**/
	var unknownProtocolVersion : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.InsertTextFormat: table
	```
	
	---
	
	 Defines whether the insert text in a completion item should be interpreted as
	 plain text or a snippet.
**/
@:structInit extern class InsertTextFormat {
	/**
		```lua
		(field) InsertTextFormat.PlainText: unknown
		```
	**/
	var PlainText : Dynamic;
	/**
		```lua
		(field) InsertTextFormat.Snippet: unknown
		```
	**/
	var Snippet : Dynamic;
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
@:structInit extern class MarkupKind {
	/**
		```lua
		(field) MarkupKind.Markdown: unknown
		```
	**/
	var Markdown : Dynamic;
	/**
		```lua
		(field) MarkupKind.PlainText: unknown
		```
	**/
	var PlainText : Dynamic;
	/**
		```lua
		(field) MarkupKind.markdown: unknown
		```
	**/
	var markdown : Dynamic;
	/**
		```lua
		(field) MarkupKind.plaintext: unknown
		```
	**/
	var plaintext : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.MessageType: table
	```
**/
@:structInit extern class MessageType {
	/**
		```lua
		(field) MessageType.Debug: unknown
		```
	**/
	var Debug : Dynamic;
	/**
		```lua
		(field) MessageType.Error: unknown
		```
	**/
	var Error : Dynamic;
	/**
		```lua
		(field) MessageType.Info: unknown
		```
	**/
	var Info : Dynamic;
	/**
		```lua
		(field) MessageType.Log: unknown
		```
	**/
	var Log : Dynamic;
	/**
		```lua
		(field) MessageType.Warning: unknown
		```
	**/
	var Warning : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.Methods: table
	```
	
	---
	
	 LSP method names.
	See: ~https~ ://microsoft.github.io/language-server-protocol/specification/#metaModel
**/
@:structInit extern class Methods {
	var callHierarchy_incomingCalls : nvim.type.vim.lsp.protocol.Methods;
	var callHierarchy_outgoingCalls : nvim.type.vim.lsp.protocol.Methods;
	var client_registerCapability : nvim.type.vim.lsp.protocol.Methods;
	var client_unregisterCapability : nvim.type.vim.lsp.protocol.Methods;
	var codeAction_resolve : nvim.type.vim.lsp.protocol.Methods;
	var codeLens_resolve : nvim.type.vim.lsp.protocol.Methods;
	var completionItem_resolve : nvim.type.vim.lsp.protocol.Methods;
	var documentLink_resolve : nvim.type.vim.lsp.protocol.Methods;
	var dollar_cancelRequest : nvim.type.vim.lsp.protocol.Methods;
	var dollar_logTrace : nvim.type.vim.lsp.protocol.Methods;
	var dollar_progress : nvim.type.vim.lsp.protocol.Methods;
	var dollar_setTrace : nvim.type.vim.lsp.protocol.Methods;
	var exit : nvim.type.vim.lsp.protocol.Methods;
	var initialize : nvim.type.vim.lsp.protocol.Methods;
	var initialized : nvim.type.vim.lsp.protocol.Methods;
	var inlayHint_resolve : nvim.type.vim.lsp.protocol.Methods;
	var notebookDocument_didChange : nvim.type.vim.lsp.protocol.Methods;
	var notebookDocument_didClose : nvim.type.vim.lsp.protocol.Methods;
	var notebookDocument_didOpen : nvim.type.vim.lsp.protocol.Methods;
	var notebookDocument_didSave : nvim.type.vim.lsp.protocol.Methods;
	var shutdown : nvim.type.vim.lsp.protocol.Methods;
	var telemetry_event : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_codeAction : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_codeLens : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_colorPresentation : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_completion : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_declaration : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_definition : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_diagnostic : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_didChange : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_didClose : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_didOpen : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_didSave : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_documentColor : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_documentHighlight : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_documentLink : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_documentSymbol : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_foldingRange : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_formatting : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_hover : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_implementation : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_inlayHint : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_inlineCompletion : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_inlineValue : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_linkedEditingRange : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_moniker : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_onTypeFormatting : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_prepareCallHierarchy : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_prepareRename : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_prepareTypeHierarchy : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_publishDiagnostics : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_rangeFormatting : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_rangesFormatting : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_references : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_rename : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_selectionRange : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_semanticTokens_full : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_semanticTokens_full_delta : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_semanticTokens_range : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_signatureHelp : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_typeDefinition : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_willSave : nvim.type.vim.lsp.protocol.Methods;
	var textDocument_willSaveWaitUntil : nvim.type.vim.lsp.protocol.Methods;
	var typeHierarchy_subtypes : nvim.type.vim.lsp.protocol.Methods;
	var typeHierarchy_supertypes : nvim.type.vim.lsp.protocol.Methods;
	var window_logMessage : nvim.type.vim.lsp.protocol.Methods;
	var window_showDocument : nvim.type.vim.lsp.protocol.Methods;
	var window_showMessage : nvim.type.vim.lsp.protocol.Methods;
	var window_showMessageRequest : nvim.type.vim.lsp.protocol.Methods;
	var window_workDoneProgress_cancel : nvim.type.vim.lsp.protocol.Methods;
	var window_workDoneProgress_create : nvim.type.vim.lsp.protocol.Methods;
	var workspaceSymbol_resolve : nvim.type.vim.lsp.protocol.Methods;
	var workspace_applyEdit : nvim.type.vim.lsp.protocol.Methods;
	var workspace_codeLens_refresh : nvim.type.vim.lsp.protocol.Methods;
	var workspace_configuration : nvim.type.vim.lsp.protocol.Methods;
	var workspace_diagnostic : nvim.type.vim.lsp.protocol.Methods;
	var workspace_diagnostic_refresh : nvim.type.vim.lsp.protocol.Methods;
	var workspace_didChangeConfiguration : nvim.type.vim.lsp.protocol.Methods;
	var workspace_didChangeWatchedFiles : nvim.type.vim.lsp.protocol.Methods;
	var workspace_didChangeWorkspaceFolders : nvim.type.vim.lsp.protocol.Methods;
	var workspace_didCreateFiles : nvim.type.vim.lsp.protocol.Methods;
	var workspace_didDeleteFiles : nvim.type.vim.lsp.protocol.Methods;
	var workspace_didRenameFiles : nvim.type.vim.lsp.protocol.Methods;
	var workspace_executeCommand : nvim.type.vim.lsp.protocol.Methods;
	var workspace_foldingRange_refresh : nvim.type.vim.lsp.protocol.Methods;
	var workspace_inlayHint_refresh : nvim.type.vim.lsp.protocol.Methods;
	var workspace_inlineValue_refresh : nvim.type.vim.lsp.protocol.Methods;
	var workspace_semanticTokens_refresh : nvim.type.vim.lsp.protocol.Methods;
	var workspace_symbol : nvim.type.vim.lsp.protocol.Methods;
	var workspace_textDocumentContent : nvim.type.vim.lsp.protocol.Methods;
	var workspace_textDocumentContent_refresh : nvim.type.vim.lsp.protocol.Methods;
	var workspace_willCreateFiles : nvim.type.vim.lsp.protocol.Methods;
	var workspace_willDeleteFiles : nvim.type.vim.lsp.protocol.Methods;
	var workspace_willRenameFiles : nvim.type.vim.lsp.protocol.Methods;
	var workspace_workspaceFolders : nvim.type.vim.lsp.protocol.Methods;
}

/**
	```lua
	(field) vim.lsp.protocol.ResourceOperationKind: table
	```
**/
@:structInit extern class ResourceOperationKind {
	/**
		```lua
		(field) ResourceOperationKind.Create: unknown
		```
	**/
	var Create : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.Delete: unknown
		```
	**/
	var Delete : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.Rename: unknown
		```
	**/
	var Rename : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.create: unknown
		```
	**/
	var create : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.delete: unknown
		```
	**/
	var delete : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.rename: unknown
		```
	**/
	var rename : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.SymbolKind: table
	```
	
	---
	
	 A symbol kind.
**/
@:structInit extern class SymbolKind {
	/**
		```lua
		(field) SymbolKind.Array: unknown
		```
	**/
	var Array : Dynamic;
	/**
		```lua
		(field) SymbolKind.Boolean: unknown
		```
	**/
	var Boolean : Dynamic;
	/**
		```lua
		(field) SymbolKind.Class: unknown
		```
	**/
	var Class : Dynamic;
	/**
		```lua
		(field) SymbolKind.Constant: unknown
		```
	**/
	var Constant : Dynamic;
	/**
		```lua
		(field) SymbolKind.Constructor: unknown
		```
	**/
	var Constructor : Dynamic;
	/**
		```lua
		(field) SymbolKind.Enum: unknown
		```
	**/
	var Enum : Dynamic;
	/**
		```lua
		(field) SymbolKind.EnumMember: unknown
		```
	**/
	var EnumMember : Dynamic;
	/**
		```lua
		(field) SymbolKind.Event: unknown
		```
	**/
	var Event : Dynamic;
	/**
		```lua
		(field) SymbolKind.Field: unknown
		```
	**/
	var Field : Dynamic;
	/**
		```lua
		(field) SymbolKind.File: unknown
		```
	**/
	var File : Dynamic;
	/**
		```lua
		(field) SymbolKind.Function: unknown
		```
	**/
	var Function : Dynamic;
	/**
		```lua
		(field) SymbolKind.Interface: unknown
		```
	**/
	var Interface : Dynamic;
	/**
		```lua
		(field) SymbolKind.Key: unknown
		```
	**/
	var Key : Dynamic;
	/**
		```lua
		(field) SymbolKind.Method: unknown
		```
	**/
	var Method : Dynamic;
	/**
		```lua
		(field) SymbolKind.Module: unknown
		```
	**/
	var Module : Dynamic;
	/**
		```lua
		(field) SymbolKind.Namespace: unknown
		```
	**/
	var Namespace : Dynamic;
	/**
		```lua
		(field) SymbolKind.Null: unknown
		```
	**/
	var Null : Dynamic;
	/**
		```lua
		(field) SymbolKind.Number: unknown
		```
	**/
	var Number : Dynamic;
	/**
		```lua
		(field) SymbolKind.Object: unknown
		```
	**/
	var Object : Dynamic;
	/**
		```lua
		(field) SymbolKind.Operator: unknown
		```
	**/
	var Operator : Dynamic;
	/**
		```lua
		(field) SymbolKind.Package: unknown
		```
	**/
	var Package : Dynamic;
	/**
		```lua
		(field) SymbolKind.Property: unknown
		```
	**/
	var Property : Dynamic;
	/**
		```lua
		(field) SymbolKind.String: unknown
		```
	**/
	var String : Dynamic;
	/**
		```lua
		(field) SymbolKind.Struct: unknown
		```
	**/
	var Struct : Dynamic;
	/**
		```lua
		(field) SymbolKind.TypeParameter: unknown
		```
	**/
	var TypeParameter : Dynamic;
	/**
		```lua
		(field) SymbolKind.Variable: unknown
		```
	**/
	var Variable : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.TextDocumentSaveReason: table
	```
	
	---
	
	 Represents reasons why a text document is saved.
**/
@:structInit extern class TextDocumentSaveReason {
	/**
		```lua
		(field) TextDocumentSaveReason.AfterDelay: unknown
		```
	**/
	var AfterDelay : Dynamic;
	/**
		```lua
		(field) TextDocumentSaveReason.FocusOut: unknown
		```
	**/
	var FocusOut : Dynamic;
	/**
		```lua
		(field) TextDocumentSaveReason.Manual: unknown
		```
	**/
	var Manual : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.TextDocumentSyncKind: table
	```
	
	---
	
	 Defines how the host (editor) should sync document changes to the language server.
**/
@:structInit extern class TextDocumentSyncKind {
	/**
		```lua
		(field) TextDocumentSyncKind.Full: unknown
		```
	**/
	var Full : Dynamic;
	/**
		```lua
		(field) TextDocumentSyncKind.Incremental: unknown
		```
	**/
	var Incremental : Dynamic;
	/**
		```lua
		(field) TextDocumentSyncKind.None: unknown
		```
	**/
	var None : Dynamic;
}

/**
	```lua
	(field) vim.lsp.protocol.WatchKind: table
	```
**/
@:structInit extern class WatchKind {
	/**
		```lua
		(field) WatchKind.Change: unknown
		```
	**/
	var Change : Dynamic;
	/**
		```lua
		(field) WatchKind.Create: unknown
		```
	**/
	var Create : Dynamic;
	/**
		```lua
		(field) WatchKind.Delete: unknown
		```
	**/
	var Delete : Dynamic;
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
@:structInit extern class RequestNameToCapability {

}

/**
	```lua
	(class) vim.lsp.protocol
	```
	
	---
	
	 Protocol for the Microsoft Language Server Protocol (mslsp)
**/
@:structInit extern class Protocol {
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
	function make_client_capabilities():nvim.type.lsp.ClientCapabilities;
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
	function resolve_capabilities(server_capabilities:lua.Table.AnyTable):Null<nvim.type.lsp.ServerCapabilities>;
}