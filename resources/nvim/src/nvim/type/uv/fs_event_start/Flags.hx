package nvim.type.uv.fs_event_start;

/**
	```lua
	(class) uv.fs_event_start.flags
	```
**/
@:structInit class Flags {
	/**
		```lua
		(field) uv.fs_event_start.flags.recursive: boolean|nil
		```
		
		---
		
		default: false
	**/
	@:optional
	extern var recursive : Null<Bool>;
	/**
		```lua
		(field) uv.fs_event_start.flags.stat: boolean|nil
		```
		
		---
		
		default: false
	**/
	@:optional
	extern var stat : Null<Bool>;
	/**
		```lua
		(field) uv.fs_event_start.flags.watch_entry: boolean|nil
		```
		
		---
		
		default: false
	**/
	@:optional
	extern var watch_entry : Null<Bool>;
}