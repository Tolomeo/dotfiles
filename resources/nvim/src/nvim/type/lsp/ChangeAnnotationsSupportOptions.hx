package nvim.type.lsp;

/**
	```lua
	(class) lsp.ChangeAnnotationsSupportOptions
	```
**/
@:structInit extern class ChangeAnnotationsSupportOptions {
	/**
		```lua
		(field) lsp.ChangeAnnotationsSupportOptions.groupsOnLabel: boolean?
		```
		
		---
		
		
		Whether the client groups edits with equal labels into tree nodes,
		for instance all edits labelled with "Changes in Strings" would
		be a tree node.
	**/
	var groupsOnLabel : Null<Bool>;
}