add_defines('TAGLIB_STATIC')
add_includedirs('taglib/taglib', unpack(os.dirs('taglib/taglib/**')))
add_includedirs('$(buildir)')

target('taglib')
  set_kind('static')
  before_build(function(target)
    os.cp('taglib/taglib/taglib_config.h.cmake', '$(buildir)/taglib_config.h')
  end)
  add_files('taglib/taglib/**.cpp')
  add_includedirs('taglib/3rdparty')

target('ncmdump')
  set_kind('binary')
  set_default(true)
  add_files('*.cpp')
  add_deps('taglib')

