#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'hardware/oplus',
    'vendor/oneplus/sm6375-common',
    'vendor/qcom/opensource/display',
]

blob_fixups: blob_fixups_user_type = {
    'odm/lib64/libAlgoProcess.so': blob_fixup()
        .replace_needed('android.hardware.graphics.common-V1-ndk_platform.so', 'android.hardware.graphics.common-V7-ndk.so'),
    ('odm/lib64/libCOppLceTonemapAPI.so', 'odm/lib64/libaps_frame_registration.so', 'odm/lib64/libYTCommon.so'): blob_fixup()
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    'vendor/lib64/libmidasserviceintf_aidl.so': blob_fixup()
        .remove_needed('android.frameworks.stats@1.0.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'larry',
    'oneplus',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    add_firmware_proprietary_file=False,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'sm6375-common', module.vendor
    )
    utils.run()
