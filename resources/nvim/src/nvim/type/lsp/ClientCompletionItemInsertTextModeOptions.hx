package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCompletionItemInsertTextModeOptions
	```
**/
@:structInit class ClientCompletionItemInsertTextModeOptions {
	/**
		```lua
		(field) lsp.ClientCompletionItemInsertTextModeOptions.valueSet: 1|2[]
		```
	**/
	extern public var valueSet : lua.Table<Int, nvim.type.lsp.InsertTextMode>;
}