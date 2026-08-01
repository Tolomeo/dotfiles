local _hx_hidden = {__id__=true, hx__closures=true, super=true, prototype=true, __fields__=true, __ifields__=true, __class__=true, __properties__=true, __fields__=true, __name__=true}

_hx_array_mt = {
    __newindex = function(t,k,v)
        local len = t.length
        t.length =  k >= len and (k + 1) or len
        rawset(t,k,v)
    end
}

function _hx_is_array(o)
    return type(o) == "table"
        and o.__enum__ == nil
        and getmetatable(o) == _hx_array_mt
end



function _hx_tab_array(tab, length)
    tab.length = length
    return setmetatable(tab, _hx_array_mt)
end



function _hx_print_class(obj, depth)
    local first = true
    local result = ''
    for k,v in pairs(obj) do
        if _hx_hidden[k] == nil then
            if first then
                first = false
            else
                result = result .. ', '
            end
            if _hx_hidden[k] == nil then
                result = result .. k .. ':' .. _hx_tostring(v, depth+1)
            end
        end
    end
    return '{ ' .. result .. ' }'
end

function _hx_print_enum(o, depth)
    if o.length == 2 then
        return o[0]
    else
        local str = o[0] .. "("
        for i = 2, (o.length-1) do
            if i ~= 2 then
                str = str .. "," .. _hx_tostring(o[i], depth+1)
            else
                str = str .. _hx_tostring(o[i], depth+1)
            end
        end
        return str .. ")"
    end
end

function _hx_tostring(obj, depth)
    if depth == nil then
        depth = 0
    elseif depth > 5 then
        return "<...>"
    end

    local tstr = _G.type(obj)
    if tstr == "string" then return obj
    elseif tstr == "nil" then return "null"
    elseif tstr == "number" then
        if obj == _G.math.POSITIVE_INFINITY then return "Infinity"
        elseif obj == _G.math.NEGATIVE_INFINITY then return "-Infinity"
        elseif obj == 0 then return "0"
        elseif obj ~= obj then return "NaN"
        else return _G.tostring(obj)
        end
    elseif tstr == "boolean" then return _G.tostring(obj)
    elseif tstr == "userdata" then
        local mt = _G.getmetatable(obj)
        if mt ~= nil and mt.__tostring ~= nil then
            return _G.tostring(obj)
        else
            return "<userdata>"
        end
    elseif tstr == "function" then return "<function>"
    elseif tstr == "thread" then return "<thread>"
    elseif tstr == "table" then
        if obj.__enum__ ~= nil then
            return _hx_print_enum(obj, depth)
        elseif obj.toString ~= nil and not _hx_is_array(obj) then return obj:toString()
        elseif _hx_is_array(obj) then
            if obj.length > 5 then
                return "[...]"
            else
                local str = ""
                for i=0, (obj.length-1) do
                    if i == 0 then
                        str = str .. _hx_tostring(obj[i], depth+1)
                    else
                        str = str .. "," .. _hx_tostring(obj[i], depth+1)
                    end
                end
                return "[" .. str .. "]"
            end
        elseif obj.__class__ ~= nil then
            return _hx_print_class(obj, depth)
        else
            local buffer = {}
            local ref = obj
            if obj.__fields__ ~= nil then
                ref = obj.__fields__
            end
            for k,v in pairs(ref) do
                if _hx_hidden[k] == nil then
                    _G.table.insert(buffer, _hx_tostring(k, depth+1) .. ' : ' .. _hx_tostring(obj[k], depth+1))
                end
            end

            return "{ " .. table.concat(buffer, ", ") .. " }"
        end
    else
        _G.error("Unknown Lua type", 0)
        return ""
    end
end

function _hx_error(obj)
    if obj.value then
        _G.print("runtime error:\n " .. _hx_tostring(obj.value));
    else
        _G.print("runtime error:\n " .. tostring(obj));
    end

    if _G.debug and _G.debug.traceback then
        _G.print(debug.traceback());
    end
end


local function _hx_obj_newindex(t,k,v)
    t.__fields__[k] = true
    rawset(t,k,v)
end

local _hx_obj_mt = {__newindex=_hx_obj_newindex, __tostring=_hx_tostring}

local function _hx_a(...)
  local __fields__ = {};
  local ret = {__fields__ = __fields__};
  local max = select('#',...);
  local tab = {...};
  local cur = 1;
  while cur < max do
    local v = tab[cur];
    __fields__[v] = true;
    ret[v] = tab[cur+1];
    cur = cur + 2
  end
  return setmetatable(ret, _hx_obj_mt)
end

local function _hx_e()
  return setmetatable({__fields__ = {}}, _hx_obj_mt)
end

local function _hx_o(obj)
  return setmetatable(obj, _hx_obj_mt)
end

local function _hx_new(prototype)
  return setmetatable({__fields__ = {}}, {__newindex=_hx_obj_newindex, __index=prototype, __tostring=_hx_tostring})
end

function _hx_field_arr(obj)
    res = {}
    idx = 0
    if obj.__fields__ ~= nil then
        obj = obj.__fields__
    end
    for k,v in pairs(obj) do
        if _hx_hidden[k] == nil then
            res[idx] = k
            idx = idx + 1
        end
    end
    return _hx_tab_array(res, idx)
end

local _hxClasses = {}
local Int = _hx_e();
local Dynamic = _hx_e();
local Float = _hx_e();
local Bool = _hx_e();
local Class = _hx_e();
local Enum = _hx_e();

local _hx_exports = _hx_exports or {}
local Array = _hx_e()
local IntIterator = _hx_e()
local Lambda = _hx_e()
local Module = _hx_e()
local Macro = _hx_e()
local Math = _hx_e()
local Reflect = _hx_e()
local Settings = _hx_e()
___Settings_Settings_Fields_ = _hx_e()
local String = _hx_e()
local Std = _hx_e()
local StringTools = _hx_e()
__haxe_iterators_ArrayIterator = _hx_e()
__haxe_iterators_ArrayKeyValueIterator = _hx_e()
__lua_PairTools = _hx_e()
__nvim_helper__Native_LuaArray_Impl_ = _hx_e()
__nvim_helper__Native_LuaObject_Impl_ = _hx_e()
__nvim_helper__Native_Native_Fields_ = _hx_e()
__nvim_type_vim_VarAccessor = _hx_e()
__nvim_type_vim_api_keyset_EchoOpts = _hx_e()
__nvim_type_vim_api_keyset_UserCommand = _hx_e()
__nvim_type_vim_api_keyset_create_user_command_CommandArgs = _hx_e()

