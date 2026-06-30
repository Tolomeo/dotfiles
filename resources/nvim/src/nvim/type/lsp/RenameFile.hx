package nvim.type.lsp;

/**
	```lua
	(class) lsp.RenameFile
	```
	
	---
	
	Rename file operation
**/
@:structInit class RenameFile {
	/**
		```lua
		(field) lsp.RenameFile.annotationId: string?
		```
		
		---
		
		An identifier to refer to a change annotation stored with a workspace edit.
		
		---
		
		
		An optional annotation identifier describing the operation.
		
	**/
	@:optional
	extern public var annotationId : Null<nvim.type.lsp.ChangeAnnotationIdentifier>;
	/**
		```lua
		(field) lsp.RenameFile.kind: "rename"
		```
		
		---
		
		
		A rename
	**/
	extern public var kind : String;
	/**
		```lua
		(field) lsp.RenameFile.newUri: string
		```
		
		---
		
		
		The new location.
	**/
	extern public var newUri : nvim.type.lsp.DocumentUri;
	/**
		```lua
		(field) lsp.RenameFile.oldUri: string
		```
		
		---
		
		
		The old (existing) location.
	**/
	extern public var oldUri : nvim.type.lsp.DocumentUri;
	/**
		```lua
		(field) lsp.RenameFile.options: (lsp.RenameFileOptions)?
		```
		
		---
		
		Rename file options
		
		---
		
		
		Rename options.
	**/
	@:optional
	extern public var options : Null<nvim.type.lsp.RenameFileOptions>;
}