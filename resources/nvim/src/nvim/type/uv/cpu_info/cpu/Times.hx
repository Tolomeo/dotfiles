package nvim.type.uv.cpu_info.cpu;

/**
	```lua
	(class) uv.cpu_info.cpu.times
	```
**/
@:structInit class Times {
	/**
		```lua
		(field) uv.cpu_info.cpu.times.idle: number
		```
	**/
	extern public var idle : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.irq: number
		```
	**/
	extern public var irq : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.nice: number
		```
	**/
	extern public var nice : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.sys: number
		```
	**/
	extern public var sys : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.user: number
		```
	**/
	extern public var user : Float;
}