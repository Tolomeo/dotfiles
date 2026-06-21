package nvim.type.uv.fs_event_start.callback;

/**
	```lua
	(class) uv.fs_event_start.callback.events
	```
**/
@:structInit class Events {
	/**
		```lua
		(field) uv.fs_event_start.callback.events.change: boolean|nil
		```
	**/
	@:optional
	extern var change : Null<Bool>;
	/**
		```lua
		(field) uv.fs_event_start.callback.events.rename: boolean|nil
		```
	**/
	@:optional
	extern var rename : Null<Bool>;
}