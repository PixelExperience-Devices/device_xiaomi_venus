#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/venus

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Board
TARGET_BOOTLOADER_BOARD_NAME := venus

# Display
TARGET_SCREEN_DENSITY := 560

# OTA assert
TARGET_OTA_ASSERT_DEVICE := venus

# Kernel
TARGET_KERNEL_SOURCE := kernel/xiaomi/venus
TARGET_KERNEL_CONFIG := vendor/venus-qgki_defconfig

# Kernel modules
BOOT_KERNEL_MODULES := \
    fts_touch_spi.ko \
    hwid.ko \
    xiaomi_touch.ko

BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114001162240

# Include proprietary files
-include vendor/xiaomi/venus/BoardConfigVendor.mk
-include vendor/xiaomi/venus-firmware/BoardConfigVendor.mk