local _hx_bind, _hx_bit, _hx_staticToInstance, _hx_funcToField, _hx_maxn, _hx_print, _hx_apply_self, _hx_box_mr, _hx_bit_clamp, _hx_table, _hx_bit_raw
local _hx_pcall_default = {};
local _hx_pcall_break = {};

Array.new = function() 
  local self = _hx_new(Array.prototype)
  Array.super(self)
  return self
end
Array.super = function(self) 
  _hx_tab_array(self, 0);
end
Array.prototype = _hx_e();
Array.prototype.concat = function(self,a) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  while (_g1 < self.length) do 
    local i = self[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  local _g1 = 0;
  while (_g1 < a.length) do 
    local i = a[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  do return _g end
end
Array.prototype.join = function(self,sep) 
  local tbl = ({});
  local _g_current = 0;
  while (_g_current < self.length) do 
    _g_current = _g_current + 1;
    _G.table.insert(tbl, Std.string(self[_g_current - 1]));
  end;
  do return _G.table.concat(tbl, sep) end
end
Array.prototype.pop = function(self) 
  if (self.length == 0) then 
    do return nil end;
  end;
  local ret = self[self.length - 1];
  self[self.length - 1] = nil;
  self.length = self.length - 1;
  do return ret end
end
Array.prototype.push = function(self,x) 
  self[self.length] = x;
  do return self.length end
end
Array.prototype.reverse = function(self) 
  local tmp;
  local i = 0;
  while (i < Std.int(self.length / 2)) do 
    tmp = self[i];
    self[i] = self[(self.length - i) - 1];
    self[(self.length - i) - 1] = tmp;
    i = i + 1;
  end;
end
Array.prototype.shift = function(self) 
  if (self.length == 0) then 
    do return nil end;
  end;
  local ret = self[0];
  if (self.length == 1) then 
    self[0] = nil;
  else
    if (self.length > 1) then 
      self[0] = self[1];
      _G.table.remove(self, 1);
    end;
  end;
  local tmp = self;
  tmp.length = tmp.length - 1;
  do return ret end
end
Array.prototype.slice = function(self,pos,_end) 
  if ((_end == nil) or (_end > self.length)) then 
    _end = self.length;
  else
    if (_end < 0) then 
      _end = _G.math.fmod((self.length - (_G.math.fmod(-_end, self.length))), self.length);
    end;
  end;
  if (pos < 0) then 
    pos = _G.math.fmod((self.length - (_G.math.fmod(-pos, self.length))), self.length);
  end;
  if ((pos > _end) or (pos > self.length)) then 
    do return _hx_tab_array({}, 0) end;
  end;
  local ret = _hx_tab_array({}, 0);
  local _g = pos;
  local _g1 = _end;
  while (_g < _g1) do 
    _g = _g + 1;
    ret:push(self[_g - 1]);
  end;
  do return ret end
end
Array.prototype.sort = function(self,f) 
  local i = 0;
  local l = self.length;
  while (i < l) do 
    local swap = false;
    local j = 0;
    local max = (l - i) - 1;
    while (j < max) do 
      if (f(self[j], self[j + 1]) > 0) then 
        local tmp = self[j + 1];
        self[j + 1] = self[j];
        self[j] = tmp;
        swap = true;
      end;
      j = j + 1;
    end;
    if (not swap) then 
      break;
    end;
    i = i + 1;
  end;
end
Array.prototype.splice = function(self,pos,len) 
  if ((len < 0) or (pos > self.length)) then 
    do return _hx_tab_array({}, 0) end;
  else
    if (pos < 0) then 
      pos = self.length - (_G.math.fmod(-pos, self.length));
    end;
  end;
  len = Math.min(len, self.length - pos);
  local ret = _hx_tab_array({}, 0);
  local _g = pos;
  local _g1 = pos + len;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    ret:push(self[i]);
    self[i] = self[i + len];
  end;
  local _g = pos + len;
  local _g1 = self.length;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    self[i] = self[i + len];
  end;
  self.length = self.length - len;
  do return ret end
end
Array.prototype.toString = function(self) 
  local tbl = ({});
  _G.table.insert(tbl, "[");
  _G.table.insert(tbl, self:join(","));
  _G.table.insert(tbl, "]");
  do return _G.table.concat(tbl, "") end
end
Array.prototype.unshift = function(self,x) 
  local len = self.length;
  local _g = 0;
  while (_g < len) do 
    _g = _g + 1;
    local i = _g - 1;
    self[len - i] = self[(len - i) - 1];
  end;
  self[0] = x;
end
Array.prototype.insert = function(self,pos,x) 
  if (pos > self.length) then 
    pos = self.length;
  end;
  if (pos < 0) then 
    pos = self.length + pos;
    if (pos < 0) then 
      pos = 0;
    end;
  end;
  local cur_len = self.length;
  while (cur_len > pos) do 
    self[cur_len] = self[cur_len - 1];
    cur_len = cur_len - 1;
  end;
  self[pos] = x;
end
Array.prototype.remove = function(self,x) 
  local _g = 0;
  local _g1 = self.length;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    if (self[i] == x) then 
      local _g = i;
      local _g1 = self.length - 1;
      while (_g < _g1) do 
        _g = _g + 1;
        local j = _g - 1;
        self[j] = self[j + 1];
      end;
      self[self.length - 1] = nil;
      self.length = self.length - 1;
      do return true end;
    end;
  end;
  do return false end
end
Array.prototype.contains = function(self,x) 
  local _g = 0;
  local _g1 = self.length;
  while (_g < _g1) do 
    _g = _g + 1;
    if (self[_g - 1] == x) then 
      do return true end;
    end;
  end;
  do return false end
end
Array.prototype.indexOf = function(self,x,fromIndex) 
  local _end = self.length;
  if (fromIndex == nil) then 
    fromIndex = 0;
  else
    if (fromIndex < 0) then 
      fromIndex = self.length + fromIndex;
      if (fromIndex < 0) then 
        fromIndex = 0;
      end;
    end;
  end;
  local _g = fromIndex;
  while (_g < _end) do 
    _g = _g + 1;
    local i = _g - 1;
    if (x == self[i]) then 
      do return i end;
    end;
  end;
  do return -1 end
end
Array.prototype.lastIndexOf = function(self,x,fromIndex) 
  if ((fromIndex == nil) or (fromIndex >= self.length)) then 
    fromIndex = self.length - 1;
  else
    if (fromIndex < 0) then 
      fromIndex = self.length + fromIndex;
      if (fromIndex < 0) then 
        do return -1 end;
      end;
    end;
  end;
  local i = fromIndex;
  while (i >= 0) do 
    if (self[i] == x) then 
      do return i end;
    else
      i = i - 1;
    end;
  end;
  do return -1 end
end
Array.prototype.copy = function(self) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  while (_g1 < self.length) do 
    local i = self[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  do return _g end
end
Array.prototype.map = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  while (_g1 < self.length) do 
    local i = self[_g1];
    _g1 = _g1 + 1;
    _g:push(f(i));
  end;
  do return _g end
end
Array.prototype.filter = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  while (_g1 < self.length) do 
    local i = self[_g1];
    _g1 = _g1 + 1;
    if (f(i)) then 
      _g:push(i);
    end;
  end;
  do return _g end
end
Array.prototype.iterator = function(self) 
  do return __haxe_iterators_ArrayIterator.new(self) end
end
Array.prototype.keyValueIterator = function(self) 
  do return __haxe_iterators_ArrayKeyValueIterator.new(self) end
end
Array.prototype.resize = function(self,len) 
  if (self.length < len) then 
    self.length = len;
  else
    if (self.length > len) then 
      local _g = len;
      local _g1 = self.length;
      while (_g < _g1) do 
        _g = _g + 1;
        self[_g - 1] = nil;
      end;
      self.length = len;
    end;
  end;
end

IntIterator.new = function(min,max) 
  local self = _hx_new(IntIterator.prototype)
  IntIterator.super(self,min,max)
  return self
end
IntIterator.super = function(self,min,max) 
  self.min = min;
  self.max = max;
end
IntIterator.prototype = _hx_e();
IntIterator.prototype.hasNext = function(self) 
  do return self.min < self.max end
end
IntIterator.prototype.next = function(self) 
  do return (function() 
  local _hx_obj = self;
  local _hx_fld = 'min';
  local _ = _hx_obj[_hx_fld];
  _hx_obj[_hx_fld] = _hx_obj[_hx_fld]  + 1;
   return _;
   end)() end
end

Lambda.new = {}
Lambda.fold = function(it,f,first) 
  local x = it:iterator();
  while (x:hasNext()) do 
    first = f(x:next(), first);
  end;
  do return first end;
end

Module.new = function(id,modules,plugins) 
  local self = _hx_new(Module.prototype)
  Module.super(self,id,modules,plugins)
  return self
end
Module.super = function(self,id,modules,plugins) 
  self.id = id;
  self.modules = modules;
  self.plugins = plugins;
end
Module.prototype = _hx_e();
Module.prototype.init = function(self) 
  self:setup();
end
Module.prototype.setup = function(self) 
end
Module.prototype.list_plugins = function(self) 
  do return self.plugins end
end
Module.prototype.getConfig = function(self) 
  do return Reflect.getProperty(Settings.get().config, self.id) end
end
Module.prototype.setConfig = function(self,config) 
  Settings.get():saveConfig(self.id, config);
end

Macro.new = function() 
  local self = _hx_new(Macro.prototype)
  Macro.super(self)
  return self
end
Macro.super = function(self) 
  Module.super(self,"macro",_hx_tab_array({}, 0),_hx_tab_array({}, 0));
end
_hx_exports["macro"] = Macro
Macro.prototype = _hx_e();
Macro.prototype.yank = function(self) 
  local _gthis = self;
  local registerName = vim.fn.input("Please specify a register to yank from: ");
  local opts = __nvim_type_vim_api_keyset_EchoOpts.new(nil, nil);
  vim.api.nvim_echo(__nvim_helper__Native_LuaArray_Impl_.toTableArray(__nvim_helper__Native_LuaArray_Impl_.fromArray(_hx_tab_array({}, 0))), false, __nvim_helper__Native_LuaObject_Impl_.toTableObject(opts));
  vim.schedule(function() 
    if (registerName == "") then 
      vim.notify("Invalid register name", vim.log.levels.ERROR);
      do return nil end;
    end;
    do return _gthis:yankRegister(registerName) end;
  end);
end
Macro.prototype.yankRegister = function(self,registerName) 
  local registerContent = vim.fn.getreg(registerName);
  if (registerContent == "") then 
    vim.notify("Invalid register content", vim.log.levels.ERROR);
    do return nil end;
  end;
  local length = nil;
  local tab = __lua_PairTools.copy(self:getConfig().escapeCharacters);
  local length = length;
  local macroContent;
  if (length == nil) then 
    length = _hx_table.maxn(tab);
    if (length > 0) then 
      local head = tab[1];
      _G.table.remove(tab, 1);
      tab[0] = head;
      macroContent = _hx_tab_array(tab, length);
    else
      macroContent = _hx_tab_array({}, 0);
    end;
  else
    macroContent = _hx_tab_array(tab, length);
  end;
  local macroContent = Lambda.fold(macroContent, function(character,content) 
    do return StringTools.replace(content, character, Std.string("\\") .. Std.string(character)) end;
  end, vim.fn.keytrans(registerContent));
  vim.fn.setreg("+", macroContent);
  vim.fn.setreg("*", macroContent);
  vim.fn.setreg("\"", macroContent);
  vim.notify(Std.string("Yanked macro content from register ") .. Std.string(registerName), vim.log.levels.INFO);
  do return nil end
end
Macro.prototype.save = function(self) 
  local _gthis = self;
  local register = vim.fn.input("Please specify a register to save: ");
  local label = vim.fn.input("Please specify a label to use: ");
  local opts = __nvim_type_vim_api_keyset_EchoOpts.new(nil, nil);
  vim.api.nvim_echo(__nvim_helper__Native_LuaArray_Impl_.toTableArray(__nvim_helper__Native_LuaArray_Impl_.fromArray(_hx_tab_array({}, 0))), false, __nvim_helper__Native_LuaObject_Impl_.toTableObject(opts));
  vim.schedule(function() 
    if (register == "") then 
      vim.notify("Invalid register name", vim.log.levels.ERROR);
      do return nil end;
    end;
    do return _gthis:saveRegister(register, label) end;
  end);
end
Macro.prototype.saveRegister = function(self,register,label) 
  local registerContent = vim.fn.getreg(register);
  if (registerContent == "") then 
    vim.notify("Invalid register content", vim.log.levels.ERROR);
    do return nil end;
  end;
  local config = self:getConfig();
  Reflect.setProperty(config.saved, label, registerContent);
  self:setConfig(config);
  do return nil end
end
Macro.prototype.setup = function(self) 
  local _gthis = self;
  vim.api.nvim_create_user_command("YankMacro", function(args) 
    local length = nil;
    local tab = __lua_PairTools.copy(args.fargs);
    local length = length;
    local _g;
    if (length == nil) then 
      length = _hx_table.maxn(tab);
      if (length > 0) then 
        local head = tab[1];
        _G.table.remove(tab, 1);
        tab[0] = head;
        _g = _hx_tab_array(tab, length);
      else
        _g = _hx_tab_array({}, 0);
      end;
    else
      _g = _hx_tab_array(tab, length);
    end;
    local _g1 = _g.length;
    if (_g1) == 0 then 
      _gthis:yank();
    elseif (_g1) == 1 then 
      _gthis:yankRegister(_g[0]);else
    vim.notify(Std.string(Std.string("Error yanking macro: invalid number of arguments received ") .. Std.string(Std.string(_g))) .. Std.string(", expected 1 argument only"), vim.log.levels.ERROR); end;
  end, __nvim_helper__Native_LuaObject_Impl_.toTableObject(__nvim_type_vim_api_keyset_UserCommand.new(nil, nil, nil, nil, nil, nil, nil, nil, "*", nil, nil, nil)));
  vim.api.nvim_create_user_command("SaveMacro", function(args) 
    local length = nil;
    local tab = __lua_PairTools.copy(args.fargs);
    local length = length;
    local _g;
    if (length == nil) then 
      length = _hx_table.maxn(tab);
      if (length > 0) then 
        local head = tab[1];
        _G.table.remove(tab, 1);
        tab[0] = head;
        _g = _hx_tab_array(tab, length);
      else
        _g = _hx_tab_array({}, 0);
      end;
    else
      _g = _hx_tab_array(tab, length);
    end;
    local _g1 = _g.length;
    if (_g1) == 0 then 
      _gthis:save();
    elseif (_g1) == 2 then 
      _gthis:saveRegister(_g[0], _g[1]);else
    vim.notify(Std.string(Std.string("Error saving macro: invalid number of arguments received ") .. Std.string(Std.string(_g))) .. Std.string(", expected 2 arguments [register, label]"), vim.log.levels.ERROR); end;
  end, __nvim_helper__Native_LuaObject_Impl_.toTableObject(__nvim_type_vim_api_keyset_UserCommand.new(nil, nil, nil, nil, nil, nil, nil, nil, "*", nil, nil, nil)));
end
Macro.__super__ = Module
setmetatable(Macro.prototype,{__index=Module.prototype})

Math.new = {}
Math.isNaN = function(f) 
  do return f ~= f end;
end
Math.isFinite = function(f) 
  if (f > -_G.math.huge) then 
    do return f < _G.math.huge end;
  else
    do return false end;
  end;
end
Math.min = function(a,b) 
  if (Math.isNaN(a) or Math.isNaN(b)) then 
    do return (0/0) end;
  else
    do return _G.math.min(a, b) end;
  end;
end

Reflect.new = {}
Reflect.field = function(o,field) 
  if (_G.type(o) == "string") then 
    if (field == "length") then 
      do return _hx_wrap_if_string_field(o,'length') end;
    else
      do return String.prototype[field] end;
    end;
  else
    local _hx_status, _hx_result = pcall(function() 
    
        do return o[field] end;
      return _hx_pcall_default
    end)
    if not _hx_status and _hx_result == "_hx_pcall_break" then
    elseif not _hx_status then 
      local _g = _hx_result;
      do return nil end;
    elseif _hx_result ~= _hx_pcall_default then
      return _hx_result
    end;
  end;
end
Reflect.getProperty = function(o,field) 
  if (o == nil) then 
    do return nil end;
  else
    if ((o.__properties__ ~= nil) and (Reflect.field(o, Std.string("get_") .. Std.string(field)) ~= nil)) then 
      do return Reflect.callMethod(o,Reflect.field(o, Std.string("get_") .. Std.string(field)),_hx_tab_array({}, 0)) end;
    else
      do return Reflect.field(o, field) end;
    end;
  end;
end
Reflect.setProperty = function(o,field,value) 
  if ((o.__properties__ ~= nil) and o.__properties__[Std.string("set_") .. Std.string(field)]) then 
    local tmp = o.__properties__[Std.string("set_") .. Std.string(field)];
    Reflect.callMethod(o,Reflect.field(o, tmp),_hx_tab_array({[0]=value}, 1));
  else
    o[field] = value;
  end;
end
Reflect.callMethod = function(o,func,args) 
  if ((args == nil) or (args.length == 0)) then 
    do return func(o) end;
  else
    local self_arg = false;
    if ((o ~= nil) and (o.__name__ == nil)) then 
      self_arg = true;
    end;
    if (self_arg) then 
      do return func(o, _hx_table.unpack(args, 0, args.length - 1)) end;
    else
      do return func(_hx_table.unpack(args, 0, args.length - 1)) end;
    end;
  end;
end

Settings.new = function() 
  local self = _hx_new(Settings.prototype)
  Settings.super(self)
  return self
end
Settings.super = function(self) 
  self.config = ({});
  self.keymap = ({});
  self.opt = _hx_funcToField(vim.opt);
  self.g = _hx_funcToField(vim.g);
  self.userSettings = Settings.loadUserSettings();
  local settings = vim.tbl_deep_extend("force", ___Settings_Settings_Fields_.defaults, self.userSettings);
  __lua_PairTools.pairsEach(settings.opt, function(name,value) 
    vim.g[name] = value;
  end);
  __lua_PairTools.pairsEach(settings.g, function(name,value) 
    vim.g[name] = value;
  end);
  self.keymap = settings.keymap;
  self.config = settings.config;
end
_hx_exports["settings"] = Settings
Settings.get = function() 
  if (Settings.instance == nil) then 
    Settings.instance = Settings.new();
  end;
  do return Settings.instance end;
end
Settings.directory = function() 
  do return vim.fn.stdpath("config") end;
end
Settings.file = function() 
  do return vim.fs.joinpath(Settings.directory(), "settings.json") end;
end
Settings.loadUserSettings = function() 
  local directory = Settings.directory();
  if ((vim.fn.isdirectory(directory) == 0) and (vim.fn.mkdir(directory, "p") == 0)) then 
    vim.notify(Std.string(Std.string("Failed to create settings directory \"") .. Std.string(directory)) .. Std.string("\""), vim.log.levels.ERROR);
  end;
  local file = Settings.file();
  if ((vim.fn.filereadable(file) == 0) and (vim.fn.writefile(({"{}"}), file) == -1)) then 
    vim.notify(Std.string(Std.string("Failed to create settings file \"") .. Std.string(file)) .. Std.string("\""), vim.log.levels.ERROR);
  end;
  local _hx_1_result_status, _hx_1_result_value = _G.pcall(function() 
    do return vim.fn.readfile(file) end;
  end);
  if (not _hx_1_result_status) then 
    vim.notify(Std.string(Std.string("Failed to read settings file \"") .. Std.string(file)) .. Std.string("\""), vim.log.levels.ERROR);
  end;
  do return vim.json.decode(_G.table.concat(_hx_1_result_value, "\n"), __nvim_helper__Native_LuaObject_Impl_.toTableObject(({}))) end;
end
Settings.prototype = _hx_e();
Settings.prototype.setOpt = function(self,name,value) 
  vim.opt[name] = value;
end
Settings.prototype.saveConfig = function(self,name,config) 
  Reflect.setProperty(self.userSettings.config, name, config);
  local file = Settings.file();
  local settings = vim.json.encode(self.userSettings, __nvim_helper__Native_LuaObject_Impl_.toTableObject(({})));
  vim.print(settings);
  if ((vim.fn.filewritable(file) == 0) or (vim.fn.writefile(settings, file) == -1)) then 
    vim.notify(Std.string(Std.string("Failed to write settings file \"") .. Std.string(file)) .. Std.string("\""), vim.log.levels.ERROR);
  end;
  vim.notify(Std.string(Std.string("Settings file updated \"") .. Std.string(file)) .. Std.string("\""), vim.log.levels.INFO);
end

___Settings_Settings_Fields_.new = {}

String.new = function(string) 
  local self = _hx_new(String.prototype)
  String.super(self,string)
  self = string
  return self
end
String.super = function(self,string) 
end
String.__index = function(s,k) 
  if (k == "length") then 
    do return _G.string.len(s) end;
  else
    local o = String.prototype;
    local field = k;
    if ((function() 
      local _hx_1
      if ((_G.type(o) == "string") and ((String.prototype[field] ~= nil) or (field == "length"))) then 
      _hx_1 = true; elseif (o.__fields__ ~= nil) then 
      _hx_1 = o.__fields__[field] ~= nil; else 
      _hx_1 = o[field] ~= nil; end
      return _hx_1
    end )()) then 
      do return String.prototype[k] end;
    else
      if (String.__oldindex ~= nil) then 
        if (_G.type(String.__oldindex) == "function") then 
          do return String.__oldindex(s, k) end;
        else
          if (_G.type(String.__oldindex) == "table") then 
            do return String.__oldindex[k] end;
          end;
        end;
        do return nil end;
      else
        do return nil end;
      end;
    end;
  end;
end
String.indexOfEmpty = function(s,startIndex) 
  local length = _G.string.len(s);
  if (startIndex < 0) then 
    startIndex = length + startIndex;
    if (startIndex < 0) then 
      startIndex = 0;
    end;
  end;
  if (startIndex > length) then 
    do return length end;
  else
    do return startIndex end;
  end;
end
String.fromCharCode = function(code) 
  do return _G.string.char(code) end;
end
String.prototype = _hx_e();
String.prototype.toUpperCase = function(self) 
  do return _G.string.upper(self) end
end
String.prototype.toLowerCase = function(self) 
  do return _G.string.lower(self) end
end
String.prototype.indexOf = function(self,str,startIndex) 
  if (startIndex == nil) then 
    startIndex = 1;
  else
    startIndex = startIndex + 1;
  end;
  if (str == "") then 
    do return String.indexOfEmpty(self, startIndex - 1) end;
  end;
  local r = _G.string.find(self, str, startIndex, true);
  if ((r ~= nil) and (r > 0)) then 
    do return r - 1 end;
  else
    do return -1 end;
  end;
end
String.prototype.lastIndexOf = function(self,str,startIndex) 
  local ret = -1;
  if (startIndex == nil) then 
    startIndex = #self;
  end;
  while (true) do 
    local startIndex1 = ret + 1;
    if (startIndex1 == nil) then 
      startIndex1 = 1;
    else
      startIndex1 = startIndex1 + 1;
    end;
    local p;
    if (str == "") then 
      p = String.indexOfEmpty(self, startIndex1 - 1);
    else
      local r = _G.string.find(self, str, startIndex1, true);
      p = (function() 
        local _hx_1
        if ((r ~= nil) and (r > 0)) then 
        _hx_1 = r - 1; else 
        _hx_1 = -1; end
        return _hx_1
      end )();
    end;
    if (((p == -1) or (p > startIndex)) or (p == ret)) then 
      break;
    end;
    ret = p;
  end;
  do return ret end
end
String.prototype.split = function(self,delimiter) 
  local idx = 1;
  local ret = _hx_tab_array({}, 0);
  while (idx ~= nil) do 
    local newidx = 0;
    if (#delimiter > 0) then 
      newidx = _G.string.find(self, delimiter, idx, true);
    else
      if (idx >= #self) then 
        newidx = nil;
      else
        newidx = idx + 1;
      end;
    end;
    if (newidx ~= nil) then 
      ret:push(_G.string.sub(self, idx, newidx - 1));
      idx = newidx + #delimiter;
    else
      ret:push(_G.string.sub(self, idx, #self));
      idx = nil;
    end;
  end;
  do return ret end
end
String.prototype.toString = function(self) 
  do return self end
end
String.prototype.substring = function(self,startIndex,endIndex) 
  if (endIndex == nil) then 
    endIndex = #self;
  end;
  if (endIndex < 0) then 
    endIndex = 0;
  end;
  if (startIndex < 0) then 
    startIndex = 0;
  end;
  if (endIndex < startIndex) then 
    do return _G.string.sub(self, endIndex + 1, startIndex) end;
  else
    do return _G.string.sub(self, startIndex + 1, endIndex) end;
  end;
end
String.prototype.charAt = function(self,index) 
  do return _G.string.sub(self, index + 1, index + 1) end
end
String.prototype.charCodeAt = function(self,index) 
  do return _G.string.byte(self, index + 1) end
end
String.prototype.substr = function(self,pos,len) 
  if ((len == nil) or (len > (pos + #self))) then 
    len = #self;
  else
    if (len < 0) then 
      len = #self + len;
    end;
  end;
  if (pos < 0) then 
    pos = #self + pos;
  end;
  if (pos < 0) then 
    pos = 0;
  end;
  do return _G.string.sub(self, pos + 1, pos + len) end
end

Std.new = {}
Std.string = function(s) 
  do return _hx_tostring(s, 0) end;
end
Std.int = function(x) 
  if (not Math.isFinite(x) or Math.isNaN(x)) then 
    do return 0 end;
  else
    do return _hx_bit_clamp(x) end;
  end;
end

StringTools.new = {}
StringTools.replace = function(s,sub,by) 
  local idx = 1;
  local ret = _hx_tab_array({}, 0);
  while (idx ~= nil) do 
    local newidx = 0;
    if (#sub > 0) then 
      newidx = _G.string.find(s, sub, idx, true);
    else
      if (idx >= #s) then 
        newidx = nil;
      else
        newidx = idx + 1;
      end;
    end;
    if (newidx ~= nil) then 
      ret:push(_G.string.sub(s, idx, newidx - 1));
      idx = newidx + #sub;
    else
      ret:push(_G.string.sub(s, idx, #s));
      idx = nil;
    end;
  end;
  do return ret:join(by) end;
end

__haxe_iterators_ArrayIterator.new = function(array) 
  local self = _hx_new(__haxe_iterators_ArrayIterator.prototype)
  __haxe_iterators_ArrayIterator.super(self,array)
  return self
end
__haxe_iterators_ArrayIterator.super = function(self,array) 
  self.current = 0;
  self.array = array;
end
__haxe_iterators_ArrayIterator.prototype = _hx_e();
__haxe_iterators_ArrayIterator.prototype.hasNext = function(self) 
  do return self.current < self.array.length end
end
__haxe_iterators_ArrayIterator.prototype.next = function(self) 
  do return self.array[(function() 
  local _hx_obj = self;
  local _hx_fld = 'current';
  local _ = _hx_obj[_hx_fld];
  _hx_obj[_hx_fld] = _hx_obj[_hx_fld]  + 1;
   return _;
   end)()] end
end

__haxe_iterators_ArrayKeyValueIterator.new = function(array) 
  local self = _hx_new()
  __haxe_iterators_ArrayKeyValueIterator.super(self,array)
  return self
end
__haxe_iterators_ArrayKeyValueIterator.super = function(self,array) 
  self.array = array;
end

__lua_PairTools.new = {}
__lua_PairTools.ipairsEach = function(table,func) 
  for i,v in _G.ipairs(table) do func(i,v) end;
end
__lua_PairTools.pairsEach = function(table,func) 
  for k,v in _G.pairs(table) do func(k,v) end;
end
__lua_PairTools.copy = function(table1) 
  local ret = ({});
  for k,v in _G.pairs(table1) do ret[k] = v end;
  do return ret end;
end

__nvim_helper__Native_LuaArray_Impl_.new = {}
__nvim_helper__Native_LuaArray_Impl_.fromArray = function(arr) 
  local ret = ({});
  local _g = 0;
  local _g1 = arr.length;
  while (_g < _g1) do 
    _g = _g + 1;
    local idx = _g - 1;
    ret[idx + 1] = arr[idx];
  end;
  do return ret end;
end
__nvim_helper__Native_LuaArray_Impl_.toTableArray = function(this1) 
  do return __nvim_helper__Native_Native_Fields_.native(this1) end;
end

__nvim_helper__Native_LuaObject_Impl_.new = {}
__nvim_helper__Native_LuaObject_Impl_.toTableObject = function(this1) 
  do return __nvim_helper__Native_Native_Fields_.native(this1) end;
end

__nvim_helper__Native_Native_Fields_.new = {}
__nvim_helper__Native_Native_Fields_.nativeTable = function(tableValue) 
  local tab = ({});
  __lua_PairTools.ipairsEach(tableValue, function(i,t) 
    _G.table.insert(tab, __nvim_helper__Native_Native_Fields_.native(t));
  end);
  __lua_PairTools.pairsEach(tableValue, function(k,t) 
    if (_hx_tab_array({[0]="__fields__", "length"}, 2):contains(k)) then 
      do return end;
    end;
    if (k == 0) then 
      _G.table.insert(tab, 1, t);
      do return end;
    end;
    tab[k] = __nvim_helper__Native_Native_Fields_.native(t);
  end);
  do return tab end;
end
__nvim_helper__Native_Native_Fields_.native = function(value) 
  if (_G.type(value) == "table") then 
    do return __nvim_helper__Native_Native_Fields_.nativeTable(value) end;
  end;
  do return value end;
end

__nvim_type_vim_VarAccessor.new = {}

__nvim_type_vim_api_keyset_EchoOpts.new = function(err,verbose) 
  local self = _hx_new()
  __nvim_type_vim_api_keyset_EchoOpts.super(self,err,verbose)
  return self
end
__nvim_type_vim_api_keyset_EchoOpts.super = function(self,err,verbose) 
  self.err = err;
  self.verbose = verbose;
end

__nvim_type_vim_api_keyset_UserCommand.new = function(addr,bang,bar,complete,count,desc,force,keepscript,nargs,preview,range,register) 
  local self = _hx_new()
  __nvim_type_vim_api_keyset_UserCommand.super(self,addr,bang,bar,complete,count,desc,force,keepscript,nargs,preview,range,register)
  return self
end
__nvim_type_vim_api_keyset_UserCommand.super = function(self,addr,bang,bar,complete,count,desc,force,keepscript,nargs,preview,range,register) 
  self.addr = addr;
  self.bang = bang;
  self.bar = bar;
  self.complete = complete;
  self.count = count;
  self.desc = desc;
  self.force = force;
  self.keepscript = keepscript;
  self.nargs = nargs;
  self.preview = preview;
  self.range = range;
  self.register = register;
end

__nvim_type_vim_api_keyset_create_user_command_CommandArgs.new = function(args,bang,count,fargs,line1,line2,mods,name,nargs,range,reg,smods) 
  local self = _hx_new()
  __nvim_type_vim_api_keyset_create_user_command_CommandArgs.super(self,args,bang,count,fargs,line1,line2,mods,name,nargs,range,reg,smods)
  return self
end
__nvim_type_vim_api_keyset_create_user_command_CommandArgs.super = function(self,args,bang,count,fargs,line1,line2,mods,name,nargs,range,reg,smods) 
  self.args = args;
  self.bang = bang;
  self.count = count;
  self.fargs = fargs;
  self.line1 = line1;
  self.line2 = line2;
  self.mods = mods;
  self.name = name;
  self.nargs = nargs;
  self.range = range;
  self.reg = reg;
  self.smods = smods;
end
if _hx_bit_raw then
    _hx_bit_clamp = function(v)
    if v <= 2147483647 and v >= -2147483648 then
        if v > 0 then return _G.math.floor(v)
        else return _G.math.ceil(v)
        end
    end
    if v > 2251798999999999 then v = v*2 end;
    if (v ~= v or math.abs(v) == _G.math.huge) then return nil end
    return _hx_bit_raw.band(v, 2147483647 ) - math.abs(_hx_bit_raw.band(v, 2147483648))
    end
else
    _hx_bit_clamp = function(v)
        if v < -2147483648 then
            return -2147483648
        elseif v > 2147483647 then
            return 2147483647
        elseif v > 0 then
            return _G.math.floor(v)
        else
            return _G.math.ceil(v)
        end
    end
end;



_hx_array_mt.__index = Array.prototype

local _hx_static_init = function()
  ___Settings_Settings_Fields_.defaults = ({opt = ({confirm = true, inccommand = "nosplit", hlsearch = true, cul = true, lazyredraw = true, cmdheight = 1, number = true, numberwidth = 5, hidden = true, backup = false, writebackup = false, mouse = "a", breakindent = true, undofile = true, ignorecase = true, smartcase = true, updatetime = 250, signcolumn = "yes", termguicolors = true, shiftwidth = 2, tabstop = 2, autoindent = true, smartindent = true, wrap = false, spell = false, spelllang = "en_gb", clipboard = "unnamedplus", list = true, listchars = ({eol = "↲", tab = "▸ ", trail = "·", space = "·", extends = "…", precedes = "…"}), fillchars = "foldopen:▼,foldclose:►,eob:·", scrolloff = 999, sidescrolloff = 2, guicursor = ({"a:block-blinkon0","v-ve-sm-o-r:block-blinkon1","i-c-ci-cr:ver1-blinkon1"}), foldenable = true, foldmethod = "manual", foldcolumn = "1", foldlevel = 99, foldlevelstart = 99, laststatus = 3, splitright = true, splitbelow = true, whichwrap = ({b = true, s = true, ['>'] = true, ['<'] = true, [']'] = true, ['['] = true, h = true, l = true}), completeopt = ({"menu","menuone","noselect"}), winbar = "%=%f", swapfile = false, virtualedit = "block"}), g = ({loaded_2html_plugin = 1, loaded_getscript = 1, loaded_getscriptPlugin = 1, loaded_gzip = 1, loaded_logipat = 1, loaded_netrw = 1, loaded_netrwPlugin = 1, loaded_netrwSettings = 1, loaded_netrwFileHandlers = 1, loaded_matchit = 1, loaded_tar = 1, loaded_tarPlugin = 1, loaded_rrhelper = 1, loaded_spellfile_plugin = 1, loaded_vimball = 1, loaded_vimballPlugin = 1, loaded_zip = 1, loaded_zipPlugin = 1, clipboard = (function() 
    local _hx_1
    if (vim.fn.has("wsl") == 1) then 
    _hx_1 = ({name = "WslClipboard", copy = ({['+'] = "clip.exe", ['*'] = "clip.exe"}), paste = ({['+'] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))", ['*'] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))"}), cache_enabled = 0}); else 
    _hx_1 = nil; end
    return _hx_1
  end )()}), keymap = ({leader = " ", ['buffer.next'] = "]<Tab>", ['buffer.prev'] = "[<Tab>", ['buffer.save'] = "<leader>w", ['buffer.save.all'] = "<leader>W", ['buffer.close'] = "<leader>q", ['buffer.close.delete'] = "<leader>Q", ['buffer.cursor.prev'] = "<S-h>", ['buffer.cursor.prev.big'] = "<A-S-h>", ['buffer.cursor.next'] = "<S-l>", ['buffer.cursor.next.big'] = "<A-S-l>", ['buffer.cursor.above'] = "<S-k>", ['buffer.cursor.above.big'] = "<A-S-k>", ['buffer.cursor.below'] = "<S-j>", ['buffer.cursor.below.big'] = "<A-S-j>", ['buffer.line.indent'] = "<Tab>", ['buffer.line.outdent'] = "<S-Tab>", ['buffer.line.join'] = "<leader>j", ['buffer.line.bubble.up'] = "<A-j>", ['buffer.line.bubble.down'] = "<A-k>", ['buffer.line.duplicate.up'] = "<leader>P", ['buffer.line.duplicate.down'] = "<leader>p", ['buffer.line.new.up'] = "<leader>O", ['buffer.line.new.down'] = "<leader>o", ['buffer.line.comment'] = "<leader><space>", ['buffer.word.substitute'] = "<leader>S", ['buffer.word.substitute.line'] = "<leader>s", ['buffer.jump.out'] = "<C-S-o>", ['buffer.jump.in'] = "<C-o>", ['buffer.macro.repeat.last'] = "Q", ['buffer.select.all'] = "<leader>%", ['tab.next'] = "}<Tab>", ['tab.prev'] = "{<Tab>", ['dropdown.open'] = "<C-Space>", ['dropdown.item.next'] = "<C-j>", ['dropdown.item.prev'] = "<C-k>", ['dropdown.item.confirm'] = "<CR>", ['dropdown.scroll.up'] = "<C-u>", ['dropdown.scroll.down'] = "<C-f>", ['language.lsp.hover'] = "<leader>k", ['language.lsp.signature_help'] = "<C-k>", ['language.lsp.references'] = "<leader>gr", ['language.lsp.definition'] = "<leader>gd", ['language.lsp.declaration'] = "<leader>gD", ['language.lsp.type_definition'] = "<leader>gt", ['language.lsp.implementation'] = "<leader>gi", ['language.lsp.rename'] = "<leader>r", ['language.lsp.code_action'] = "<C-Space>", ['language.diagnostic.next'] = "]d", ['language.diagnostic.prev'] = "[d", ['language.diagnostic.open'] = "<leader>d", ['language.diagnostic.list'] = "<leader>D", ['language.format'] = "<leader>b", ['find.files'] = "<leader>E", ['find.projects'] = "<C-S-e>", ['find.text_in_buffer'] = "<leader>f", ['find.text_in_directory'] = "<leader>F", ['find.about_vim'] = "<leader>?", ['find.spelling_suggestions'] = "<C-z>", ['find.buffers'] = "<C-b>", ['find.todos'] = "<leader>/", ['list.open'] = "<leader>c", ['list.close'] = "<leader>C", ['list.next'] = "]c", ['list.prev'] = "[c", ['list.item.open.vertical'] = "<C-x>", ['list.item.open.horizontal'] = "<C-S-x>", ['list.item.open.tab'] = "<C-t>", ['list.item.open.preview'] = "<leader>c", ['list.item.prev.open.preview'] = "[c", ['list.item.next.open.preview'] = "]c", ['list.navigate.first'] = "[C", ['list.navigate.last'] = "]C", ['list.item.remove'] = "<leader>d", ['list.item.keep'] = "<leader>D", ['list.search'] = "<leader>f", ['git.blame'] = "<leader>hb", ['git.diff'] = "<leader>hd", ['git.hunk.preview'] = "<leader>h", ['git.hunk.next'] = "]h", ['git.hunk.prev'] = "[h", ['git.hunk.select'] = "<leader>hv", ['git.menu'] = "<leader>H", ['github.actions'] = "<leader>G", ['github.react.tada'] = "<space>rp", ['github.react.heart'] = "<space>rh", ['github.react.eyes'] = "<space>re", ['github.react.thumbs_up'] = "<space>r+", ['github.react.thumbs_down'] = "<space>r-", ['github.react.rocket'] = "<space>rr", ['github.react.laugh'] = "<space>rl", ['github.react.confused'] = "<space>rc", ['github.comment.add'] = "<space>ca", ['github.comment.delete'] = "<space>cd", ['github.comment.next'] = "]c", ['github.comment.previous'] = "[c", ['github.suggestion.add'] = "<space>sa", ['github.review.files.focus'] = "<space>e", ['github.review.thread.next'] = "]C", ['github.review.thread.previous'] = "[C", ['github.review.files.next'] = "j", ['github.review.files.previous'] = "k", ['github.review.files.next.select'] = "]q", ['github.review.files.previous.select'] = "[q", ['github.review.files.select'] = "<Cr>", ['github.review.files.viewed.toggle'] = "<leader>b", ['github.review.files.toggle'] = "<space>b", ['github.review.files.refresh'] = "R", ['github.review.submit.approve'] = "<C-a>", ['github.review.submit.comment'] = "<C-m>", ['github.review.submit.request_changes'] = "<C-r>", ['github.review.close'] = "<C-c>", ['github.pull.checkout'] = "<space>po", ['github.pull.changes.list'] = "<space>pf", ['github.pull.diff'] = "<space>pd", ['github.pull.commits.diff'] = "<space>pc", ['github.pull.reviewer.add'] = "<space>va", ['github.pull.reviewer.remove'] = "<space>vd", ['github.pull.close'] = "<space>ic", ['github.pull.reopen'] = "<space>io", ['github.pull.refresh'] = "<C-r>", ['github.pull.open.browser'] = "<C-b>", ['github.pull.copy.url'] = "<C-y>", ['github.pull.open.file'] = "gf", ['github.pull.assignee.add'] = "<space>aa", ['github.pull.assignee.remove'] = "<space>ad", ['github.pull.label.create'] = "<space>lc", ['github.pull.label.add'] = "<space>la", ['github.pull.label.remove'] = "<space>ld", ['project.tree.node.info'] = "<leader>k", ['project.tree.node.open.vertical'] = "<C-x>", ['project.tree.node.open.horizontal'] = "<C-S-x>", ['project.tree.node.open.tab'] = "<C-t>", ['project.tree.node.collapse'] = "h", ['project.tree.node.open'] = "l", ['project.tree.node.open.system'] = "O", ['project.tree.navigate.parent'] = "H", ['project.tree.navigate.sibling.first'] = "[", ['project.tree.navigate.sibling.last'] = "]", ['project.tree.fs.enter'] = "o", ['project.tree.fs.create'] = "a", ['project.tree.fs.remove'] = "d", ['project.tree.fs.trash'] = "D", ['project.tree.fs.rename'] = "r", ['project.tree.fs.rename.full'] = "R", ['project.tree.fs.copy.node'] = "c", ['project.tree.fs.cut'] = "C", ['project.tree.fs.paste'] = "p", ['project.tree.fs.copy.filename'] = "y", ['project.tree.fs.copy.path.relative'] = "Y", ['project.tree.fs.copy.path.absolute'] = "gy", ['project.tree.refresh'] = "<C-r>", ['project.tree.collapse.all'] = "gh", ['project.tree.root.parent'] = "gk", ['project.tree.help'] = "g?", ['project.tree.toggle.filter.custom'] = "u", ['project.tree.toggle.filter.gitignore'] = "i", ['project.tree.toggle.filter.dotfiles'] = ".", ['project.tree.actions'] = "<C-Space>", ['project.tree.search.node.content'] = "<leader>f", ['project.tree.search.node'] = "/", ['project.tree.close'] = "q", ['project.tree.toggle'] = "<leader>e", ['window.cursor.left'] = "<C-h>", ['window.cursor.down'] = "<C-j>", ['window.cursor.up'] = "<C-k>", ['window.cursor.right'] = "<C-l>", ['window.cursor.next'] = "<C-n>", ['window.cursor.prev'] = "<C-S-n>", ['window.swap.next'] = "<C-;>", ['window.shrink.horizontal'] = "<C-A-j>", ['window.shrink.vertical'] = "<C-A-h>", ['window.expand.vertical'] = "<C-A-l>", ['window.expand.horizontal'] = "<C-A-k>", ['window.fullwidth.bottom'] = "<C-S-j>", ['window.fullheight.left'] = "<C-S-h>", ['window.fullheight.right'] = "<C-S-l>", ['window.fullwidth.top'] = "<C-S-k>", ['window.equalize'] = "<C-=>", ['window.maximize'] = "<C-+>", ['window.split.horizontal'] = "<C-S-x>", ['window.split.vertical'] = "<C-x>", ['terminal.next'] = "]t", ['terminal.prev'] = "[t", ['terminal.open'] = "<leader>t", ['terminal.menu'] = "<leader>T"}), config = ({macro = ({escapeCharacters = ({"\"","'"}), saved = ({})}), language = ({}), ['language.diagnostics.update_in_insert'] = false, ['language.diagnostics.severity_sort'] = true, ['theme.colorscheme'] = "edge", ['icon.section.right'] = " ▟", ['icon.section.left'] = "▙ ", ['icon.component.right'] = " ", ['icon.component.left'] = " ", ['terminal.jobs'] = _hx_tab_array({}, 0)})});
  
  
end

_hx_funcToField = function(f)
  if type(f) == 'function' then
    return function(self,...)
      return f(...)
    end
  else
    return f
  end
end

_hx_table = {}
_hx_table.pack = _G.table.pack or function(...)
    return {...}
end
_hx_table.unpack = _G.table.unpack or _G.unpack
_hx_table.maxn = _G.table.maxn or function(t)
  local maxn=0;
  for i in pairs(t) do
    maxn=type(i)=='number'and i>maxn and i or maxn
  end
  return maxn
end;

_hx_wrap_if_string_field = function(o, fld)
  if _G.type(o) == 'string' then
    if fld == 'length' then
      return _G.string.len(o)
    else
      return String.prototype[fld]
    end
  else
    return o[fld]
  end
end

_hx_static_init();
return _hx_exports
