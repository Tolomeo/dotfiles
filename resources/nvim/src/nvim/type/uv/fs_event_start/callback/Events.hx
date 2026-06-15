package nvim.type.uv.fs_event_start.callback;

/**
	```lua
	(class) uv.fs_event_start.callback.events
	```
**/
@:structInit extern class Events {
	/**
		```lua
		(field) uv.fs_event_start.callback.events.change: boolean|nil
		```
	**/
	var change : Null<Bool>;
	/**
		```lua
		(field) uv.fs_event_start.callback.events.rename: boolean|nil
		```
	**/
	var rename : Null<Bool>;
}