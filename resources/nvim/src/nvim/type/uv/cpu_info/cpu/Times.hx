package nvim.type.uv.cpu_info.cpu;

/**
	```lua
	(class) uv.cpu_info.cpu.times
	```
**/
@:structInit extern class Times {
	/**
		```lua
		(field) uv.cpu_info.cpu.times.idle: number
		```
	**/
	var idle : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.irq: number
		```
	**/
	var irq : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.nice: number
		```
	**/
	var nice : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.sys: number
		```
	**/
	var sys : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.user: number
		```
	**/
	var user : Float;
}