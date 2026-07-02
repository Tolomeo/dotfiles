package nvim.type;

/**
	```lua
	(field) STTokenRangeInspect.modifiers: table<string, boolean>
	```
	
	---
	
	token modifiers as a set. E.g., { static = true, readonly = true }
**/
@:structInit class Modifiers {

}

/**
	```lua
	(class) STTokenRangeInspect
	```
	
	---
	
	 @nodoc
**/
@:structInit class STTokenRangeInspect {
	/**
		```lua
		(field) STTokenRangeInspect.client_id: integer
		```
	**/
	extern public var client_id : Float;
	/**
		```lua
		(field) STTokenRangeInspect.end_col: integer
		```
		
		---
		
		end column 0-based
	**/
	extern public var end_col : Float;
	/**
		```lua
		(field) STTokenRangeInspect.line: integer
		```
		
		---
		
		line number 0-based
	**/
	extern public var line : Float;
	/**
		```lua
		(field) STTokenRangeInspect.marked: boolean
		```
		
		---
		
		whether this token has had extmarks applied
	**/
	extern public var marked : Bool;
	/**
		```lua
		(field) STTokenRangeInspect.modifiers: table<string, boolean>
		```
		
		---
		
		token modifiers as a set. E.g., { static = true, readonly = true }
	**/
	extern public var modifiers : Modifiers;
	/**
		```lua
		(field) STTokenRangeInspect.start_col: integer
		```
		
		---
		
		start column 0-based
	**/
	extern public var start_col : Float;
	/**
		```lua
		(field) STTokenRangeInspect.type: string
		```
		
		---
		
		token type as string
	**/
	extern public var type : String;
}