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
	extern var idrss : Int;
	/**
		```lua
		(field) uv.getrusage.result.inblock: integer
		```
		
		---
		
		block input operations
	**/
	extern var inblock : Int;
	/**
		```lua
		(field) uv.getrusage.result.isrss: integer
		```
		
		---
		
		integral unshared stack size
	**/
	extern var isrss : Int;
	/**
		```lua
		(field) uv.getrusage.result.ixrss: integer
		```
		
		---
		
		integral shared memory size
	**/
	extern var ixrss : Int;
	/**
		```lua
		(field) uv.getrusage.result.majflt: integer
		```
		
		---
		
		page faults (hard page faults)
	**/
	extern var majflt : Int;
	/**
		```lua
		(field) uv.getrusage.result.maxrss: integer
		```
		
		---
		
		maximum resident set size
	**/
	extern var maxrss : Int;
	/**
		```lua
		(field) uv.getrusage.result.minflt: integer
		```
		
		---
		
		page reclaims (soft page faults)
	**/
	extern var minflt : Int;
	/**
		```lua
		(field) uv.getrusage.result.msgrcv: integer
		```
		
		---
		
		IPC messages received
	**/
	extern var msgrcv : Int;
	/**
		```lua
		(field) uv.getrusage.result.msgsnd: integer
		```
		
		---
		
		IPC messages sent
	**/
	extern var msgsnd : Int;
	/**
		```lua
		(field) uv.getrusage.result.nivcsw: integer
		```
		
		---
		
		involuntary context switches
	**/
	extern var nivcsw : Int;
	/**
		```lua
		(field) uv.getrusage.result.nsignals: integer
		```
		
		---
		
		signals received
	**/
	extern var nsignals : Int;
	/**
		```lua
		(field) uv.getrusage.result.nswap: integer
		```
		
		---
		
		swaps
	**/
	extern var nswap : Int;
	/**
		```lua
		(field) uv.getrusage.result.nvcsw: integer
		```
		
		---
		
		voluntary context switches
	**/
	extern var nvcsw : Int;
	/**
		```lua
		(field) uv.getrusage.result.oublock: integer
		```
		
		---
		
		block output operations
	**/
	extern var oublock : Int;
	/**
		```lua
		(field) uv.getrusage.result.stime: uv.getrusage.result.time_t
		```
		
		---
		
		system CPU time used
	**/
	extern var stime : nvim.type.uv.getrusage.result.TimeT;
	/**
		```lua
		(field) uv.getrusage.result.utime: uv.getrusage.result.time_t
		```
		
		---
		
		user CPU time used
	**/
	extern var utime : nvim.type.uv.getrusage.result.TimeT;
}