location_dir = "./"

include(location_dir .. "conanbuildinfo.premake.lua")

workspace("nanovg")
	location(location_dir)
	configurations { conan_build_type }
	architecture(conan_arch)

	project("nanovg")
		kind "StaticLib"
		language "C++"
		cppdialect "C++17"
		targetdir = location_dir .. "bin/%{cfg.buildcfg}"

		files{
			"src/*",
		}

		includedirs{
			conan_includedirs
		}

		libdirs{conan_libdirs}
		links{conan_libs, "OpenGL32.lib"}
		defines{conan_cppdefines, "FONS_USE_FREETYPE"}
		bindirs{conan_bindirs}

		filter "configurations:Debug"
			defines { "DEBUG" }
			symbols "On"

		filter "configurations:Release"
			defines { "NDEBUG" }
			optimize "On"