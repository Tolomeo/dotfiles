package nvim.type.uv;

/**
	```lua
	(class) uv.errno
	```
	
	---
	
	 A table value which exposes error constants as a map, where the key is the error name (without the UV_ prefix) and its value is a negative number.
	
**/
@:structInit class Errno {
	/**
		```lua
		(field) uv.errno.E2BIG: integer
		```
		
		---
		
		argument list too long.
	**/
	extern public var E2BIG : Int;
	/**
		```lua
		(field) uv.errno.EACCES: integer
		```
		
		---
		
		permission denied.
	**/
	extern public var EACCES : Int;
	/**
		```lua
		(field) uv.errno.EADDRINUSE: integer
		```
		
		---
		
		address already in use.
	**/
	extern public var EADDRINUSE : Int;
	/**
		```lua
		(field) uv.errno.EADDRNOTAVAIL: integer
		```
		
		---
		
		address not available.
	**/
	extern public var EADDRNOTAVAIL : Int;
	/**
		```lua
		(field) uv.errno.EAFNOSUPPORT: integer
		```
		
		---
		
		address family not supported.
	**/
	extern public var EAFNOSUPPORT : Int;
	/**
		```lua
		(field) uv.errno.EAGAIN: integer
		```
		
		---
		
		resource temporarily unavailable.
	**/
	extern public var EAGAIN : Int;
	/**
		```lua
		(field) uv.errno.EAI_ADDRFAMILY: integer
		```
		
		---
		
		address family not supported.
	**/
	extern public var EAI_ADDRFAMILY : Int;
	/**
		```lua
		(field) uv.errno.EAI_AGAIN: integer
		```
		
		---
		
		temporary failure.
	**/
	extern public var EAI_AGAIN : Int;
	/**
		```lua
		(field) uv.errno.EAI_BADFLAGS: integer
		```
		
		---
		
		bad ai_flags value.
	**/
	extern public var EAI_BADFLAGS : Int;
	/**
		```lua
		(field) uv.errno.EAI_BADHINTS: integer
		```
		
		---
		
		invalid value for hints.
	**/
	extern public var EAI_BADHINTS : Int;
	/**
		```lua
		(field) uv.errno.EAI_CANCELED: integer
		```
		
		---
		
		request canceled.
	**/
	extern public var EAI_CANCELED : Int;
	/**
		```lua
		(field) uv.errno.EAI_FAIL: integer
		```
		
		---
		
		permanent failure.
	**/
	extern public var EAI_FAIL : Int;
	/**
		```lua
		(field) uv.errno.EAI_FAMILY: integer
		```
		
		---
		
		ai_family not supported.
	**/
	extern public var EAI_FAMILY : Int;
	/**
		```lua
		(field) uv.errno.EAI_MEMORY: integer
		```
		
		---
		
		out of memory.
	**/
	extern public var EAI_MEMORY : Int;
	/**
		```lua
		(field) uv.errno.EAI_NODATA: integer
		```
		
		---
		
		no address.
	**/
	extern public var EAI_NODATA : Int;
	/**
		```lua
		(field) uv.errno.EAI_NONAME: integer
		```
		
		---
		
		unknown node or service.
	**/
	extern public var EAI_NONAME : Int;
	/**
		```lua
		(field) uv.errno.EAI_OVERFLOW: integer
		```
		
		---
		
		argument buffer overflow.
	**/
	extern public var EAI_OVERFLOW : Int;
	/**
		```lua
		(field) uv.errno.EAI_PROTOCOL: integer
		```
		
		---
		
		resolved protocol is unknown.
	**/
	extern public var EAI_PROTOCOL : Int;
	/**
		```lua
		(field) uv.errno.EAI_SERVICE: integer
		```
		
		---
		
		service not available for socket type.
	**/
	extern public var EAI_SERVICE : Int;
	/**
		```lua
		(field) uv.errno.EAI_SOCKTYPE: integer
		```
		
		---
		
		socket type not supported.
	**/
	extern public var EAI_SOCKTYPE : Int;
	/**
		```lua
		(field) uv.errno.EALREADY: integer
		```
		
		---
		
		connection already in progress.
	**/
	extern public var EALREADY : Int;
	/**
		```lua
		(field) uv.errno.EBADF: integer
		```
		
		---
		
		bad file descriptor.
	**/
	extern public var EBADF : Int;
	/**
		```lua
		(field) uv.errno.EBUSY: integer
		```
		
		---
		
		resource busy or locked.
	**/
	extern public var EBUSY : Int;
	/**
		```lua
		(field) uv.errno.ECANCELED: integer
		```
		
		---
		
		operation canceled.
	**/
	extern public var ECANCELED : Int;
	/**
		```lua
		(field) uv.errno.ECHARSET: integer
		```
		
		---
		
		invalid Unicode character.
	**/
	extern public var ECHARSET : Int;
	/**
		```lua
		(field) uv.errno.ECONNABORTED: integer
		```
		
		---
		
		software caused connection abort.
	**/
	extern public var ECONNABORTED : Int;
	/**
		```lua
		(field) uv.errno.ECONNREFUSED: integer
		```
		
		---
		
		connection refused.
	**/
	extern public var ECONNREFUSED : Int;
	/**
		```lua
		(field) uv.errno.ECONNRESET: integer
		```
		
		---
		
		connection reset by peer.
	**/
	extern public var ECONNRESET : Int;
	/**
		```lua
		(field) uv.errno.EDESTADDRREQ: integer
		```
		
		---
		
		destination address required.
	**/
	extern public var EDESTADDRREQ : Int;
	/**
		```lua
		(field) uv.errno.EEXIST: integer
		```
		
		---
		
		file already exists.
	**/
	extern public var EEXIST : Int;
	/**
		```lua
		(field) uv.errno.EFAULT: integer
		```
		
		---
		
		bad address in system call argument.
	**/
	extern public var EFAULT : Int;
	/**
		```lua
		(field) uv.errno.EFBIG: integer
		```
		
		---
		
		file too large.
	**/
	extern public var EFBIG : Int;
	/**
		```lua
		(field) uv.errno.EFTYPE: integer
		```
		
		---
		
		inappropriate file type or format.
	**/
	extern public var EFTYPE : Int;
	/**
		```lua
		(field) uv.errno.EHOSTUNREACH: integer
		```
		
		---
		
		host is unreachable.
	**/
	extern public var EHOSTUNREACH : Int;
	/**
		```lua
		(field) uv.errno.EILSEQ: integer
		```
		
		---
		
		illegal byte sequence.
	**/
	extern public var EILSEQ : Int;
	/**
		```lua
		(field) uv.errno.EINTR: integer
		```
		
		---
		
		interrupted system call.
	**/
	extern public var EINTR : Int;
	/**
		```lua
		(field) uv.errno.EINVAL: integer
		```
		
		---
		
		invalid argument.
	**/
	extern public var EINVAL : Int;
	/**
		```lua
		(field) uv.errno.EIO: integer
		```
		
		---
		
		i/o error.
	**/
	extern public var EIO : Int;
	/**
		```lua
		(field) uv.errno.EISCONN: integer
		```
		
		---
		
		socket is already connected.
	**/
	extern public var EISCONN : Int;
	/**
		```lua
		(field) uv.errno.EISDIR: integer
		```
		
		---
		
		illegal operation on a directory.
	**/
	extern public var EISDIR : Int;
	/**
		```lua
		(field) uv.errno.ELOOP: integer
		```
		
		---
		
		too many symbolic links encountered.
	**/
	extern public var ELOOP : Int;
	/**
		```lua
		(field) uv.errno.EMFILE: integer
		```
		
		---
		
		too many open files.
	**/
	extern public var EMFILE : Int;
	/**
		```lua
		(field) uv.errno.EMLINK: integer
		```
		
		---
		
		too many links.
	**/
	extern public var EMLINK : Int;
	/**
		```lua
		(field) uv.errno.EMSGSIZE: integer
		```
		
		---
		
		message too long.
	**/
	extern public var EMSGSIZE : Int;
	/**
		```lua
		(field) uv.errno.ENAMETOOLONG: integer
		```
		
		---
		
		name too long.
	**/
	extern public var ENAMETOOLONG : Int;
	/**
		```lua
		(field) uv.errno.ENETDOWN: integer
		```
		
		---
		
		network is down.
	**/
	extern public var ENETDOWN : Int;
	/**
		```lua
		(field) uv.errno.ENETUNREACH: integer
		```
		
		---
		
		network is unreachable.
	**/
	extern public var ENETUNREACH : Int;
	/**
		```lua
		(field) uv.errno.ENFILE: integer
		```
		
		---
		
		file table overflow.
	**/
	extern public var ENFILE : Int;
	/**
		```lua
		(field) uv.errno.ENOBUFS: integer
		```
		
		---
		
		no buffer space available.
	**/
	extern public var ENOBUFS : Int;
	/**
		```lua
		(field) uv.errno.ENODEV: integer
		```
		
		---
		
		no such device.
	**/
	extern public var ENODEV : Int;
	/**
		```lua
		(field) uv.errno.ENOENT: integer
		```
		
		---
		
		no such file or directory.
	**/
	extern public var ENOENT : Int;
	/**
		```lua
		(field) uv.errno.ENOMEM: integer
		```
		
		---
		
		not enough memory.
	**/
	extern public var ENOMEM : Int;
	/**
		```lua
		(field) uv.errno.ENONET: integer
		```
		
		---
		
		machine is not on the network.
	**/
	extern public var ENONET : Int;
	/**
		```lua
		(field) uv.errno.ENOPROTOOPT: integer
		```
		
		---
		
		protocol not available.
	**/
	extern public var ENOPROTOOPT : Int;
	/**
		```lua
		(field) uv.errno.ENOSPC: integer
		```
		
		---
		
		no space left on device.
	**/
	extern public var ENOSPC : Int;
	/**
		```lua
		(field) uv.errno.ENOSYS: integer
		```
		
		---
		
		function not implemented.
	**/
	extern public var ENOSYS : Int;
	/**
		```lua
		(field) uv.errno.ENOTCONN: integer
		```
		
		---
		
		socket is not connected.
	**/
	extern public var ENOTCONN : Int;
	/**
		```lua
		(field) uv.errno.ENOTDIR: integer
		```
		
		---
		
		not a directory.
	**/
	extern public var ENOTDIR : Int;
	/**
		```lua
		(field) uv.errno.ENOTEMPTY: integer
		```
		
		---
		
		directory not empty.
	**/
	extern public var ENOTEMPTY : Int;
	/**
		```lua
		(field) uv.errno.ENOTSOCK: integer
		```
		
		---
		
		socket operation on non-socket.
	**/
	extern public var ENOTSOCK : Int;
	/**
		```lua
		(field) uv.errno.ENOTSUP: integer
		```
		
		---
		
		operation not supported on socket.
	**/
	extern public var ENOTSUP : Int;
	/**
		```lua
		(field) uv.errno.ENOTTY: integer
		```
		
		---
		
		inappropriate ioctl for device.
	**/
	extern public var ENOTTY : Int;
	/**
		```lua
		(field) uv.errno.ENXIO: integer
		```
		
		---
		
		no such device or address.
	**/
	extern public var ENXIO : Int;
	/**
		```lua
		(field) uv.errno.EOF: integer
		```
		
		---
		
		end of file.
	**/
	extern public var EOF : Int;
	/**
		```lua
		(field) uv.errno.EOVERFLOW: integer
		```
		
		---
		
		value too large for defined data type.
	**/
	extern public var EOVERFLOW : Int;
	/**
		```lua
		(field) uv.errno.EPERM: integer
		```
		
		---
		
		operation not permitted.
	**/
	extern public var EPERM : Int;
	/**
		```lua
		(field) uv.errno.EPIPE: integer
		```
		
		---
		
		broken pipe.
	**/
	extern public var EPIPE : Int;
	/**
		```lua
		(field) uv.errno.EPROTO: integer
		```
		
		---
		
		protocol error.
	**/
	extern public var EPROTO : Int;
	/**
		```lua
		(field) uv.errno.EPROTONOSUPPORT: integer
		```
		
		---
		
		protocol not supported.
	**/
	extern public var EPROTONOSUPPORT : Int;
	/**
		```lua
		(field) uv.errno.EPROTOTYPE: integer
		```
		
		---
		
		protocol wrong type for socket.
	**/
	extern public var EPROTOTYPE : Int;
	/**
		```lua
		(field) uv.errno.ERANGE: integer
		```
		
		---
		
		result too large.
	**/
	extern public var ERANGE : Int;
	/**
		```lua
		(field) uv.errno.EROFS: integer
		```
		
		---
		
		read-only file system.
	**/
	extern public var EROFS : Int;
	/**
		```lua
		(field) uv.errno.ESHUTDOWN: integer
		```
		
		---
		
		cannot send after transport endpoint shutdown.
	**/
	extern public var ESHUTDOWN : Int;
	/**
		```lua
		(field) uv.errno.ESOCKTNOSUPPORT: integer
		```
		
		---
		
		socket type not supported.
	**/
	extern public var ESOCKTNOSUPPORT : Int;
	/**
		```lua
		(field) uv.errno.ESPIPE: integer
		```
		
		---
		
		invalid seek.
	**/
	extern public var ESPIPE : Int;
	/**
		```lua
		(field) uv.errno.ESRCH: integer
		```
		
		---
		
		no such process.
	**/
	extern public var ESRCH : Int;
	/**
		```lua
		(field) uv.errno.ETIMEDOUT: integer
		```
		
		---
		
		connection timed out.
	**/
	extern public var ETIMEDOUT : Int;
	/**
		```lua
		(field) uv.errno.ETXTBSY: integer
		```
		
		---
		
		text file is busy.
	**/
	extern public var ETXTBSY : Int;
	/**
		```lua
		(field) uv.errno.EXDEV: integer
		```
		
		---
		
		cross-device link not permitted.
	**/
	extern public var EXDEV : Int;
	/**
		```lua
		(field) uv.errno.UNKNOWN: integer
		```
		
		---
		
		unknown error.
	**/
	extern public var UNKNOWN : Int;
}