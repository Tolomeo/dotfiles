package nvim.type.lsp;

/**
	```lua
	(class) lsp.CallHierarchyOptions
	```
	
	---
	
	Call hierarchy options used during static registration.
	
**/
@:structInit class CallHierarchyOptions {
	/**
		```lua
		(field) lsp.CallHierarchyOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}