package nvim.type.lsp;

/**
	```lua
	(class) lsp.ChangeAnnotationsSupportOptions
	```
**/
@:structInit class ChangeAnnotationsSupportOptions {
	/**
		```lua
		(field) lsp.ChangeAnnotationsSupportOptions.groupsOnLabel: boolean?
		```
		
		---
		
		
		Whether the client groups edits with equal labels into tree nodes,
		for instance all edits labelled with "Changes in Strings" would
		be a tree node.
	**/
	@:optional
	extern var groupsOnLabel : Null<Bool>;
}