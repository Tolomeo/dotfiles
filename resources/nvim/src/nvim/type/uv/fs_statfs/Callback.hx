package nvim.type.uv.fs_statfs;

extern typedef Callback = (err:nvim.type.uv.callback.Err, ?stat:Null<nvim.type.uv.fs_statfs.Result>) -> Dynamic;