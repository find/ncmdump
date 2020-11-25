local taglibdirs = (function(t)
  local r={}
  for _,v in ipairs(t) do
    local s=string.gsub(v, '\\', '/')
    --print('--'..s..'--')
    table.insert(r, s)
  end
  return r
end)(os.dirs('taglib/taglib/**'))
--for i,v in ipairs(taglibdirs) do print(i,type(v),v) end

add_defines('TAGLIB_STATIC')
target('taglib')
  set_kind('static')
  before_build(function(target)
    os.cp('taglib/taglib/taglib_config.h.cmake', '$(buildir)/taglib_config.h')
  end)
  add_files('taglib/taglib/**.cpp')
  add_includedirs('taglib/taglib', unpack(taglibdirs))
  add_includedirs('taglib/3rdparty')
  add_includedirs('$(buildir)')

target('ncmdump')
  set_kind('binary')
  set_default(true)
  add_files('*.cpp')
  add_includedirs('taglib/taglib', unpack(taglibdirs))
  add_includedirs('$(buildir)')
  add_deps('taglib')

