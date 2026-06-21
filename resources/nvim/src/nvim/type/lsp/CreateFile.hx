package nvim.type.lsp;

/**
	```lua
	(class) lsp.CreateFile
	```
	
	---
	
	Create file operation.
**/
@:structInit class CreateFile {
	/**
		```lua
		(field) lsp.CreateFile.annotationId: string?
		```
		
		---
		
		An identifier to refer to a change annotation stored with a workspace edit.
		
		---
		
		
		An optional annotation identifier describing the operation.
		
	**/
	@:optional
	extern var annotationId : Null<nvim.type.lsp.ChangeAnnotationIdentifier>;
	/**
		```lua
		(field) lsp.CreateFile.kind: "create"
		```
		
		---
		
		
		A create
	**/
	extern var kind : String;
	/**
		```lua
		(field) lsp.CreateFile.options: (lsp.CreateFileOptions)?
		```
		
		---
		
		Options to create a file.
		
		---
		
		
		Additional options
	**/
	@:optional
	extern var options : Null<nvim.type.lsp.CreateFileOptions>;
	/**
		```lua
		(field) lsp.CreateFile.uri: string
		```
		
		---
		
		
		The resource to create.
	**/
	extern var uri : nvim.type.lsp.DocumentUri;
}