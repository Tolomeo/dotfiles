package nvim.type.uv.fs_lstat;

extern typedef Callback = (err:nvim.type.uv.callback.Err, ?stat:Null<nvim.type.uv.fs_stat.Result>) -> Dynamic;