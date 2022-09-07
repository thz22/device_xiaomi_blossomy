#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_VENDOR := xiaomi

DEVICE_PATH := device/xiaomi/blossom

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# OTA
TARGET_OTA_ASSERT_DEVICE := dandelion,angelica,angelican,cattail,angelicain,blossom

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

# Platform
TARGET_BOARD_PLATFORM := mt6765
TARGET_BOOTLOADER_BOARD_NAME := blossom

BOARD_HAS_MTK_HARDWARE := true
BOARD_HAVE_MTK_FM := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_xiaomi_blossom
TARGET_RECOVERY_DEVICE_MODULES := libinit_xiaomi_blossom

# Kernel
TARGET_KERNEL_CONFIG := blossom_defconfig # no file, only make build system happy
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)-kernel/kernel # automatically copied
TARGET_PREBUILT_DTB := $(DEVICE_PATH)-kernel/dtb.img # for mkbootimg only
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img # automatically copied
TARGET_FORCE_PREBUILT_KERNEL := true # dont really build with our imcomplete "source"

# Bootloader
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_SECOND_OFFSET := 0x00e88000
BOARD_RAMDISK_OFFSET := 0x11a88000
BOARD_KERNEL_TAGS_OFFSET := 0x07808000
BOARD_DTB_OFFSET := 0x07808000

TARGET_NO_BOOTLOADER := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true

BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_CMDLINE += kpti=off

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_SUPER_PARTITION_SIZE := 4831838208

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Dynamic Partitions
BOARD_ROOT_EXTRA_FOLDERS += metadata
BOARD_USES_METADATA_PARTITION := true

BOARD_MAIN_SIZE := 4829741056 # (BOARD_SUPER_PARTITION_SIZE - 2 * 1024 * 1024)
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_PARTITION_LIST := system vendor product odm system_ext

# Display
TARGET_SCREEN_DENSITY := 320

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Vibrator
TARGET_VIBRATOR_SUPPORTS_EFFECTS := true

# Power
TARGET_POWERHAL_AIDL_VERSION := 1
TARGET_POWERHAL_MODE_EXT := $(DEVICE_PATH)/power/power-mode.cpp

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := system product odm system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 1
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := 1
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 3

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6765

# Security Patch Level
VENDOR_SECURITY_PATCH := 2020-01-05

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# VINTF
DEVICE_MATRIX_FILE += $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/framework_compatibility_matrix.xml

# VNDK
BOARD_VNDK_VERSION := current

# SELinux
include device/mediatek/sepolicy_vndr/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Inherit the proprietary files
include vendor/xiaomi/blossom/BoardConfigVendor.mk
