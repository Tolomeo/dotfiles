package nvim.type.lsp;

/**
	```lua
	(class) lsp.CodeAction
	```
	
	---
	
	A code action represents a change that can be performed in code, e.g. to fix a problem or
	to refactor code.
	
	A CodeAction must set either `edit` and/or a `command`. If both are supplied, the `edit` is applied first, then the `command` is executed.
**/
@:structInit class CodeAction {
	/**
		```lua
		(field) lsp.CodeAction.command: (lsp.Command)?
		```
		
		---
		
		Represents a reference to a command. Provides a title which
		will be used to represent a command in the UI and, optionally,
		an array of arguments which will be passed to the command handler
		function when invoked.
		
		---
		
		
		A command this code action executes. If a code action
		provides an edit and a command, first the edit is
		executed and then the command.
	**/
	@:optional
	extern public var command : Null<nvim.type.lsp.Command>;
	/**
		```lua
		(field) lsp.CodeAction.data: (boolean|string|number|boolean|string|number|table<string, lsp.LSPAny>|table<string, lsp.LSPAny>[]|nil[]|table<string, lsp.LSPAny>|nil)?
		```
		
		---
		
		The LSP any type.
		Please note that strictly speaking a property with the value `undefined`
		can't be converted into JSON preserving the property name. However for
		convenience it is allowed and assumed that all these properties are
		optional as well.
		
		---
		
		
		A data entry field that is preserved on a code action between
		a `textDocument/codeAction` and a `codeAction/resolve` request.
		
		
		---
		
		LSP object definition.
		
		---
		
		LSP arrays.
	**/
	@:optional
	extern public var data : Null<nvim.type.lsp.LSPAny>;
	/**
		```lua
		(field) lsp.CodeAction.diagnostics: lsp.Diagnostic[]?
		```
		
		---
		
		
		The diagnostics that this code action resolves.
	**/
	@:optional
	extern public var diagnostics : Null<lua.Table<Int, nvim.type.lsp.Diagnostic>>;
	/**
		```lua
		(field) lsp.CodeAction.disabled: (lsp.CodeActionDisabled)?
		```
		
		---
		
		Captures why the code action is currently disabled.
		
		
		---
		
		
		Marks that the code action cannot currently be applied.
		
		Clients should follow the following guidelines regarding disabled code actions:
		
		  - Disabled code actions are not shown in automatic [lightbulbs](https://code.visualstudio.com/docs/editor/editingevolved#_code-action)
		    code action menus.
		
		  - Disabled actions are shown as faded out in the code action menu when the user requests a more specific type
		    of code action, such as refactorings.
		
		  - If the user has a [keybinding](https://code.visualstudio.com/docs/editor/refactoring#_keybindings-for-code-actions)
		    that auto applies a code action and only disabled code actions are returned, the client should show the user an
		    error message with `reason` in the editor.
		
	**/
	@:optional
	extern public var disabled : Null<nvim.type.lsp.CodeActionDisabled>;
	/**
		```lua
		(field) lsp.CodeAction.edit: (lsp.WorkspaceEdit)?
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
		
		---
		
		
		The workspace edit this code action performs.
	**/
	@:optional
	extern public var edit : Null<nvim.type.lsp.WorkspaceEdit>;
	/**
		```lua
		(field) lsp.CodeAction.isPreferred: boolean?
		```
		
		---
		
		
		Marks this as a preferred action. Preferred actions are used by the `auto fix` command and can be targeted
		by keybindings.
		
		A quick fix should be marked preferred if it properly addresses the underlying error.
		A refactoring should be marked preferred if it is the most reasonable choice of actions to take.
		
	**/
	@:optional
	extern public var isPreferred : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeAction.kind: (""|"notebook"|"quickfix"|"refactor"|"refactor.extract"|"refactor.inline"|"refactor.move"|"refactor.rewrite"|"source"|"source.fixAll"|"source.organizeImports")?
		```
		
		---
		
		A set of predefined code action kinds
		
		---
		
		
		The kind of the code action.
		
		Used to filter code actions.
		
		---
		
		```lua
		-- A set of predefined code action kinds
		lsp.CodeActionKind:
		    | "" -- Empty
		    | "quickfix" -- QuickFix
		    | "refactor" -- Refactor
		    | "refactor.extract" -- RefactorExtract
		    | "refactor.inline" -- RefactorInline
		    | "refactor.move" -- RefactorMove
		    | "refactor.rewrite" -- RefactorRewrite
		    | "source" -- Source
		    | "source.organizeImports" -- SourceOrganizeImports
		    | "source.fixAll" -- SourceFixAll
		    | "notebook" -- Notebook
		```
	**/
	@:optional
	extern public var kind : Null<nvim.type.lsp.CodeActionKind>;
	/**
		```lua
		(field) lsp.CodeAction.tags: 1[]?
		```
		
		---
		
		
		Tags for this code action.
		
	**/
	@:optional
	extern public var tags : Null<lua.Table<Int, nvim.type.lsp.CodeActionTag>>;
	/**
		```lua
		(field) lsp.CodeAction.title: string
		```
		
		---
		
		
		A short, human-readable, title for this code action.
	**/
	extern public var title : String;
}