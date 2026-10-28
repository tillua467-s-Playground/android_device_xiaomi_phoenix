#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6150-common
include device/xiaomi/sm6150-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/phoenix

# Audio
TARGET_PROVIDES_AUDIO_EXTNS := true

# Assert
TARGET_OTA_ASSERT_DEVICE := phoenix,phoenixin

# Board Info
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/configs/board-info.txt

# Kernel
TARGET_KERNEL_CONFIG += vendor/phoenix_defconfig

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/manifest.xml
ODM_MANIFEST_SKUS += phoenix
ODM_MANIFEST_PHOENIX_FILES := \
     $(DEVICE_PATH)/configs/hidl/manifest-nfc.xml

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_DTBOIMG_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_SUPER_PARTITION_SIZE := 9126805504

BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # (BOARD_SUPER_PARTITION_SIZE - 4194304) 4MiB overhead

# ext4 inode counts
# The build's automatic inode calculation (tree entry count + 6%) is rounded
# down by mke2fs to an inode-per-group boundary, which leaves the GMS
# system/system_ext images a handful of inodes short and fails the build with
# "No space left on device while looking up ...".
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 16384
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := 16384
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := 16384
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := 16384

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Verified boot
BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2021-12-01

# Inherit from proprietary files
include vendor/xiaomi/phoenix/BoardConfigVendor.mk
