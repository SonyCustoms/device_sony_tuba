#
# Copyright (C) 2016 fire855 <thefire855@gmail.com>
# Copyright (C) 2017 Maxim <hqdevnews@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libtuba
LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
    inet.c \
    tuba_audio.cpp \
    tuba_bionic.cpp \
    tuba_gui.cpp \
    tuba_omx.cpp \
    tuba_ui.cpp \
    tuba_wvm.cpp \
    tuba_wifi.cpp \
    tuba_xlog.cpp

# only for 64bit libraries
LOCAL_SRC_FILES_64 := tuba_parcel.cpp

LOCAL_SHARED_LIBRARIES := libbinder libc liblog libgui libui libicuuc libicui18n libmedia
include $(BUILD_SHARED_LIBRARY)
