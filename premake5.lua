project "freetype"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

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
		"src/Izw/ftzopen.h",
		"src/Izw/ftzopen.c",
		"src/tools/ftrandom/ftrandom.c"
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
