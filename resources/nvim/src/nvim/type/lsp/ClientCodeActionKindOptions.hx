package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCodeActionKindOptions
	```
**/
@:structInit class ClientCodeActionKindOptions {
	/**
		```lua
		(field) lsp.ClientCodeActionKindOptions.valueSet: ""|"notebook"|"quickfix"|"refactor"|"refactor.extract"|"refactor.inline"|"refactor.move"|"refactor.rewrite"|"source"|"source.fixAll"|"source.organizeImports"[]
		```
		
		---
		
		
		The code action kind values the client supports. When this
		property exists the client also guarantees that it will
		handle values outside its set gracefully and falls back
		to a default value when unknown.
	**/
	extern public var valueSet : lua.Table<Int, nvim.type.lsp.CodeActionKind>;
}