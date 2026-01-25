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

# --- EVOLUTION X SPECIFIC FLAGS ---

# 1. Maintainer Info (Shows your name in Settings > About)
EVO_BUILD_TYPE := Official
EVO_MAINTAINER := Saket


# 1. Smart Storage (Svelte)
# Tells the system to compress background apps rather than killing them instantly.
# Essential for 6GB/8GB RAM devices on Android 16.
MALLOC_SVELTE := true

