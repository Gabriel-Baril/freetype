project "freetype"
	kind "StaticLib"
	language "C++"

    targetdir (bin_dir .. output_dir .. "/%{prj.name}")      -- Output dir for our binaries (.exe, .lib, .dll ...)
    objdir    (bin_int_dir  .. output_dir .. "/%{prj.name}") -- Output dir for our object file (.obj)

	files
	{
		"src/**.h",
		"src/**.cpp",
		"src/**.c",
		"include/**.h"
	}

	removefiles 
	{ 
		"src/gzip/infblock.c",
		"src/gzip/infcodes.c",
		"src/gzip/infcodes.h",
		"src/gzip/inflate.c",
		"src/lzw/ftzopen.h",
		"src/lzw/ftzopen.c",
		"src/tools/ftrandom/ftrandom.c",
		"src/base/ftbase.c",
		"src/autofit/autofit.c",
		"src/pshinter/pshinter.c"
	}

	includedirs
	{
		"include"
	}

	defines 
    {
        "FT2_BUILD_LIBRARY"
    }


	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "Off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "Off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
