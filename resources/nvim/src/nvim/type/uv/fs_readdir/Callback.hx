package nvim.type.uv.fs_readdir;

extern typedef Callback = (err:nvim.type.uv.callback.Err, ?entries:Null<lua.Table<Int, nvim.type.uv.fs_readdir.Entry>>) -> Dynamic;