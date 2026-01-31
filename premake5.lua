project "libktx"
    kind "StaticLib"
    language "C++"
    cppdialect "C++latest"
    systemversion "latest"
    warnings "Off"
         
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    defines {
        "LIBKTX",
        "LIBKTX_VERSION_FULL",
        "LIBKTX_FEATURE_KTX2",
        "KTX_FEATURE_WRITE",
        "KHRONOS_STATIC",
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
        "lib/include/KHR/khr_df.h",
        "lib/include/ktx.h",
        "lib/src/astc_codec.cpp",
        "lib/src/basis_sgd.h",
        "lib/src/basis_transcode.cpp",
        "lib/src/basis_encode.cpp",
        "lib/src/miniz_wrapper.cpp",
        "lib/src/checkheader.c",
        "external/dfdutils/createdfd.c",
        "external/dfdutils/colourspaces.c",
        "external/dfdutils/dfd.h",
        "external/dfdutils/interpretdfd.c",
        "external/dfdutils/printdfd.c",
        "external/dfdutils/queries.c",
        "external/dfdutils/vk2dfd.c",
        "external/dfdutils/vk2dfd.inl",
        "external/dfdutils/vulkan/vk_platform.h",
        "external/dfdutils/vulkan/vulkan_core.h",
        "lib/src/etcunpack.cxx",
        "lib/src/filestream.c",
        "lib/src/filestream.h",
        "lib/src/formatsize.h",
        "lib/src/gl_format.h",
        "lib/src/glformat_str.c",
        "lib/src/hashlist.c",
        "lib/src/info.c",
        "lib/src/ktxint.h",
        "lib/src/memstream.c",
        "lib/src/memstream.h",
        "lib/src/strings.c",
        "lib/src/swap.c",
        "lib/src/texture.c",
        "lib/src/texture.h",
        "lib/src/texture1.c",
        "lib/src/texture1.h",
        "lib/src/texture2.c",
        "lib/src/texture2.h",
        "lib/src/texture_funcs.inl",
        "lib/src/uthash.h",
        "lib/src/vk2gl.h",
        "lib/src/vk_format.h",
        "lib/src/vkFormat2glFormat.inl",
        "lib/src/vkFormat2glInternalFormat.inl",
        "lib/src/vkFormat2glType.inl",
        "lib/src/vkformat_check.c",
        "lib/src/vkformat_check_variant.c",
        "lib/src/vkformat_enum.h",
        "lib/src/vkformat_str.c",
        "lib/src/vkformat_typesize.c",
        "lib/src/writer1.c",
        "lib/src/writer2.c",
        "utils/unused.h",
        "external/astc-encoder/Source/astcenc_averages_and_directions.cpp",
        "external/astc-encoder/Source/astcenc_block_sizes.cpp",
        "external/astc-encoder/Source/astcenc_color_quantize.cpp",
        "external/astc-encoder/Source/astcenc_color_unquantize.cpp",
        "external/astc-encoder/Source/astcenc_compress_symbolic.cpp",
        "external/astc-encoder/Source/astcenc_compute_variance.cpp",
        "external/astc-encoder/Source/astcenc_decompress_symbolic.cpp",
        "external/astc-encoder/Source/astcenc_diagnostic_trace.cpp",
        "external/astc-encoder/Source/astcenc_entry.cpp",
        "external/astc-encoder/Source/astcenc_find_best_partitioning.cpp",
        "external/astc-encoder/Source/astcenc_ideal_endpoints_and_weights.cpp",
        "external/astc-encoder/Source/astcenc_image.cpp",
        "external/astc-encoder/Source/astcenc_integer_sequence.cpp",
        "external/astc-encoder/Source/astcenc_mathlib.cpp",
        "external/astc-encoder/Source/astcenc_mathlib_softfloat.cpp",
        "external/astc-encoder/Source/astcenc_partition_tables.cpp",
        "external/astc-encoder/Source/astcenc_percentile_tables.cpp",
        "external/astc-encoder/Source/astcenc_pick_best_endpoint_format.cpp",
        "external/astc-encoder/Source/astcenc_quantization.cpp",
        "external/astc-encoder/Source/astcenc_symbolic_physical.cpp",
        "external/astc-encoder/Source/astcenc_weight_align.cpp",
        "external/astc-encoder/Source/astcenc_weight_quant_xfer_tables.cpp",
        
        "external/basis_universal/encoder/**.cpp",
        "external/basis_universal/encoder/**.h",
        "external/basis_universal/encoder/**.hpp",
        "external/basis_universal/encoder/3rdparty/**.cpp",
        "external/basis_universal/encoder/3rdparty/**.h",
        "external/basis_universal/transcoder/**.cpp",
        "external/basis_universal/transcoder/**.h",
        "external/basis_universal/zstd/zstd.c",   
    }
    
    includedirs {
        "lib",
        "lib/include",
        "external/dfdutils", 
        "external/ba",  
        "external", 
        "other_include",
        "utils",
        "external/basis_universal",
        "external/basis_universal/zstd",
        "external/basis_universal/encoder",
        "external/basis_universal/transcoder",
        "external/basis_universal/OpenCL", 
    }  
    
    libdirs { "external/basis_universal/OpenCL/lib" } 
    
    links {
        "Pathcch",
        "OpenCL64.lib"
    } 
    
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"
    
    filter "configurations:Release"
        runtime "Release"
        optimize "on"  
        
include "tools" 