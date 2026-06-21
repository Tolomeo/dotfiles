package nvim.type.lsp;

/**
	```lua
	(class) lsp.FileOperationFilter
	```
	
	---
	
	A filter to describe in which file operation requests or notifications
	the server is interested in receiving.
	
**/
@:structInit class FileOperationFilter {
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
	extern var pattern : nvim.type.lsp.FileOperationPattern;
	/**
		```lua
		(field) lsp.FileOperationFilter.scheme: string?
		```
		
		---
		
		
		A Uri scheme like `file` or `untitled`.
	**/
	@:optional
	extern var scheme : Null<String>;
}