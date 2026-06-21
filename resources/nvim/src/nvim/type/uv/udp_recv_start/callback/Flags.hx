package nvim.type.uv.udp_recv_start.callback;

/**
	```lua
	(class) uv.udp_recv_start.callback.flags
	```
**/
@:structInit class Flags {
	/**
		```lua
		(field) uv.udp_recv_start.callback.flags.mmsg_chunk: boolean|nil
		```
	**/
	@:optional
	extern var mmsg_chunk : Null<Bool>;
	/**
		```lua
		(field) uv.udp_recv_start.callback.flags.partial: boolean|nil
		```
	**/
	@:optional
	extern var partial : Null<Bool>;
}