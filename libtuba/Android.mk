LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_INCLUDE_LIBTUBA),true)
    include $(CLEAR_VARS)
    LOCAL_MODULE := libtuba
    LOCAL_PROPRIETARY_MODULE := true
    LOCAL_SHARED_LIBRARIES := libbinder libc liblog libgui libui libicuuc libicui18n libmedia
    LOCAL_SRC_FILES := \
        tuba_audio.cpp \
        tuba_gui.cpp \
        tuba_omx.cpp \
        tuba_ui.cpp \
        tuba_xlog.c \
        tuba_sensor.cpp
include $(BUILD_SHARED_LIBRARY)
endif


