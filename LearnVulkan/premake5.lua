project "LearnVulkan"
    kind "ConsoleApp"
    language "C++"

-- Output Directories ===============
    rootdir = "../"
    targetdir (rootdir .. "bin/" .. outputdir .. "/%{prj.name}")
    objdir (rootdir .. "bin-int/" .. outputdir .. "/%{prj.name}")

    -- Include all c/c++ files in project
    files {
        "src/**.c",
        "src/**.h",
        "src/**.cpp",
        "src/**.hpp"
    }

    includedirs {
        "src",
        rootdir .. "Vendor/GLFW/GLFW/include",
        rootdir .. "Vendor/GLM/GLM",
        rootdir..  "Vendor/Vulkan/Vulkan/include"
    }

-- Link libraries ===================
    libdirs {
        rootdir .. "Vendor/Vulkan/Vulkan/lib"
    }
    links {
        "GLFW",
        --rootdir .. "Vendor/Vulkan/Vulkan/lib/**.lib"
        "vulkan-1.lib"
    }

-- Windows ==========================
    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines {
            "PLATFORM_WINDOWS"
        }

-- Configuations ====================
    filter "configurations:Debug"
        defines "DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "RELEASE"
        optimize "On"