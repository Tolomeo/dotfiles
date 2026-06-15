package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.open_term
	```
**/
@:structInit extern class OpenTerm {
	/**
		```lua
		(field) vim.api.keyset.open_term.force_crlf: boolean?
		```
	**/
	var force_crlf : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.open_term.on_input: fun(_: "input", term: integer, bufnr: integer, data: any)?
		```
		
		---
		
		```lua
		function (_: "input", term: integer, bufnr: integer, data: any)
		```
	**/
	var on_input : Null<(_:String, term:Int, bufnr:Int, data:Any) -> Dynamic>;
}