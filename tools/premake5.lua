project "ktxtools"
    kind "StaticLib"
    language "C++"
    cppdialect "C++latest"
    systemversion "latest"
    warnings "Off"
         
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    defines {
        "LIBKTX_VERSION_FULL",
        "LIBKTX_FEATURE_KTX2",
        "KTX_FEATURE_WRITE",
        "KHRONOS_STATIC",
        "FMT_UNICODE",
        "BASISD_SUPPORT_KTX2_ZSTD=1",
        "BASISU_SUPPORT_SSE=1",
        "BASISU_SUPPORT_OPENCL=1",
        "_LARGEFILE64_SOURCE=1",
        "_FILE_OFFSET_BITS=64", 
    }  
    
    disablewarnings  { 
        "4828",
    }  
        
    files { 
        "ktx/command.cpp",
        "ktx/command.h",
        --"ktx/command_compare.cpp",
        --"ktx/command_convert.cpp",
        "ktx/command_create.cpp",
        --"ktx/command_deflate.cpp",
        --"ktx/command_encode.cpp",
        --"ktx/command_extract.cpp",
        --"ktx/command_help.cpp",
        --"ktx/command_info.cpp",
        --"ktx/command_transcode.cpp",
        --"ktx/command_validate.cpp",
        "ktx/deflate_utils.h",
        "ktx/encode_utils_astc.h",
        "ktx/encode_utils_basis.h",
        "ktx/encode_utils_common.h",
        "ktx/format_descriptor.h",
        "ktx/formats.h",
        "ktx/fragment_uri.h",
        --"ktx/ktx_main.cpp",
        "ktx/metrics_utils.h",
        "ktx/transcode_utils.cpp",
        "ktx/transcode_utils.h",
        "ktx/utility.h",
        "ktx/validate.cpp",
        "ktx/validate.h",
        "ktx/validation_messages.h",
        "../lib/src/glformat_str.c",
        
        "imageio/formatdesc.h", 
        "imageio/image.hpp",
        "imageio/imagecodec.hpp",
        "imageio/imagespan.hpp",
        "imageio/imageinput.cc",
        "imageio/imageio.cc",
        "imageio/imageio.h",
        "imageio/imageio_utility.h",
        "imageio/imageoutput.cc",
        "imageio/exr.imageio/exrinput.cc",
        "imageio/jpg.imageio/jpginput.cc",
        "imageio/npbm.imageio/npbminput.cc",
        "imageio/png.imageio/pnginput.cc",
        "imageio/png.imageio/pngoutput.cc", 
        
        "../external/astc-encoder/Source/ThirdParty/tinyexr.h", 
        "../external/lodepng/lodepng.cpp", 
        "../external/lodepng/lodepng.h", 
        
        --"../external/fmt/src/fmt.cc",    
        "../external/fmt/src/format.cc",    
        --"../external/fmt/src/os.cc",    
    }
    
    includedirs {
        "../lib",
        "../lib/src",
        "../lib/include",
        "../external/dfdutils", 
        "../external/ba",  
        "../external/fmt/include",   
        "../external/lodepng",   
        "../external/astc-encoder/Source/ThirdParty",   
        "../external/cxxopts/include",   
        "../external", 
        "../external/basis_universal",
        "../external/basis_universal/zstd",
        "../external/basis_universal/encoder",
        "../external/basis_universal/transcoder",
        "../external/basis_universal/OpenCL",
        "../other_include",
        "../utils",
        "imageio", 
    }  
     
    links {
        "libktx",
    } 
    
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"
    
    filter "configurations:Release"
        runtime "Release"
        optimize "on"   