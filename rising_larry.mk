#
# Copyright (C) 2023-2026 The LineageOS Project & RisingOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit 64-bit core configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit RisingOS common configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from larry device makefile
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# ========================================================
#  DEVICE IDENTIFIERS
# ========================================================
PRODUCT_NAME := rising_larry
PRODUCT_DEVICE := larry
PRODUCT_BRAND := oneplus
PRODUCT_MODEL := CPH2467
PRODUCT_MANUFACTURER := oneplus
PRODUCT_GMS_CLIENTID_BASE := android-oppo

# ========================================================
#  RISING-OS OFFICIAL BUILD FLAGS (From Documentation)
# ========================================================
RISING_MAINTAINER := DemonThunder

# Hardware blur rendering (Enabled for depth effect)
TARGET_ENABLE_BLUR := true

# Camera toggle: set to false to ship Aperture camera (or true if using OPlusCam)
PRODUCT_NO_CAMERA := false

# Full GApps Package Flag
WITH_GMS := true

# ========================================================
#  BRANDING & PROPS OVERRIDES
# ========================================================
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingChipset="Snapdragon 695 5G" \
    RisingMaintainer="DemonThunder" \
    BuildDesc="OP5958L1-user 15 UKQ1.230924.001 T.R4T2.24da738-26996-834f2 release-keys" \
    BuildFingerprint=OnePlus/CPH2467/OP5958L1:15/UKQ1.230924.001/T.R4T2.24da738-26996-834f2:user/release-keys \
    DeviceName=OP5958L1 \
    DeviceProduct=OP5958L1 \
    SystemDevice=OP5958L1 \
    SystemName=OP5958L1

# ========================================================
#  PERFORMANCE & PRIVACY PROPERTIES
# ========================================================
PRODUCT_SYSTEM_PROPERTIES += \
    ro.config.nocheckin=1 \
    persist.adb.notify=0 \
    ro.kernel.android.checkjni=0 \
    ro.kernel.checkjni=0 \
    dalvik.vm.usejit=true \
    dalvik.vm.dexopt.thermal-cutoff=2 \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true
