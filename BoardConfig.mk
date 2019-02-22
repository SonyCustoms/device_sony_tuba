#
# Copyright (C) 2016 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_BOARD_PLATFORM := mt6755

DEVICE_PATH := device/sony/tuba

MTK_PROJECT_CONFIG ?= $(DEVICE_PATH)/ProjectConfig.mk
include $(MTK_PROJECT_CONFIG)

MTK_INTERNAL_CDEFS := $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),$(foreach v,$(shell echo $($(t)) | tr '[a-z]' '[A-Z]'),-D$(v))))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)=\"$($(t))\"))

BOARD_GLOBAL_CFLAGS += $(MTK_INTERNAL_CDEFS)
BOARD_GLOBAL_CPPFLAGS += $(MTK_INTERNAL_CDEFS)

# Kernel informations
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 enforcing=0 androidboot.selinux=permissive loglevel=8
BOARD_MKBOOTIMG_ARGS := --board 1465391499 --ramdisk_offset 0x04f88000 --second_offset 0x00e88000 --tags_offset 0x03f88000

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# Kernel properties
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

TARGET_KERNEL_SOURCE := kernel/sony/tuba
TARGET_KERNEL_CONFIG := tuba_defconfig


TARGET_BOOTLOADER_BOARD_NAME := tuba

#BB
BUSYBOX_CONFIG:=full
BUSYBOX_SUFFIX:=static

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

WITH_SU := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
#BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_CACHEIMAGE_PARTITION_SIZE := 444596224
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2793406464
#BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 27468479488
BOARD_FLASH_BLOCK_SIZE := 131072

# TWRP
DEVICE_RESOLUTION := 720x1280
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1280
TW_THEME := portrait_hdpi

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

BLOCK_BASED_OTA := false

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

BOARD_FLASH_BLOCK_SIZE := 4096

# FSTAB
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.mt6755

# Audio
BOARD_USES_MTK_AUDIO := true

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := 0
BOARD_CONNECTIVITY_MODULE := conn_soc

# init
TARGET_PROVIDES_INIT_RC := true

# Display
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 1
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.5.0

# Mediatek support
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true

# Media
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_OMX_LEGACY_RESCALING := true

# GPS
BOARD_GPS_LIBRARIES := true
BOARD_MEDIATEK_USES_GPS := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true

#RIL
#BOARD_RIL_CLASS := ../../../device/sony/tuba/ril
BOARD_GLOBAL_CFLAGS += -DUSE_RIL_VERSION_13
BOARD_GLOBAL_CPPFLAGS += -DUSE_RIL_VERSION_13

# Sensors
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
BOARD_SECCOMP_POLICY := $(DEVICE_PATH)/seccomp
#POLICYVERS := 29

# Wireless
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# Release Tools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Misc
EXTENDED_FONT_FOOTPRINT := true

#optimizations
MALLOC_SVELTE := true

# TWRP
TW_DEFAULT_BRIGHTNESS := 80
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_DEVICE_VERSION := 0
RECOVERY_SDCARD_ON_DATA := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness/
TW_INCLUDE_CRYPTO := true
TW_USE_TOOLBOX := true
TWRP_INCLUDE_LOGCAT := true
TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_CUSTOM_BATTERY_PATH := "/sys/class/power_supply/battery"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"
TWHAVE_SELINUX := true

# Crypto
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/userdata" 
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_KEY_LOC := "footer"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,data =ordered"
TW_INCLUDE_L_CRYPTO := true

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Time Zone data for Recovery
PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
