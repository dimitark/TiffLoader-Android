LOCAL_PATH := $(call my-dir)

########################################################### libjpeg
include $(CLEAR_VARS)

LOCAL_MODULE := libjpeg
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/jpeg/include/
LOCAL_ARM_MODE := arm

ifeq ($(TARGET_ARCH),arm)
	LOCAL_SRC_FILES := jpeg/lib/libjpeg.a
else
	ifeq ($(TARGET_ARCH),x86)
		LOCAL_SRC_FILES := jpeg/lib/libjpeg-x86.a
	endif
endif

include $(PREBUILT_STATIC_LIBRARY)

########################################################### libtiff

include $(CLEAR_VARS)

LOCAL_MODULE:= libtiff
LOCAL_ARM_MODE := arm

LOCAL_TIFF_SRC_FILES := \
	tiff/libtiff/tif_dirread.c \
	tiff/libtiff/tif_zip.c \
	tiff/libtiff/tif_flush.c \
	tiff/libtiff/tif_next.c \
	tiff/libtiff/tif_ojpeg.c \
	tiff/libtiff/tif_dirwrite.c \
	tiff/libtiff/tif_dirinfo.c \
	tiff/libtiff/tif_dir.c \
	tiff/libtiff/tif_compress.c \
	tiff/libtiff/tif_close.c \
	tiff/libtiff/tif_tile.c \
	tiff/libtiff/tif_open.c \
	tiff/libtiff/tif_getimage.c \
	tiff/libtiff/tif_pixarlog.c \
	tiff/libtiff/tif_warning.c \
	tiff/libtiff/tif_dumpmode.c \
	tiff/libtiff/tif_jpeg.c \
	tiff/libtiff/tif_jbig.c \
	tiff/libtiff/tif_predict.c \
	tiff/libtiff/mkg3states.c \
	tiff/libtiff/tif_write.c \
	tiff/libtiff/tif_error.c \
	tiff/libtiff/tif_version.c \
	tiff/libtiff/tif_print.c \
	tiff/libtiff/tif_color.c \
	tiff/libtiff/tif_read.c \
	tiff/libtiff/tif_extension.c \
	tiff/libtiff/tif_thunder.c \
	tiff/libtiff/tif_lzw.c \
	tiff/libtiff/tif_fax3.c \
	tiff/libtiff/tif_luv.c \
	tiff/libtiff/tif_codec.c \
	tiff/libtiff/tif_unix.c \
	tiff/libtiff/tif_packbits.c \
	tiff/libtiff/tif_aux.c \
	tiff/libtiff/tif_fax3sm.c \
	tiff/libtiff/tif_swab.c \
	tiff/libtiff/tif_strip.c \
	tiff/port/lfind.c

LOCAL_SRC_FILES:= $(LOCAL_TIFF_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/tiff/libtiff

LOCAL_CFLAGS += -DAVOID_TABLES 
LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays
LOCAL_LDLIBS := -lz
LOCAL_STATIC_LIBRARIES = libjpeg

include $(BUILD_SHARED_LIBRARY)

###############################################################
include $(CLEAR_VARS)

LOCAL_MODULE := tifffactory
LOCAL_CFLAGS := -DANDROID_NDK

LOCAL_SRC_FILES := \
	TiffLoader.cpp \
	TiffImage.cpp

LOCAL_LDLIBS := -ldl -llog -ljnigraphics
LOCAL_LDFLAGS +=-ljnigraphics

LOCAL_SHARED_LIBRARIES := tiff
include $(BUILD_SHARED_LIBRARY)
