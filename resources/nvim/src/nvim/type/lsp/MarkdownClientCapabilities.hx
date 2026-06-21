package nvim.type.lsp;

/**
	```lua
	(class) lsp.MarkdownClientCapabilities
	```
	
	---
	
	Client capabilities specific to the used markdown parser.
	
**/
@:structInit class MarkdownClientCapabilities {
	/**
		```lua
		(field) lsp.MarkdownClientCapabilities.allowedTags: string[]?
		```
		
		---
		
		
		A list of HTML tags that the client allows / supports in
		Markdown.
		
	**/
	@:optional
	extern var allowedTags : Null<Array<String>>;
	/**
		```lua
		(field) lsp.MarkdownClientCapabilities.parser: string
		```
		
		---
		
		
		The name of the parser.
	**/
	extern var parser : String;
	/**
		```lua
		(field) lsp.MarkdownClientCapabilities.version: string?
		```
		
		---
		
		
		The version of the parser.
	**/
	@:optional
	extern var version : Null<String>;
}