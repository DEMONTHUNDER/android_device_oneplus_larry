#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit common Evolution X / Lineage configurations
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from larry device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_larry
PRODUCT_DEVICE := larry
PRODUCT_BRAND := oneplus
PRODUCT_MODEL := CPH2467
PRODUCT_MANUFACTURER := oneplus

PRODUCT_GMS_CLIENTID_BASE := android-oppo

# Production Fingerprint & Props Spoofing
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="OP5958L1-user 15 UKQ1.230924.001 T.R4T2.24da738-26996-834f2 release-keys" \
    BuildFingerprint=OnePlus/CPH2467/OP5958L1:15/UKQ1.230924.001/T.R4T2.24da738-26996-834f2:user/release-keys \
    DeviceName=OP5958L1 \
    DeviceProduct=OP5958L1 \
    SystemDevice=OP5958L1 \
    SystemName=OP5958L1

# -------------------------------------------------------------
# Evolution X Maintainer Branding & Goodies
# -------------------------------------------------------------
EVO_BUILD_TYPE := Official
EVO_MAINTAINER := Saket Hegde

# System property fallbacks for Settings > About Phone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.evolution.maintainer=Saket Hegde \
    ro.build.maintainer=Saket Hegde \
    ro.config.media_vol_steps=25 \
    ro.config.vc_call_vol_steps=8
