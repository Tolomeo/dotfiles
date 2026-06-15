package nvim.type;

/**
	```lua
	(field) STTokenRangeInspect.modifiers: table<string, boolean>
	```
	
	---
	
	token modifiers as a set. E.g., { static = true, readonly = true }
**/
@:structInit extern class Modifiers {

}

/**
	```lua
	(class) STTokenRangeInspect
	```
	
	---
	
	 @nodoc
**/
@:structInit extern class STTokenRangeInspect {
	/**
		```lua
		(field) STTokenRangeInspect.client_id: integer
		```
	**/
	var client_id : Int;
	/**
		```lua
		(field) STTokenRangeInspect.end_col: integer
		```
		
		---
		
		end column 0-based
	**/
	var end_col : Int;
	/**
		```lua
		(field) STTokenRangeInspect.line: integer
		```
		
		---
		
		line number 0-based
	**/
	var line : Int;
	/**
		```lua
		(field) STTokenRangeInspect.marked: boolean
		```
		
		---
		
		whether this token has had extmarks applied
	**/
	var marked : Bool;
	/**
		```lua
		(field) STTokenRangeInspect.start_col: integer
		```
		
		---
		
		start column 0-based
	**/
	var start_col : Int;
	/**
		```lua
		(field) STTokenRangeInspect.type: string
		```
		
		---
		
		token type as string
	**/
	var type : String;
}