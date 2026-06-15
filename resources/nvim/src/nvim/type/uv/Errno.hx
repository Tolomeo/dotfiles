package nvim.type.uv;

/**
	```lua
	(class) uv.errno
	```
	
	---
	
	 A table value which exposes error constants as a map, where the key is the error name (without the UV_ prefix) and its value is a negative number.
	
**/
@:structInit extern class Errno {
	/**
		```lua
		(field) uv.errno.E2BIG: integer
		```
		
		---
		
		argument list too long.
	**/
	var E2BIG : Int;
	/**
		```lua
		(field) uv.errno.EACCES: integer
		```
		
		---
		
		permission denied.
	**/
	var EACCES : Int;
	/**
		```lua
		(field) uv.errno.EADDRINUSE: integer
		```
		
		---
		
		address already in use.
	**/
	var EADDRINUSE : Int;
	/**
		```lua
		(field) uv.errno.EADDRNOTAVAIL: integer
		```
		
		---
		
		address not available.
	**/
	var EADDRNOTAVAIL : Int;
	/**
		```lua
		(field) uv.errno.EAFNOSUPPORT: integer
		```
		
		---
		
		address family not supported.
	**/
	var EAFNOSUPPORT : Int;
	/**
		```lua
		(field) uv.errno.EAGAIN: integer
		```
		
		---
		
		resource temporarily unavailable.
	**/
	var EAGAIN : Int;
	/**
		```lua
		(field) uv.errno.EAI_ADDRFAMILY: integer
		```
		
		---
		
		address family not supported.
	**/
	var EAI_ADDRFAMILY : Int;
	/**
		```lua
		(field) uv.errno.EAI_AGAIN: integer
		```
		
		---
		
		temporary failure.
	**/
	var EAI_AGAIN : Int;
	/**
		```lua
		(field) uv.errno.EAI_BADFLAGS: integer
		```
		
		---
		
		bad ai_flags value.
	**/
	var EAI_BADFLAGS : Int;
	/**
		```lua
		(field) uv.errno.EAI_BADHINTS: integer
		```
		
		---
		
		invalid value for hints.
	**/
	var EAI_BADHINTS : Int;
	/**
		```lua
		(field) uv.errno.EAI_CANCELED: integer
		```
		
		---
		
		request canceled.
	**/
	var EAI_CANCELED : Int;
	/**
		```lua
		(field) uv.errno.EAI_FAIL: integer
		```
		
		---
		
		permanent failure.
	**/
	var EAI_FAIL : Int;
	/**
		```lua
		(field) uv.errno.EAI_FAMILY: integer
		```
		
		---
		
		ai_family not supported.
	**/
	var EAI_FAMILY : Int;
	/**
		```lua
		(field) uv.errno.EAI_MEMORY: integer
		```
		
		---
		
		out of memory.
	**/
	var EAI_MEMORY : Int;
	/**
		```lua
		(field) uv.errno.EAI_NODATA: integer
		```
		
		---
		
		no address.
	**/
	var EAI_NODATA : Int;
	/**
		```lua
		(field) uv.errno.EAI_NONAME: integer
		```
		
		---
		
		unknown node or service.
	**/
	var EAI_NONAME : Int;
	/**
		```lua
		(field) uv.errno.EAI_OVERFLOW: integer
		```
		
		---
		
		argument buffer overflow.
	**/
	var EAI_OVERFLOW : Int;
	/**
		```lua
		(field) uv.errno.EAI_PROTOCOL: integer
		```
		
		---
		
		resolved protocol is unknown.
	**/
	var EAI_PROTOCOL : Int;
	/**
		```lua
		(field) uv.errno.EAI_SERVICE: integer
		```
		
		---
		
		service not available for socket type.
	**/
	var EAI_SERVICE : Int;
	/**
		```lua
		(field) uv.errno.EAI_SOCKTYPE: integer
		```
		
		---
		
		socket type not supported.
	**/
	var EAI_SOCKTYPE : Int;
	/**
		```lua
		(field) uv.errno.EALREADY: integer
		```
		
		---
		
		connection already in progress.
	**/
	var EALREADY : Int;
	/**
		```lua
		(field) uv.errno.EBADF: integer
		```
		
		---
		
		bad file descriptor.
	**/
	var EBADF : Int;
	/**
		```lua
		(field) uv.errno.EBUSY: integer
		```
		
		---
		
		resource busy or locked.
	**/
	var EBUSY : Int;
	/**
		```lua
		(field) uv.errno.ECANCELED: integer
		```
		
		---
		
		operation canceled.
	**/
	var ECANCELED : Int;
	/**
		```lua
		(field) uv.errno.ECHARSET: integer
		```
		
		---
		
		invalid Unicode character.
	**/
	var ECHARSET : Int;
	/**
		```lua
		(field) uv.errno.ECONNABORTED: integer
		```
		
		---
		
		software caused connection abort.
	**/
	var ECONNABORTED : Int;
	/**
		```lua
		(field) uv.errno.ECONNREFUSED: integer
		```
		
		---
		
		connection refused.
	**/
	var ECONNREFUSED : Int;
	/**
		```lua
		(field) uv.errno.ECONNRESET: integer
		```
		
		---
		
		connection reset by peer.
	**/
	var ECONNRESET : Int;
	/**
		```lua
		(field) uv.errno.EDESTADDRREQ: integer
		```
		
		---
		
		destination address required.
	**/
	var EDESTADDRREQ : Int;
	/**
		```lua
		(field) uv.errno.EEXIST: integer
		```
		
		---
		
		file already exists.
	**/
	var EEXIST : Int;
	/**
		```lua
		(field) uv.errno.EFAULT: integer
		```
		
		---
		
		bad address in system call argument.
	**/
	var EFAULT : Int;
	/**
		```lua
		(field) uv.errno.EFBIG: integer
		```
		
		---
		
		file too large.
	**/
	var EFBIG : Int;
	/**
		```lua
		(field) uv.errno.EFTYPE: integer
		```
		
		---
		
		inappropriate file type or format.
	**/
	var EFTYPE : Int;
	/**
		```lua
		(field) uv.errno.EHOSTUNREACH: integer
		```
		
		---
		
		host is unreachable.
	**/
	var EHOSTUNREACH : Int;
	/**
		```lua
		(field) uv.errno.EILSEQ: integer
		```
		
		---
		
		illegal byte sequence.
	**/
	var EILSEQ : Int;
	/**
		```lua
		(field) uv.errno.EINTR: integer
		```
		
		---
		
		interrupted system call.
	**/
	var EINTR : Int;
	/**
		```lua
		(field) uv.errno.EINVAL: integer
		```
		
		---
		
		invalid argument.
	**/
	var EINVAL : Int;
	/**
		```lua
		(field) uv.errno.EIO: integer
		```
		
		---
		
		i/o error.
	**/
	var EIO : Int;
	/**
		```lua
		(field) uv.errno.EISCONN: integer
		```
		
		---
		
		socket is already connected.
	**/
	var EISCONN : Int;
	/**
		```lua
		(field) uv.errno.EISDIR: integer
		```
		
		---
		
		illegal operation on a directory.
	**/
	var EISDIR : Int;
	/**
		```lua
		(field) uv.errno.ELOOP: integer
		```
		
		---
		
		too many symbolic links encountered.
	**/
	var ELOOP : Int;
	/**
		```lua
		(field) uv.errno.EMFILE: integer
		```
		
		---
		
		too many open files.
	**/
	var EMFILE : Int;
	/**
		```lua
		(field) uv.errno.EMLINK: integer
		```
		
		---
		
		too many links.
	**/
	var EMLINK : Int;
	/**
		```lua
		(field) uv.errno.EMSGSIZE: integer
		```
		
		---
		
		message too long.
	**/
	var EMSGSIZE : Int;
	/**
		```lua
		(field) uv.errno.ENAMETOOLONG: integer
		```
		
		---
		
		name too long.
	**/
	var ENAMETOOLONG : Int;
	/**
		```lua
		(field) uv.errno.ENETDOWN: integer
		```
		
		---
		
		network is down.
	**/
	var ENETDOWN : Int;
	/**
		```lua
		(field) uv.errno.ENETUNREACH: integer
		```
		
		---
		
		network is unreachable.
	**/
	var ENETUNREACH : Int;
	/**
		```lua
		(field) uv.errno.ENFILE: integer
		```
		
		---
		
		file table overflow.
	**/
	var ENFILE : Int;
	/**
		```lua
		(field) uv.errno.ENOBUFS: integer
		```
		
		---
		
		no buffer space available.
	**/
	var ENOBUFS : Int;
	/**
		```lua
		(field) uv.errno.ENODEV: integer
		```
		
		---
		
		no such device.
	**/
	var ENODEV : Int;
	/**
		```lua
		(field) uv.errno.ENOENT: integer
		```
		
		---
		
		no such file or directory.
	**/
	var ENOENT : Int;
	/**
		```lua
		(field) uv.errno.ENOMEM: integer
		```
		
		---
		
		not enough memory.
	**/
	var ENOMEM : Int;
	/**
		```lua
		(field) uv.errno.ENONET: integer
		```
		
		---
		
		machine is not on the network.
	**/
	var ENONET : Int;
	/**
		```lua
		(field) uv.errno.ENOPROTOOPT: integer
		```
		
		---
		
		protocol not available.
	**/
	var ENOPROTOOPT : Int;
	/**
		```lua
		(field) uv.errno.ENOSPC: integer
		```
		
		---
		
		no space left on device.
	**/
	var ENOSPC : Int;
	/**
		```lua
		(field) uv.errno.ENOSYS: integer
		```
		
		---
		
		function not implemented.
	**/
	var ENOSYS : Int;
	/**
		```lua
		(field) uv.errno.ENOTCONN: integer
		```
		
		---
		
		socket is not connected.
	**/
	var ENOTCONN : Int;
	/**
		```lua
		(field) uv.errno.ENOTDIR: integer
		```
		
		---
		
		not a directory.
	**/
	var ENOTDIR : Int;
	/**
		```lua
		(field) uv.errno.ENOTEMPTY: integer
		```
		
		---
		
		directory not empty.
	**/
	var ENOTEMPTY : Int;
	/**
		```lua
		(field) uv.errno.ENOTSOCK: integer
		```
		
		---
		
		socket operation on non-socket.
	**/
	var ENOTSOCK : Int;
	/**
		```lua
		(field) uv.errno.ENOTSUP: integer
		```
		
		---
		
		operation not supported on socket.
	**/
	var ENOTSUP : Int;
	/**
		```lua
		(field) uv.errno.ENOTTY: integer
		```
		
		---
		
		inappropriate ioctl for device.
	**/
	var ENOTTY : Int;
	/**
		```lua
		(field) uv.errno.ENXIO: integer
		```
		
		---
		
		no such device or address.
	**/
	var ENXIO : Int;
	/**
		```lua
		(field) uv.errno.EOF: integer
		```
		
		---
		
		end of file.
	**/
	var EOF : Int;
	/**
		```lua
		(field) uv.errno.EOVERFLOW: integer
		```
		
		---
		
		value too large for defined data type.
	**/
	var EOVERFLOW : Int;
	/**
		```lua
		(field) uv.errno.EPERM: integer
		```
		
		---
		
		operation not permitted.
	**/
	var EPERM : Int;
	/**
		```lua
		(field) uv.errno.EPIPE: integer
		```
		
		---
		
		broken pipe.
	**/
	var EPIPE : Int;
	/**
		```lua
		(field) uv.errno.EPROTO: integer
		```
		
		---
		
		protocol error.
	**/
	var EPROTO : Int;
	/**
		```lua
		(field) uv.errno.EPROTONOSUPPORT: integer
		```
		
		---
		
		protocol not supported.
	**/
	var EPROTONOSUPPORT : Int;
	/**
		```lua
		(field) uv.errno.EPROTOTYPE: integer
		```
		
		---
		
		protocol wrong type for socket.
	**/
	var EPROTOTYPE : Int;
	/**
		```lua
		(field) uv.errno.ERANGE: integer
		```
		
		---
		
		result too large.
	**/
	var ERANGE : Int;
	/**
		```lua
		(field) uv.errno.EROFS: integer
		```
		
		---
		
		read-only file system.
	**/
	var EROFS : Int;
	/**
		```lua
		(field) uv.errno.ESHUTDOWN: integer
		```
		
		---
		
		cannot send after transport endpoint shutdown.
	**/
	var ESHUTDOWN : Int;
	/**
		```lua
		(field) uv.errno.ESOCKTNOSUPPORT: integer
		```
		
		---
		
		socket type not supported.
	**/
	var ESOCKTNOSUPPORT : Int;
	/**
		```lua
		(field) uv.errno.ESPIPE: integer
		```
		
		---
		
		invalid seek.
	**/
	var ESPIPE : Int;
	/**
		```lua
		(field) uv.errno.ESRCH: integer
		```
		
		---
		
		no such process.
	**/
	var ESRCH : Int;
	/**
		```lua
		(field) uv.errno.ETIMEDOUT: integer
		```
		
		---
		
		connection timed out.
	**/
	var ETIMEDOUT : Int;
	/**
		```lua
		(field) uv.errno.ETXTBSY: integer
		```
		
		---
		
		text file is busy.
	**/
	var ETXTBSY : Int;
	/**
		```lua
		(field) uv.errno.EXDEV: integer
		```
		
		---
		
		cross-device link not permitted.
	**/
	var EXDEV : Int;
	/**
		```lua
		(field) uv.errno.UNKNOWN: integer
		```
		
		---
		
		unknown error.
	**/
	var UNKNOWN : Int;
}