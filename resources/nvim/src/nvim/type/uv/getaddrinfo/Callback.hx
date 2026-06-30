package nvim.type.uv.getaddrinfo;

extern typedef Callback = (err:nvim.type.uv.callback.Err, ?addresses:Null<lua.Table<Int, nvim.type.uv.getaddrinfo.Result>>) -> Dynamic;