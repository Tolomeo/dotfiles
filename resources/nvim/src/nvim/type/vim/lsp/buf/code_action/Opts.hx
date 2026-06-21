package nvim.type.vim.lsp.buf.code_action;

/**
	```lua
	(class) vim.lsp.buf.code_action.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.lsp.buf.code_action.Opts.apply: boolean?
		```
		
		---
		
		
		 When set to `true`, and there is just one remaining action
		 (after filtering), the action is applied without user query.
	**/
	@:optional
	extern var apply : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.code_action.Opts.context: (lsp.CodeActionContext)?
		```
		
		---
		
		Contains additional diagnostic information about the context in which
		a {@link CodeActionProvider.provideCodeActions code action} is run.
		
		---
		
		 @inlinedoc
		
		 Corresponds to `CodeActionContext` of the LSP specification:
		   - {diagnostics}? (`table`) LSP `Diagnostic[]`. Inferred from the current
		     position if not provided.
		   - {only}? (`table`) List of LSP `CodeActionKind`s used to filter the code actions.
		     Most language servers support values like `refactor`
		     or `quickfix`.
		   - {triggerKind}? (`integer`) The reason why code actions were requested.
	**/
	@:optional
	extern var context : Null<nvim.type.lsp.CodeActionContext>;
	/**
		```lua
		(field) vim.lsp.buf.code_action.Opts.filter: (fun(x: lsp.CodeAction|lsp.Command):boolean)?
		```
		
		---
		
		
		 Predicate taking an `CodeAction` and returning a boolean.
		
		---
		
		```lua
		function (x: lsp.CodeAction|lsp.Command)
		  -> boolean
		```
	**/
	@:optional
	extern var filter : Null<(x:haxe.extern.EitherType<nvim.type.lsp.CodeAction, nvim.type.lsp.Command>) -> Bool>;
	/**
		```lua
		(field) vim.lsp.buf.code_action.Opts.range: { start: integer[], end: integer[] }?
		```
		
		---
		
		
		 Range for which code actions should be requested.
		 If in visual mode this defaults to the active selection.
		 Table must contain `start` and `end` keys with {row,col} tuples
		 using mark-like indexing. See |api-indexing|
	**/
	@:optional
	extern var range : Null<{ var start : Array<Int>; var end : Array<Int>; }>;
}