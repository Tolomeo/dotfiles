package nvim.type.lsp;

/**
	```lua
	(class) lsp.CodeActionOptions
	```
	
	---
	
	Provider options for a {@link CodeActionRequest}.
**/
@:structInit class CodeActionOptions {
	/**
		```lua
		(field) lsp.CodeActionOptions.codeActionKinds: ""|"notebook"|"quickfix"|"refactor"|"refactor.extract"|"refactor.inline"|"refactor.move"|"refactor.rewrite"|"source"|"source.fixAll"|"source.organizeImports"[]?
		```
		
		---
		
		
		CodeActionKinds that this server may return.
		
		The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the server
		may list out every specific kind they provide.
	**/
	@:optional
	extern var codeActionKinds : Null<Array<nvim.type.lsp.CodeActionKind>>;
	/**
		```lua
		(field) lsp.CodeActionOptions.documentation: lsp.CodeActionKindDocumentation[]?
		```
		
		---
		
		
		Static documentation for a class of code actions.
		
		Documentation from the provider should be shown in the code actions menu if either:
		
		- Code actions of `kind` are requested by the editor. In this case, the editor will show the documentation that
		  most closely matches the requested code action kind. For example, if a provider has documentation for
		  both `Refactor` and `RefactorExtract`, when the user requests code actions for `RefactorExtract`,
		  the editor will use the documentation for `RefactorExtract` instead of the documentation for `Refactor`.
		
		- Any code actions of `kind` are returned by the provider.
		
		At most one documentation entry should be shown per provider.
		
	**/
	@:optional
	extern var documentation : Null<Array<nvim.type.lsp.CodeActionKindDocumentation>>;
	/**
		```lua
		(field) lsp.CodeActionOptions.resolveProvider: boolean?
		```
		
		---
		
		
		The server provides support to resolve additional
		information for a code action.
		
	**/
	@:optional
	extern var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeActionOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}