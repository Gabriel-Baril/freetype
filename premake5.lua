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
