package nvim.type.lsp;

/**
	```lua
	(class) lsp.WorkspaceEdit
	```
	
	---
	
	A workspace edit represents changes to many resources managed in the workspace. The edit
	should either provide `changes` or `documentChanges`. If documentChanges are present
	they are preferred over `changes` if the client can handle versioned document edits.
	
	Since version 3.13.0 a workspace edit can contain resource operations as well. If resource
	operations are present clients need to execute the operations in the order in which they
	are provided. So a workspace edit for example can consist of the following two changes:
	(1) a create file a.txt and (2) a text document edit which insert text into file a.txt.
	
	An invalid sequence (e.g. (1) delete file a.txt and (2) insert text into file a.txt) will
	cause failure of the operation. How the client recovers from the failure is described by
	the client capability: `workspace.workspaceEdit.failureHandling`
**/
@:structInit class WorkspaceEdit {
	/**
		```lua
		(field) lsp.WorkspaceEdit.changeAnnotations: table<string, lsp.ChangeAnnotation>?
		```
		
		---
		
		
		A map of change annotations that can be referenced in `AnnotatedTextEdit`s or create, rename and
		delete file / folder operations.
		
		Whether clients honor this property depends on the client capability `workspace.changeAnnotationSupport`.
		
	**/
	@:optional
	extern public var changeAnnotations : Null<lua.Table<nvim.type.lsp.ChangeAnnotationIdentifier, nvim.type.lsp.ChangeAnnotation>>;
	/**
		```lua
		(field) lsp.WorkspaceEdit.changes: table<string, lsp.TextEdit[]>?
		```
		
		---
		
		
		Holds changes to existing resources.
	**/
	@:optional
	extern public var changes : Null<lua.Table<nvim.type.lsp.DocumentUri, lua.Table<Int, nvim.type.lsp.TextEdit>>>;
	/**
		```lua
		(field) lsp.WorkspaceEdit.documentChanges: (lsp.CreateFile|lsp.DeleteFile|lsp.RenameFile|lsp.TextDocumentEdit)[]?
		```
		
		---
		
		
		Depending on the client capability `workspace.workspaceEdit.resourceOperations` document changes
		are either an array of `TextDocumentEdit`s to express changes to n different text documents
		where each text document edit addresses a specific version of a text document. Or it can contain
		above `TextDocumentEdit`s mixed with create, rename and delete file / folder operations.
		
		Whether a client supports versioned document edits is expressed via
		`workspace.workspaceEdit.documentChanges` client capability.
		
		If a client neither supports `documentChanges` nor `workspace.workspaceEdit.resourceOperations` then
		only plain `TextEdit`s using the `changes` property are supported.
	**/
	@:optional
	extern public var documentChanges : Null<lua.Table<Int, haxe.extern.EitherType<nvim.type.lsp.TextDocumentEdit, haxe.extern.EitherType<nvim.type.lsp.CreateFile, haxe.extern.EitherType<nvim.type.lsp.RenameFile, nvim.type.lsp.DeleteFile>>>>>;
}