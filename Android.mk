# Copyright (C) 2022 Paranoid Android
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

LOCAL_PATH := $(call my-dir)

ifneq ($(filter oneplus9,$(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

# Symlinks
ACDBDATA_SYMLINKS := $(TARGET_OUT_ODM)/etc/acdbdata
$(ACDBDATA_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating acdbdata symlinks: $@"
	@mkdir -p $@
	$(hide) ln -sf /vendor/etc/acdbdata/adsp_avs_config.acdb $@/adsp_avs_config.acdb

WIFI_FIRMWARE_SYMLINKS := $(TARGET_OUT_VENDOR)/firmware/
$(WIFI_FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating wifi firmware symlinks: $@"
	@mkdir -p $@/wlan/qca_cld
	$(hide) ln -sf /data/vendor/firmware/wlanmdsp.mbn $@/wlanmdsp.otaupdate
	$(hide) ln -sf /mnt/vendor/persist/wlan_mac.bin $@/wlan/qca_cld/wlan_mac.bin

ALL_DEFAULT_INSTALLED_MODULES += $(ACDBDATA_SYMLINKS) $(WIFI_FIRMWARE_SYMLINKS)
endif
