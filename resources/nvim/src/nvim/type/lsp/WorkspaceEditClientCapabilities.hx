package nvim.type.lsp;

/**
	```lua
	(class) lsp.WorkspaceEditClientCapabilities
	```
**/
@:structInit class WorkspaceEditClientCapabilities {
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.changeAnnotationSupport: (lsp.ChangeAnnotationsSupportOptions)?
		```
		
		---
		
		
		Whether the client in general supports change annotations on text edits,
		create file, rename file and delete file changes.
		
	**/
	@:optional
	extern var changeAnnotationSupport : Null<nvim.type.lsp.ChangeAnnotationsSupportOptions>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.documentChanges: boolean?
		```
		
		---
		
		
		The client supports versioned document changes in `WorkspaceEdit`s
	**/
	@:optional
	extern var documentChanges : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.failureHandling: ("abort"|"textOnlyTransactional"|"transactional"|"undo")?
		```
		
		---
		
		
		The failure handling strategy of a client if applying the workspace edit
		fails.
		
		
		---
		
		```lua
		lsp.FailureHandlingKind:
		    | "abort" -- Abort
		    | "transactional" -- Transactional
		    | "textOnlyTransactional" -- TextOnlyTransactional
		    | "undo" -- Undo
		```
	**/
	@:optional
	extern var failureHandling : Null<nvim.type.lsp.FailureHandlingKind>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.metadataSupport: boolean?
		```
		
		---
		
		
		Whether the client supports `WorkspaceEditMetadata` in `WorkspaceEdit`s.
		
	**/
	@:optional
	extern var metadataSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.normalizesLineEndings: boolean?
		```
		
		---
		
		
		Whether the client normalizes line endings to the client specific
		setting.
		If set to `true` the client will normalize line ending characters
		in a workspace edit to the client-specified new line
		character.
		
	**/
	@:optional
	extern var normalizesLineEndings : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.resourceOperations: "create"|"delete"|"rename"[]?
		```
		
		---
		
		
		The resource operations the client supports. Clients should at least
		support 'create', 'rename' and 'delete' files and folders.
		
	**/
	@:optional
	extern var resourceOperations : Null<Array<nvim.type.lsp.ResourceOperationKind>>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.snippetEditSupport: boolean?
		```
		
		---
		
		
		Whether the client supports snippets as text edits.
		
	**/
	@:optional
	extern var snippetEditSupport : Null<Bool>;
}