# Copyright 2014 The Android Open Source Project
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

include device/sony/yoshino/PlatformConfig.mk

TARGET_BOOTLOADER_BOARD_NAME := unknown
ifneq (,$(filter %g8341,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := G8341
else ifneq (,$(filter %g8342,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := G8342
else
TARGET_BOOTLOADER_BOARD_NAME := G8341
$(warning Unrecognized value for TARGET_PRODUCT: "$(TARGET_PRODUCT)", using default value: "$(TARGET_BOOTLOADER_BOARD_NAME)")
endif

# Platform
PRODUCT_PLATFORM := yoshino

BOARD_KERNEL_CMDLINE += androidboot.hardware=poplar

# Partition information
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
# Reserve space for data encryption (32212254720-32768)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 32212221952
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824

# Treble
BOARD_VNDK_VERSION := current

# Build a separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_JOURNAL_SIZE := 0
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := 4096

BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true


BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_COPY_HEADERS := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
#TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/input/clearpad/wakeup_gesture"
