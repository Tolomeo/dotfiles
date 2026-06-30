package nvim.type.uv.getrusage;

/**
	```lua
	(class) uv.getrusage.result
	```
**/
@:structInit class Result {
	/**
		```lua
		(field) uv.getrusage.result.idrss: integer
		```
		
		---
		
		integral unshared data size
	**/
	extern public var idrss : Float;
	/**
		```lua
		(field) uv.getrusage.result.inblock: integer
		```
		
		---
		
		block input operations
	**/
	extern public var inblock : Float;
	/**
		```lua
		(field) uv.getrusage.result.isrss: integer
		```
		
		---
		
		integral unshared stack size
	**/
	extern public var isrss : Float;
	/**
		```lua
		(field) uv.getrusage.result.ixrss: integer
		```
		
		---
		
		integral shared memory size
	**/
	extern public var ixrss : Float;
	/**
		```lua
		(field) uv.getrusage.result.majflt: integer
		```
		
		---
		
		page faults (hard page faults)
	**/
	extern public var majflt : Float;
	/**
		```lua
		(field) uv.getrusage.result.maxrss: integer
		```
		
		---
		
		maximum resident set size
	**/
	extern public var maxrss : Float;
	/**
		```lua
		(field) uv.getrusage.result.minflt: integer
		```
		
		---
		
		page reclaims (soft page faults)
	**/
	extern public var minflt : Float;
	/**
		```lua
		(field) uv.getrusage.result.msgrcv: integer
		```
		
		---
		
		IPC messages received
	**/
	extern public var msgrcv : Float;
	/**
		```lua
		(field) uv.getrusage.result.msgsnd: integer
		```
		
		---
		
		IPC messages sent
	**/
	extern public var msgsnd : Float;
	/**
		```lua
		(field) uv.getrusage.result.nivcsw: integer
		```
		
		---
		
		involuntary context switches
	**/
	extern public var nivcsw : Float;
	/**
		```lua
		(field) uv.getrusage.result.nsignals: integer
		```
		
		---
		
		signals received
	**/
	extern public var nsignals : Float;
	/**
		```lua
		(field) uv.getrusage.result.nswap: integer
		```
		
		---
		
		swaps
	**/
	extern public var nswap : Float;
	/**
		```lua
		(field) uv.getrusage.result.nvcsw: integer
		```
		
		---
		
		voluntary context switches
	**/
	extern public var nvcsw : Float;
	/**
		```lua
		(field) uv.getrusage.result.oublock: integer
		```
		
		---
		
		block output operations
	**/
	extern public var oublock : Float;
	/**
		```lua
		(field) uv.getrusage.result.stime: uv.getrusage.result.time_t
		```
		
		---
		
		system CPU time used
	**/
	extern public var stime : nvim.type.uv.getrusage.result.TimeT;
	/**
		```lua
		(field) uv.getrusage.result.utime: uv.getrusage.result.time_t
		```
		
		---
		
		user CPU time used
	**/
	extern public var utime : nvim.type.uv.getrusage.result.TimeT;
}