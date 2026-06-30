package nvim.type.lsp;

/**
	```lua
	(class) lsp.DeleteFile
	```
	
	---
	
	Delete file operation
**/
@:structInit class DeleteFile {
	/**
		```lua
		(field) lsp.DeleteFile.annotationId: string?
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
		(field) lsp.DeleteFile.kind: "delete"
		```
		
		---
		
		
		A delete
	**/
	extern public var kind : String;
	/**
		```lua
		(field) lsp.DeleteFile.options: (lsp.DeleteFileOptions)?
		```
		
		---
		
		Delete file options
		
		---
		
		
		Delete options.
	**/
	@:optional
	extern public var options : Null<nvim.type.lsp.DeleteFileOptions>;
	/**
		```lua
		(field) lsp.DeleteFile.uri: string
		```
		
		---
		
		
		The file to delete.
	**/
	extern public var uri : nvim.type.lsp.DocumentUri;
}