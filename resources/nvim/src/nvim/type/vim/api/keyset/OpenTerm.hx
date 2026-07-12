package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.open_term
	```
**/
@:structInit class OpenTerm {
	/**
		```lua
		(field) vim.api.keyset.open_term.force_crlf: boolean?
		```
	**/
	@:optional
	extern public var force_crlf : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.open_term.on_input: fun(_: "input", term: integer, bufnr: integer, data: any)?
		```
		
		---
		
		```lua
		function (_: "input", term: integer, bufnr: integer, data: any)
		```
	**/
	@:optional
	extern public var on_input : Null<(_:String, term:Int, bufnr:Int, data:Any) -> Dynamic>;
}