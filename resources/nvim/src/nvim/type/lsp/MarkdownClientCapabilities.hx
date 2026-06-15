package nvim.type.lsp;

/**
	```lua
	(class) lsp.MarkdownClientCapabilities
	```
	
	---
	
	Client capabilities specific to the used markdown parser.
	
**/
@:structInit extern class MarkdownClientCapabilities {
	/**
		```lua
		(field) lsp.MarkdownClientCapabilities.allowedTags: string[]?
		```
		
		---
		
		
		A list of HTML tags that the client allows / supports in
		Markdown.
		
	**/
	var allowedTags : Null<Array<String>>;
	/**
		```lua
		(field) lsp.MarkdownClientCapabilities.parser: string
		```
		
		---
		
		
		The name of the parser.
	**/
	var parser : String;
	/**
		```lua
		(field) lsp.MarkdownClientCapabilities.version: string?
		```
		
		---
		
		
		The version of the parser.
	**/
	var version : Null<String>;
}