#
# Copyright (C) 2021-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from phoenix device
$(call inherit-product, device/xiaomi/phoenix/device.mk)

# Include Rom config
include device/xiaomi/phoenix/rom_config.mk

# Inherit some common lineage stuff.
$(call inherit-product, vendor/$(VENDOR_TARGET_DIR)/config/common_full_phone.mk)

TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_OMX_SERVICE := false
TARGET_ENABLE_BLUR := true
BYPASS_CHARGE_SUPPORTED  := true

WITH_GMS := true
WITH_GMS := true
USE_REALITY_ENGINE := true
$(call soong_config_set,surfaceflinger,frame_rate_category_high,120)
$(call soong_config_set,surfaceflinger,frame_rate_category_min,60)
TARGET_BOOT_ANIMATION_RES := 1080
WITH_GMS_COMMS_SUITE := true
TARGET_USE_FILES := true
SURFACE_FLINGER_BOOST := true

# Device identifier. This must come after all inclusions
PRODUCT_NAME := $(PRODUCT_TARGET_ROM)_phoenix
PRODUCT_DEVICE := phoenix
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi K30
PRODUCT_MANUFACTURER := Xiaomi
TARGET_VENDOR := Xiaomi
BOARD_VENDOR := Xiaomi
TARGET_VENDOR_PRODUCT_NAME := phoenix
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="phoenix-user 11 RKQ1.200826.002 21.9.28 release-keys" \
    BuildFingerprint=Redmi/phoenix/phoenix:11/RKQ1.200826.002/21.9.28:user/release-keys
