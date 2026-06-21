package nvim.type.uv.getaddrinfo;

extern typedef Callback = (err:nvim.type.uv.callback.Err, ?addresses:Null<Array<nvim.type.uv.getaddrinfo.Result>>) -> Dynamic;