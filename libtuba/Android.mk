LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_INCLUDE_LIBTUBA),true)
    include $(CLEAR_VARS)
    LOCAL_MODULE := libtuba
    LOCAL_MODULE_TAGS := optional
    LOCAL_SHARED_LIBRARIES := libbinder libc liblog libicuuc libicui18n libmedia libgui libui libutils
    LOCAL_SRC_FILES := \
        tuba_audio.cpp \
        tuba_omx.cpp \
        tuba_xlog.c \
        tuba_sensor.cpp \
        tuba_gui.cpp
include $(BUILD_SHARED_LIBRARY)
endif
