#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6375-common
-include device/oneplus/sm6375-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/larry

# Partitions
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_SIZE := 12880707584
BOARD_SUPER_PARTITION_SIZE := 12884901888

# Inherit the proprietary files
-include vendor/oneplus/larry/BoardConfigVendor.mk

# --- DAILY DRIVER STABILITY ---

# 1. Smart Storage (Svelte)
# Tells the system to compress background apps rather than killing them instantly.
# Essential for 6GB/8GB RAM devices on Android 16.
MALLOC_SVELTE := true

# 2. File System Safety
# Ensures the file system (ext4/f2fs) checks prevent data corruption on hard reboots.
TARGET_USES_MKE2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# 3. Recovery Stability
# Ensures you can actually update or format data if something goes wrong.
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USES_UEFI := true
