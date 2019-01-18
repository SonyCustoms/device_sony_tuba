$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/sony/tuba/device.mk)

$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Release name
PRODUCT_RELEASE_NAME := XA

PRODUCT_DEVICE := tuba
PRODUCT_NAME := full_tuba
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia XA
PRODUCT_MANUFACTURER := Sony
PRODUCT_RESTRICT_VENDOR_FILES := false
