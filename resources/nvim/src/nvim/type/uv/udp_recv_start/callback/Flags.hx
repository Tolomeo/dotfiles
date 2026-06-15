package nvim.type.uv.udp_recv_start.callback;

/**
	```lua
	(class) uv.udp_recv_start.callback.flags
	```
**/
@:structInit extern class Flags {
	/**
		```lua
		(field) uv.udp_recv_start.callback.flags.mmsg_chunk: boolean|nil
		```
	**/
	var mmsg_chunk : Null<Bool>;
	/**
		```lua
		(field) uv.udp_recv_start.callback.flags.partial: boolean|nil
		```
	**/
	var partial : Null<Bool>;
}