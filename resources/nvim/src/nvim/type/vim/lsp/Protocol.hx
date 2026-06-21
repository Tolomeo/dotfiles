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
	extern var Empty : Dynamic;
	/**
		```lua
		(field) CodeActionKind.QuickFix: unknown
		```
	**/
	extern var QuickFix : Dynamic;
	/**
		```lua
		(field) CodeActionKind.Refactor: unknown
		```
	**/
	extern var Refactor : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorExtract: unknown
		```
	**/
	extern var RefactorExtract : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorInline: unknown
		```
	**/
	extern var RefactorInline : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorRewrite: unknown
		```
	**/
	extern var RefactorRewrite : Dynamic;
	/**
		```lua
		(field) CodeActionKind.Source: unknown
		```
	**/
	extern var Source : Dynamic;
	/**
		```lua
		(field) CodeActionKind.SourceOrganizeImports: unknown
		```
	**/
	extern var SourceOrganizeImports : Dynamic;
	/**
		```lua
		(field) CodeActionKind.quickfix: unknown
		```
	**/
	extern var quickfix : Dynamic;
	/**
		```lua
		(field) CodeActionKind.refactor: unknown
		```
	**/
	extern var refactor : Dynamic;
	/**
		```lua
		(field) CodeActionKind.source: unknown
		```
	**/
	extern var source : Dynamic;
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
	extern var Automatic : Dynamic;
	/**
		```lua
		(field) CodeActionTriggerKind.Invoked: unknown
		```
	**/
	extern var Invoked : Dynamic;
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
	extern var Class : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Color: unknown
		```
	**/
	extern var Color : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Constant: unknown
		```
	**/
	extern var Constant : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Constructor: unknown
		```
	**/
	extern var Constructor : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Enum: unknown
		```
	**/
	extern var Enum : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.EnumMember: unknown
		```
	**/
	extern var EnumMember : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Event: unknown
		```
	**/
	extern var Event : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Field: unknown
		```
	**/
	extern var Field : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.File: unknown
		```
	**/
	extern var File : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Folder: unknown
		```
	**/
	extern var Folder : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Function: unknown
		```
	**/
	extern var Function : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Interface: unknown
		```
	**/
	extern var Interface : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Keyword: unknown
		```
	**/
	extern var Keyword : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Method: unknown
		```
	**/
	extern var Method : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Module: unknown
		```
	**/
	extern var Module : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Operator: unknown
		```
	**/
	extern var Operator : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Property: unknown
		```
	**/
	extern var Property : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Reference: unknown
		```
	**/
	extern var Reference : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Snippet: unknown
		```
	**/
	extern var Snippet : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Struct: unknown
		```
	**/
	extern var Struct : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Text: unknown
		```
	**/
	extern var Text : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.TypeParameter: unknown
		```
	**/
	extern var TypeParameter : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Unit: unknown
		```
	**/
	extern var Unit : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Value: unknown
		```
	**/
	extern var Value : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Variable: unknown
		```
	**/
	extern var Variable : Dynamic;
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
	extern var Deprecated : Dynamic;
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
	extern var Invoked : Dynamic;
	/**
		```lua
		(field) CompletionTriggerKind.TriggerCharacter: unknown
		```
	**/
	extern var TriggerCharacter : Dynamic;
	/**
		```lua
		(field) CompletionTriggerKind.TriggerForIncompleteCompletions: unknown
		```
	**/
	extern var TriggerForIncompleteCompletions : Dynamic;
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
	extern var Error : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Hint: unknown
		```
	**/
	extern var Hint : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Information: unknown
		```
	**/
	extern var Information : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Warning: unknown
		```
	**/
	extern var Warning : Dynamic;
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
	extern var Deprecated : Dynamic;
	/**
		```lua
		(field) DiagnosticTag.Unnecessary: unknown
		```
	**/
	extern var Unnecessary : Dynamic;
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
	extern var Read : Dynamic;
	/**
		```lua
		(field) DocumentHighlightKind.Text: unknown
		```
	**/
	extern var Text : Dynamic;
	/**
		```lua
		(field) DocumentHighlightKind.Write: unknown
		```
	**/
	extern var Write : Dynamic;
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
	extern var ContentModified : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InternalError: unknown
		```
	**/
	extern var InternalError : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InvalidParams: unknown
		```
	**/
	extern var InvalidParams : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InvalidRequest: unknown
		```
	**/
	extern var InvalidRequest : Dynamic;
	/**
		```lua
		(field) ErrorCodes.MethodNotFound: unknown
		```
	**/
	extern var MethodNotFound : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ParseError: unknown
		```
	**/
	extern var ParseError : Dynamic;
	/**
		```lua
		(field) ErrorCodes.RequestCancelled: unknown
		```
	**/
	extern var RequestCancelled : Dynamic;
	/**
		```lua
		(field) ErrorCodes.RequestFailed: unknown
		```
	**/
	extern var RequestFailed : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ServerCancelled: unknown
		```
	**/
	extern var ServerCancelled : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ServerNotInitialized: unknown
		```
	**/
	extern var ServerNotInitialized : Dynamic;
	/**
		```lua
		(field) ErrorCodes.UnknownErrorCode: unknown
		```
	**/
	extern var UnknownErrorCode : Dynamic;
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
	extern var Abort : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.TextOnlyTransactional: unknown
		```
	**/
	extern var TextOnlyTransactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.Transactional: unknown
		```
	**/
	extern var Transactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.Undo: unknown
		```
	**/
	extern var Undo : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.abort: unknown
		```
	**/
	extern var abort : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.textOnlyTransactional: unknown
		```
	**/
	extern var textOnlyTransactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.transactional: unknown
		```
	**/
	extern var transactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.undo: unknown
		```
	**/
	extern var undo : Dynamic;
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
	extern var Changed : Dynamic;
	/**
		```lua
		(field) FileChangeType.Created: unknown
		```
	**/
	extern var Created : Dynamic;
	/**
		```lua
		(field) FileChangeType.Deleted: unknown
		```
	**/
	extern var Deleted : Dynamic;
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
	extern var unknownProtocolVersion : Dynamic;
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
	extern var PlainText : Dynamic;
	/**
		```lua
		(field) InsertTextFormat.Snippet: unknown
		```
	**/
	extern var Snippet : Dynamic;
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
	extern var Markdown : Dynamic;
	/**
		```lua
		(field) MarkupKind.PlainText: unknown
		```
	**/
	extern var PlainText : Dynamic;
	/**
		```lua
		(field) MarkupKind.markdown: unknown
		```
	**/
	extern var markdown : Dynamic;
	/**
		```lua
		(field) MarkupKind.plaintext: unknown
		```
	**/
	extern var plaintext : Dynamic;
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
	extern var Debug : Dynamic;
	/**
		```lua
		(field) MessageType.Error: unknown
		```
	**/
	extern var Error : Dynamic;
	/**
		```lua
		(field) MessageType.Info: unknown
		```
	**/
	extern var Info : Dynamic;
	/**
		```lua
		(field) MessageType.Log: unknown
		```
	**/
	extern var Log : Dynamic;
	/**
		```lua
		(field) MessageType.Warning: unknown
		```
	**/
	extern var Warning : Dynamic;
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
	extern var callHierarchy_incomingCalls : nvim.type.vim.lsp.protocol.Methods;
	extern var callHierarchy_outgoingCalls : nvim.type.vim.lsp.protocol.Methods;
	extern var client_registerCapability : nvim.type.vim.lsp.protocol.Methods;
	extern var client_unregisterCapability : nvim.type.vim.lsp.protocol.Methods;
	extern var codeAction_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern var codeLens_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern var completionItem_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern var documentLink_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern var dollar_cancelRequest : nvim.type.vim.lsp.protocol.Methods;
	extern var dollar_logTrace : nvim.type.vim.lsp.protocol.Methods;
	extern var dollar_progress : nvim.type.vim.lsp.protocol.Methods;
	extern var dollar_setTrace : nvim.type.vim.lsp.protocol.Methods;
	extern var exit : nvim.type.vim.lsp.protocol.Methods;
	extern var initialize : nvim.type.vim.lsp.protocol.Methods;
	extern var initialized : nvim.type.vim.lsp.protocol.Methods;
	extern var inlayHint_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern var notebookDocument_didChange : nvim.type.vim.lsp.protocol.Methods;
	extern var notebookDocument_didClose : nvim.type.vim.lsp.protocol.Methods;
	extern var notebookDocument_didOpen : nvim.type.vim.lsp.protocol.Methods;
	extern var notebookDocument_didSave : nvim.type.vim.lsp.protocol.Methods;
	extern var shutdown : nvim.type.vim.lsp.protocol.Methods;
	extern var telemetry_event : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_codeAction : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_codeLens : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_colorPresentation : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_completion : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_declaration : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_definition : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_diagnostic : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_didChange : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_didClose : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_didOpen : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_didSave : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_documentColor : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_documentHighlight : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_documentLink : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_documentSymbol : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_foldingRange : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_formatting : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_hover : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_implementation : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_inlayHint : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_inlineCompletion : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_inlineValue : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_linkedEditingRange : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_moniker : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_onTypeFormatting : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_prepareCallHierarchy : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_prepareRename : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_prepareTypeHierarchy : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_publishDiagnostics : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_rangeFormatting : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_rangesFormatting : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_references : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_rename : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_selectionRange : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_semanticTokens_full : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_semanticTokens_full_delta : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_semanticTokens_range : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_signatureHelp : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_typeDefinition : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_willSave : nvim.type.vim.lsp.protocol.Methods;
	extern var textDocument_willSaveWaitUntil : nvim.type.vim.lsp.protocol.Methods;
	extern var typeHierarchy_subtypes : nvim.type.vim.lsp.protocol.Methods;
	extern var typeHierarchy_supertypes : nvim.type.vim.lsp.protocol.Methods;
	extern var window_logMessage : nvim.type.vim.lsp.protocol.Methods;
	extern var window_showDocument : nvim.type.vim.lsp.protocol.Methods;
	extern var window_showMessage : nvim.type.vim.lsp.protocol.Methods;
	extern var window_showMessageRequest : nvim.type.vim.lsp.protocol.Methods;
	extern var window_workDoneProgress_cancel : nvim.type.vim.lsp.protocol.Methods;
	extern var window_workDoneProgress_create : nvim.type.vim.lsp.protocol.Methods;
	extern var workspaceSymbol_resolve : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_applyEdit : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_codeLens_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_configuration : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_diagnostic : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_diagnostic_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_didChangeConfiguration : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_didChangeWatchedFiles : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_didChangeWorkspaceFolders : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_didCreateFiles : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_didDeleteFiles : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_didRenameFiles : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_executeCommand : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_foldingRange_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_inlayHint_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_inlineValue_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_semanticTokens_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_symbol : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_textDocumentContent : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_textDocumentContent_refresh : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_willCreateFiles : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_willDeleteFiles : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_willRenameFiles : nvim.type.vim.lsp.protocol.Methods;
	extern var workspace_workspaceFolders : nvim.type.vim.lsp.protocol.Methods;
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
	extern var Create : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.Delete: unknown
		```
	**/
	extern var Delete : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.Rename: unknown
		```
	**/
	extern var Rename : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.create: unknown
		```
	**/
	extern var create : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.delete: unknown
		```
	**/
	extern var delete : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.rename: unknown
		```
	**/
	extern var rename : Dynamic;
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
	extern var Array : Dynamic;
	/**
		```lua
		(field) SymbolKind.Boolean: unknown
		```
	**/
	extern var Boolean : Dynamic;
	/**
		```lua
		(field) SymbolKind.Class: unknown
		```
	**/
	extern var Class : Dynamic;
	/**
		```lua
		(field) SymbolKind.Constant: unknown
		```
	**/
	extern var Constant : Dynamic;
	/**
		```lua
		(field) SymbolKind.Constructor: unknown
		```
	**/
	extern var Constructor : Dynamic;
	/**
		```lua
		(field) SymbolKind.Enum: unknown
		```
	**/
	extern var Enum : Dynamic;
	/**
		```lua
		(field) SymbolKind.EnumMember: unknown
		```
	**/
	extern var EnumMember : Dynamic;
	/**
		```lua
		(field) SymbolKind.Event: unknown
		```
	**/
	extern var Event : Dynamic;
	/**
		```lua
		(field) SymbolKind.Field: unknown
		```
	**/
	extern var Field : Dynamic;
	/**
		```lua
		(field) SymbolKind.File: unknown
		```
	**/
	extern var File : Dynamic;
	/**
		```lua
		(field) SymbolKind.Function: unknown
		```
	**/
	extern var Function : Dynamic;
	/**
		```lua
		(field) SymbolKind.Interface: unknown
		```
	**/
	extern var Interface : Dynamic;
	/**
		```lua
		(field) SymbolKind.Key: unknown
		```
	**/
	extern var Key : Dynamic;
	/**
		```lua
		(field) SymbolKind.Method: unknown
		```
	**/
	extern var Method : Dynamic;
	/**
		```lua
		(field) SymbolKind.Module: unknown
		```
	**/
	extern var Module : Dynamic;
	/**
		```lua
		(field) SymbolKind.Namespace: unknown
		```
	**/
	extern var Namespace : Dynamic;
	/**
		```lua
		(field) SymbolKind.Null: unknown
		```
	**/
	extern var Null : Dynamic;
	/**
		```lua
		(field) SymbolKind.Number: unknown
		```
	**/
	extern var Number : Dynamic;
	/**
		```lua
		(field) SymbolKind.Object: unknown
		```
	**/
	extern var Object : Dynamic;
	/**
		```lua
		(field) SymbolKind.Operator: unknown
		```
	**/
	extern var Operator : Dynamic;
	/**
		```lua
		(field) SymbolKind.Package: unknown
		```
	**/
	extern var Package : Dynamic;
	/**
		```lua
		(field) SymbolKind.Property: unknown
		```
	**/
	extern var Property : Dynamic;
	/**
		```lua
		(field) SymbolKind.String: unknown
		```
	**/
	extern var String : Dynamic;
	/**
		```lua
		(field) SymbolKind.Struct: unknown
		```
	**/
	extern var Struct : Dynamic;
	/**
		```lua
		(field) SymbolKind.TypeParameter: unknown
		```
	**/
	extern var TypeParameter : Dynamic;
	/**
		```lua
		(field) SymbolKind.Variable: unknown
		```
	**/
	extern var Variable : Dynamic;
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
	extern var AfterDelay : Dynamic;
	/**
		```lua
		(field) TextDocumentSaveReason.FocusOut: unknown
		```
	**/
	extern var FocusOut : Dynamic;
	/**
		```lua
		(field) TextDocumentSaveReason.Manual: unknown
		```
	**/
	extern var Manual : Dynamic;
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
	extern var Full : Dynamic;
	/**
		```lua
		(field) TextDocumentSyncKind.Incremental: unknown
		```
	**/
	extern var Incremental : Dynamic;
	/**
		```lua
		(field) TextDocumentSyncKind.None: unknown
		```
	**/
	extern var None : Dynamic;
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
	extern var Change : Dynamic;
	/**
		```lua
		(field) WatchKind.Create: unknown
		```
	**/
	extern var Create : Dynamic;
	/**
		```lua
		(field) WatchKind.Delete: unknown
		```
	**/
	extern var Delete : Dynamic;
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
		function vim.lsp.protocol.make_client_capabilities()
		  -> lsp.ClientCapabilities
		```
		
		---
		
		 Gets a new ClientCapabilities object describing the LSP client
		 capabilities.
	**/
	@:luaDotMethod
	extern function make_client_capabilities():nvim.type.lsp.ClientCapabilities;
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
	extern function resolve_capabilities(server_capabilities:lua.Table.AnyTable):Null<nvim.type.lsp.ServerCapabilities>;
}