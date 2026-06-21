package nvim.type.lsp;

/**
	```lua
	(class) lsp.TypeHierarchyOptions
	```
	
	---
	
	Type hierarchy options used during static registration.
	
**/
@:structInit class TypeHierarchyOptions {
	/**
		```lua
		(field) lsp.TypeHierarchyOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}