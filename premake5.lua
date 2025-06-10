workspace "LearnVulkan"
    architecture "x64"

    configurations {
        "Debug",
        "Release"
    }

-- Directory final files will be placed into
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "LearnVulkan" -- Main project