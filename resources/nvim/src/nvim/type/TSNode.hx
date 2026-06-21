package nvim.type;

/**
	```lua
	(class) TSNode
	```
**/
@:structInit class TSNode {
	/**
		```lua
		(method) TSNode:__has_ancestor(node_types: string[])
		  -> boolean
		```
		
		---
		
		 Check if the node has any of the given node types as its ancestor.
	**/
	extern function __has_ancestor(node_types:Array<String>):Bool;
	/**
		```lua
		(method) TSNode:byte_length()
		  -> integer
		```
		
		---
		
		 Return the number of bytes spanned by this node.
	**/
	extern function byte_length():Int;
	/**
		```lua
		(method) TSNode:child(index: integer)
		  -> TSNode?
		```
		
		---
		
		 Get the node's child at the given {index}, where zero represents the first
		 child.
	**/
	extern function child(index:Int):Null<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:child_count()
		  -> integer
		```
		
		---
		
		 Get the node's number of children.
	**/
	extern function child_count():Int;
	/**
		```lua
		(method) TSNode:child_with_descendant(descendant: TSNode)
		  -> TSNode?
		```
		
		---
		
		 Get the node's child that contains {descendant} (includes {descendant}).
		
		 For example, with the following node hierarchy:
		
		 ```
		 a -> b -> c
		
		 a:child_with_descendant(c) == b
		 a:child_with_descendant(b) == b
		 a:child_with_descendant(a) == nil
		 ```
	**/
	extern function child_with_descendant(descendant:nvim.type.TSNode):Null<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:descendant_for_range(start_row: integer, start_col: integer, end_row: integer, end_col: integer)
		  -> TSNode?
		```
		
		---
		
		 Get the smallest node within this node that spans the given range of (row,
		 column) positions
	**/
	extern function descendant_for_range(start_row:Int, start_col:Int, end_row:Int, end_col:Int):Null<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:end_()
		  -> integer
		  2. integer
		  3. integer
		```
		
		---
		
		 Get the node's end position. Return three values: the row, column and
		 total byte count (all zero-based).
	**/
	extern function end_():Int;
	/**
		```lua
		(method) TSNode:equal(node: TSNode)
		  -> boolean
		```
		
		---
		
		 Check if {node} refers to the same node within the same tree.
	**/
	extern function equal(node:nvim.type.TSNode):Bool;
	/**
		```lua
		(method) TSNode:extra()
		  -> boolean
		```
		
		---
		
		 Check if the node is extra. Extra nodes represent things like comments,
		 which are not required by the grammar but can appear anywhere.
	**/
	extern function extra():Bool;
	/**
		```lua
		(method) TSNode:field(name: string)
		  -> TSNode[]
		```
		
		---
		
		 Returns a list of all the node's children that have the given field name.
	**/
	extern function field(name:String):Array<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:has_changes()
		  -> boolean
		```
		
		---
		
		 Check if a syntax node has been edited.
	**/
	extern function has_changes():Bool;
	/**
		```lua
		(method) TSNode:has_error()
		  -> boolean
		```
		
		---
		
		 Check if the node is a syntax error or contains any syntax errors.
	**/
	extern function has_error():Bool;
	/**
		```lua
		(method) TSNode:id()
		  -> string
		```
		
		---
		
		 Get a unique identifier for the node inside its own tree.
		
		 No guarantees are made about this identifier's internal representation,
		 except for being a primitive Lua type with value equality (so not a
		 table). Presently it is a (non-printable) string.
		
		 Note: The `id` is not guaranteed to be unique for nodes from different
		 trees.
	**/
	extern function id():String;
	/**
		```lua
		(method) TSNode:iter_children()
		  -> fun():TSNode, string
		```
		
		---
		
		 Iterates over all the direct children of {TSNode}, regardless of whether
		 they are named or not.
		 Returns the child node plus the eventual field name corresponding to this
		 child node.
	**/
	extern function iter_children():() -> nvim.helper.Multireturn<nvim.type.TSNode, String, Void, Void, Void, Void>;
	/**
		```lua
		(method) TSNode:missing()
		  -> boolean
		```
		
		---
		
		 Check if the node is missing. Missing nodes are inserted by the parser in
		 order to recover from certain kinds of syntax errors.
	**/
	extern function missing():Bool;
	/**
		```lua
		(method) TSNode:named()
		  -> boolean
		```
		
		---
		
		 Check if the node is named. Named nodes correspond to named rules in the
		 grammar, whereas anonymous nodes correspond to string literals in the
		 grammar.
	**/
	extern function named():Bool;
	/**
		```lua
		(method) TSNode:named_child(index: integer)
		  -> TSNode?
		```
		
		---
		
		 Get the node's named child at the given {index}, where zero represents the
		 first named child.
	**/
	extern function named_child(index:Int):Null<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:named_child_count()
		  -> integer
		```
		
		---
		
		 Get the node's number of named children.
	**/
	extern function named_child_count():Int;
	/**
		```lua
		(method) TSNode:named_children()
		  -> TSNode[]
		```
		
		---
		
		 Returns a list of the node's named children.
	**/
	extern function named_children():Array<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:named_descendant_for_range(start_row: integer, start_col: integer, end_row: integer, end_col: integer)
		  -> TSNode?
		```
		
		---
		
		 Get the smallest named node within this node that spans the given range of
		 (row, column) positions
	**/
	extern function named_descendant_for_range(start_row:Int, start_col:Int, end_row:Int, end_col:Int):Null<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:next_named_sibling()
		  -> TSNode?
		```
		
		---
		
		 Get the node's next named sibling.
	**/
	extern function next_named_sibling():Null<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:next_sibling()
		  -> TSNode?
		```
		
		---
		
		 Get the node's next sibling.
	**/
	extern function next_sibling():Null<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:parent()
		  -> TSNode?
		```
		
		---
		
		 Get the node's immediate parent.
		 Prefer |TSNode:child_with_descendant()|
		 for iterating over the node's ancestors.
	**/
	extern function parent():Null<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:prev_named_sibling()
		  -> TSNode?
		```
		
		---
		
		 Get the node's previous named sibling.
	**/
	extern function prev_named_sibling():Null<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:prev_sibling()
		  -> TSNode?
		```
		
		---
		
		 Get the node's previous sibling.
	**/
	extern function prev_sibling():Null<nvim.type.TSNode>;
	/**
		```lua
		(method) TSNode:range(include_bytes?: false)
		  -> integer
		  2. integer
		  3. integer
		  4. integer
		```
		
		---
		
		 Get the range of the node.
		
		 Return four or six values:
		
		 - start row
		 - start column
		 - start byte (if {include_bytes} is `true`)
		 - end row
		 - end column
		 - end byte (if {include_bytes} is `true`)
		
		---
		
		```lua
		include_bytes:
		    | false
		```
		
		---
		
		```lua
		(method) TSNode:range(include_bytes: true)
		  -> integer
		  2. integer
		  3. integer
		  4. integer
		  5. integer
		  6. integer
		```
	**/
	@:overload(function (include_bytes:Bool) : nvim.helper.Multireturn<Int, Int, Int, Int, Int, Int> {})
	extern function range(?include_bytes:Null<Bool>):Int;
	/**
		```lua
		(method) TSNode:sexpr()
		  -> string
		```
		
		---
		
		 Get an S-expression representing the node as a string.
	**/
	extern function sexpr():String;
	/**
		```lua
		(method) TSNode:start()
		  -> integer
		  2. integer
		  3. integer
		```
		
		---
		
		 Get the node's start position. Return three values: the row, column and
		 total byte count (all zero-based).
	**/
	extern function start():Int;
	/**
		```lua
		(method) TSNode:symbol()
		  -> integer
		```
		
		---
		
		 Get the node's type as a numerical id.
	**/
	extern function symbol():Int;
	/**
		```lua
		(method) TSNode:tree()
		  -> TSTree
		```
		
		---
		
		 Get the |TSTree| of the node.
	**/
	extern function tree():nvim.type.TSTree;
	/**
		```lua
		(method) TSNode:type()
		  -> string
		```
		
		---
		
		 Get the node's type as a string.
	**/
	extern function type():String;
}