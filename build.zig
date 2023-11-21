const std = @import("std");
const version = "3.100";

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "mp3lame",
        .target = target,
        .optimize = optimize,
    });
    const t = lib.target_info.target;

    const config_header = b.addConfigHeader(.{
        .style = .{ .autoconf = .{ .path = "config.h.in" } },
    }, .{
        .ABORTFP = null,
        .AC_APPLE_UNIVERSAL_BUILD = null,
        .CRAY_STACKSEG_END = null,
        .C_ALLOCA = null,
        .DEBUG = null,
        .DECODE_ON_THE_FLY = 1,
        .FLOAT = null,
        .HAVE_ALLOCA = 1,
        .HAVE_ALLOCA_H = 1,
        .HAVE_DLFCN_H = 1,
        .HAVE_EFENCE = null,
        .HAVE_ERRNO_H = 1,
        .HAVE_FCNTL_H = 1,
        .HAVE_GETTIMEOFDAY = 1,
        .HAVE_ICONV = null,
        .HAVE_IEEE754_FLOAT32_T = null,
        .HAVE_IEEE754_FLOAT64_T = null,
        .HAVE_IEEE854_FLOAT80 = have(t.c_type_bit_size(.longdouble) == 80),
        .HAVE_IEEE854_FLOAT80_T = null,
        .HAVE_INT16_T = 1,
        .HAVE_INT32_T = 1,
        .A_INT32_T = .int32_t,
        .HAVE_INT64_T = 1,
        .A_INT64_T = .int64_t,
        .HAVE_INT8_T = 1,
        .HAVE_INTTYPES_H = 1,
        .HAVE_LIMITS_H = 1,
        .HAVE_LINUX_SOUNDCARD_H = null,
        .HAVE_LONG_DOUBLE = 1,
        .HAVE_LONG_DOUBLE_WIDER = have(t.c_type_bit_size(.longdouble) > t.c_type_bit_size(.double)),
        .HAVE_MEMORY_H = 1,
        .HAVE_MPGLIB = 1,
        .HAVE_NASM = null,
        .HAVE_NCURSES_TERMCAP_H = null,
        .HAVE_SOCKET = 1,
        .HAVE_STDINT_H = 1,
        .HAVE_STDLIB_H = 1,
        .HAVE_STRINGS_H = 1,
        .HAVE_STRING_H = 1,
        .HAVE_STRTOL = 1,
        .HAVE_SYS_SOUNDCARD_H = 1,
        .HAVE_SYS_STAT_H = 1,
        .HAVE_SYS_TIME_H = 1,
        .HAVE_SYS_TYPES_H = 1,
        .HAVE_TERMCAP = null,
        .HAVE_TERMCAP_H = null,
        .HAVE_UINT16_T = 1,
        .HAVE_UINT32_T = 1,
        .A_UINT32_T = .uint32_t,
        .HAVE_UINT64_T = 1,
        .A_UINT64_T = .uint64_t,
        .HAVE_UINT8_T = 1,
        .HAVE_UNISTD_H = 1,
        .HAVE_XMMINTRIN_H = have(switch (t.cpu.arch) {
            .x86, .x86_64 => true,
            else => false,
        }),
        .ICONV_CONST = {},
        .LAME_LIBRARY_BUILD = 1,
        .LIBSNDFILE = null,
        .LT_OBJDIR = ".libs/",
        .MMX_choose_table = null,
        .NOANALYSIS = null,
        .PACKAGE = "lame",
        .PACKAGE_BUGREPORT = "lame-dev@lists.sf.net",
        .PACKAGE_NAME = "lame",
        .PACKAGE_STRING = "lame " ++ version,
        .PACKAGE_TARNAME = "lame",
        .PACKAGE_URL = "https://lame.sourceforge.io/",
        .PACKAGE_VERSION = version,
        .SIZEOF_DOUBLE = t.c_type_byte_size(.double),
        .SIZEOF_FLOAT = t.c_type_byte_size(.float),
        .SIZEOF_INT = t.c_type_byte_size(.int),
        .SIZEOF_LONG = t.c_type_byte_size(.long),
        .SIZEOF_LONG_DOUBLE = t.c_type_byte_size(.longdouble),
        .SIZEOF_LONG_LONG = t.c_type_byte_size(.longlong),
        .SIZEOF_SHORT = t.c_type_byte_size(.short),
        .SIZEOF_UNSIGNED_INT = t.c_type_byte_size(.uint),
        .SIZEOF_UNSIGNED_LONG = t.c_type_byte_size(.ulong),
        .SIZEOF_UNSIGNED_LONG_LONG = t.c_type_byte_size(.ulonglong),
        .SIZEOF_UNSIGNED_SHORT = t.c_type_byte_size(.ushort),
        .STACK_DIRECTION = null,
        .STDC_HEADERS = 1,
        .TAKEHIRO_IEEE754_HACK = 1,
        .TIME_WITH_SYS_TIME = 1,
        .USE_FAST_LOG = 1,
        ._ALL_SOURCE = 1,
        ._GNU_SOURCE = 1,
        ._POSIX_PTHREAD_SEMANTICS = 1,
        ._TANDEM_SOURCE = 1,
        .__EXTENSIONS__ = 1,
        .WORDS_BIGENDIAN = have(t.cpu.arch.endian() == .big),
        .VERSION = version,
        .WITH_DMALLOC = null,
        ._FILE_OFFSET_BITS = null,
        ._LARGE_FILES = null,
        ._MINIX = null,
        ._POSIX_1_SOURCE = null,
        ._POSIX_SOURCE = null,
        .__DECALPHA__ = null,
        .__NO_MATH_INLINES = null,
        .@"const" = null,
        .@"inline" = null,
        .size_t = null,
    });
    lib.addConfigHeader(config_header);
    lib.addIncludePath(.{ .path = "include" });
    lib.addIncludePath(.{ .path = "libmp3lame" });
    lib.addIncludePath(.{ .path = "mpglib" });
    lib.addCSourceFiles(.{
        .files = &.{
            "libmp3lame/VbrTag.c",
            "libmp3lame/bitstream.c",
            "libmp3lame/encoder.c",
            "libmp3lame/fft.c",
            "libmp3lame/gain_analysis.c",
            "libmp3lame/id3tag.c",
            "libmp3lame/lame.c",
            "libmp3lame/mpglib_interface.c",
            "libmp3lame/newmdct.c",
            "libmp3lame/presets.c",
            "libmp3lame/psymodel.c",
            "libmp3lame/quantize.c",
            "libmp3lame/quantize_pvt.c",
            "libmp3lame/reservoir.c",
            "libmp3lame/set_get.c",
            "libmp3lame/tables.c",
            "libmp3lame/takehiro.c",
            "libmp3lame/util.c",
            "libmp3lame/vbrquantize.c",
            "libmp3lame/vector/xmm_quantize_sub.c",
            "libmp3lame/version.c",

            "mpglib/common.c",
            "mpglib/dct64_i386.c",
            "mpglib/decode_i386.c",
            "mpglib/interface.c",
            "mpglib/layer1.c",
            "mpglib/layer2.c",
            "mpglib/layer3.c",
            "mpglib/tabinit.c",
        },
        .flags = &.{
            "-DHAVE_CONFIG_H",
        },
    });
    lib.linkLibC();
    lib.installHeadersDirectory("include", "lame");
    b.installArtifact(lib);
}

fn have(condition: bool) ?c_int {
    if (condition) {
        return 1;
    } else {
        return null;
    }
}
