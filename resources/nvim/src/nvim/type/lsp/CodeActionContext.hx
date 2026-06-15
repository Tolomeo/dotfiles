package nvim.type.lsp;

/**
	```lua
	(class) lsp.CodeActionContext
	```
	
	---
	
	Contains additional diagnostic information about the context in which
	a {@link CodeActionProvider.provideCodeActions code action} is run.
**/
@:structInit extern class CodeActionContext {
	/**
		```lua
		(field) lsp.CodeActionContext.diagnostics: lsp.Diagnostic[]
		```
		
		---
		
		
		An array of diagnostics known on the client side overlapping the range provided to the
		`textDocument/codeAction` request. They are provided so that the server knows which
		errors are currently presented to the user for the given range. There is no guarantee
		that these accurately reflect the error state of the resource. The primary parameter
		to compute code actions is the provided range.
	**/
	var diagnostics : Array<nvim.type.lsp.Diagnostic>;
	/**
		```lua
		(field) lsp.CodeActionContext.only: ""|"notebook"|"quickfix"|"refactor"|"refactor.extract"|"refactor.inline"|"refactor.move"|"refactor.rewrite"|"source"|"source.fixAll"|"source.organizeImports"[]?
		```
		
		---
		
		
		Requested kind of actions to return.
		
		Actions not of this kind are filtered out by the client before being shown. So servers
		can omit computing them.
	**/
	var only : Null<Array<nvim.type.lsp.CodeActionKind>>;
	/**
		```lua
		(field) lsp.CodeActionContext.triggerKind: (1|2)?
		```
		
		---
		
		The reason why code actions were requested.
		
		
		---
		
		
		The reason why code actions were requested.
		
		
		---
		
		```lua
		-- The reason why code actions were requested.
		-- 
		lsp.CodeActionTriggerKind:
		    | 1 -- Invoked
		    | 2 -- Automatic
		```
	**/
	var triggerKind : Null<nvim.type.lsp.CodeActionTriggerKind>;
}