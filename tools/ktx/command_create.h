#pragma once
#include "deflate_utils.h"
#include "encode_utils_astc.h"
#include "encode_utils_basis.h"
#include "encode_utils_common.h"
#include "format_descriptor.h"
#include "metrics_utils.h"

namespace ktx {
struct OptionsCreate {
    inline static const char* kFormat = "format";
    inline static const char* k1D = "1d";
    inline static const char* kCubemap = "cubemap";
    inline static const char* kRaw = "raw";
    inline static const char* kWidth = "width";
    inline static const char* kHeight = "height";
    inline static const char* kDepth = "depth";
    inline static const char* kLayers = "layers";
    inline static const char* kLevels = "levels";
    inline static const char* kRuntimeMipmap = "runtime-mipmap";
    inline static const char* kGenerateMipmap = "generate-mipmap";
    inline static const char* kEncode = "encode";
    inline static const char* kNormalize = "normalize";
    inline static const char* kSwizzle = "swizzle";
    inline static const char* kInputSwizzle = "input-swizzle";
    inline static const char* kAssignOetf = "assign-oetf";
    inline static const char* kAssignTf = "assign-tf";
    inline static const char* kAssignPrimaries = "assign-primaries";
    inline static const char* kAssignTexcoordOrigin = "assign-texcoord-origin";
    inline static const char* kConvertOetf = "convert-oetf";
    inline static const char* kConvertTf = "convert-tf";
    inline static const char* kConvertPrimaries = "convert-primaries";
    inline static const char* kConvertTexcoordOrigin = "convert-texcoord-origin";
    inline static const char* kFailOnColorConversions = "fail-on-color-conversions";
    inline static const char* kWarnOnColorConversions = "warn-on-color-conversions";
    inline static const char* kNoWarnOnColorConversions = "no-warn-on-color-conversions";
    inline static const char* kFailOnOriginChanges = "fail-on-origin-changes";
    inline static const char* kWarnOnOriginChanges = "warn-on-origin-changes";
    inline static const char* kMipmapFilter = "mipmap-filter";
    inline static const char* kMipmapFilterScale = "mipmap-filter-scale";
    inline static const char* kMipmapWrap = "mipmap-wrap";
    inline static const char* kScale = "scale";
    inline static const char* kPremultiplyAlpha = "premultiply-alpha";

    bool _1d = false;
    bool cubemap = false;

    VkFormat vkFormat = VK_FORMAT_UNDEFINED;
    FormatDescriptor formatDesc;
    bool raw = false;

    std::optional<uint32_t> width;
    std::optional<uint32_t> height;
    std::optional<uint32_t> depth;
    std::optional<uint32_t> layers;
    std::optional<uint32_t> levels;

    bool mipmapRuntime = false;
    bool mipmapGenerate = false;
    std::optional<std::string> mipmapFilter;
    std::string defaultMipmapFilter = "lanczos4";
    std::optional<float> mipmapFilterScale;
    float defaultMipmapFilterScale = 1.0f;
    std::optional<basisu::Resampler::Boundary_Op> mipmapWrap;
    basisu::Resampler::Boundary_Op defaultMipmapWrap = basisu::Resampler::Boundary_Op::BOUNDARY_WRAP;
    std::optional<std::string> swizzle; /// Sets KTXswizzle
    std::optional<std::string> swizzleInput; /// Used to swizzle the input image data

    std::optional<float> imageScale;

    std::optional<khr_df_transfer_e> convertTF = {};
    std::optional<khr_df_transfer_e> assignTF = {};
    std::optional<khr_df_primaries_e> assignPrimaries = {};
    std::optional<khr_df_primaries_e> convertPrimaries = {};
    std::optional<ImageSpec::Origin> assignTexcoordOrigin;
    std::optional<ImageSpec::Origin> convertTexcoordOrigin;
    bool failOnColorConversions = false;
    bool warnOnColorConversions = false;
    bool noWarnOnColorConversions = false;
    bool failOnOriginChanges = false;
    bool warnOnOriginChanges = false;
    bool normalize = false;
    bool premultiplyAlpha = false;
};

using CreateCommandOptions = Combine<
    OptionsCreate,
    OptionsEncodeASTC,
    OptionsEncodeBasis<false>,
    OptionsEncodeCommon,
    OptionsDeflate,
    OptionsMultiInSingleOut>;


CreateCommandOptions createFromArgs(int argc, char* argv[]);

class CommandCreate {
public:
    CommandCreate(const CreateCommandOptions& options);
    ~CommandCreate();

    KTXTexture2 execute();
    const std::string& getWarnings() const;
    const std::string& getErrors() const;
private:
    class CommandCreateImpl;
    std::unique_ptr<CommandCreateImpl> m_Impl;
};


}