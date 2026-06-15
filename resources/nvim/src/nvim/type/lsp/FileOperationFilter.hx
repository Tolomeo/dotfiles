package nvim.type.lsp;

/**
	```lua
	(class) lsp.FileOperationFilter
	```
	
	---
	
	A filter to describe in which file operation requests or notifications
	the server is interested in receiving.
	
**/
@:structInit extern class FileOperationFilter {
	/**
		```lua
		(field) lsp.FileOperationFilter.pattern: lsp.FileOperationPattern
		```
		
		---
		
		A pattern to describe in which file operation requests or notifications
		the server is interested in receiving.
		
		
		---
		
		
		The actual file operation pattern.
	**/
	var pattern : nvim.type.lsp.FileOperationPattern;
	/**
		```lua
		(field) lsp.FileOperationFilter.scheme: string?
		```
		
		---
		
		
		A Uri scheme like `file` or `untitled`.
	**/
	var scheme : Null<String>;
}