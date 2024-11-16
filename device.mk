#
# Copyright (C) 2024 The LineageOS Project
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
#

LOCAL_PATH := device/samsung/ha3g

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay/hardware/samsung/AdvancedDisplay

# AdvancedDisplay (MDNIE)
PRODUCT_PACKAGES += \
    AdvancedDisplay

# Audio
PRODUCT_PACKAGES += \
    libtinyxml \
    libtinyalsa

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_0.xml \
    $(LOCAL_PATH)/configs/audio/ysound.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/ysound.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/bluetooth/bt_vendor.conf

# Camera
PRODUCT_PACKAGES += \
    libhwjpeg

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze 

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gps.xml

# Macloader
PRODUCT_PACKAGES += \
    macloader

# Input device
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/Synaptics_HID_TouchPad.idc \
    $(LOCAL_PATH)/configs/idc/sec_e-pen.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/sec_e-pen.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/sec_touchkey.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchkey.kl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml
    
# Radio
PRODUCT_PACKAGES += \
    modemloader \
    libprotobuf-cpp-full \
    libxml2 \
    rild \
    libril \
    libreference-ril \
    android.hardware.radio@1.0 \
    android.hardware.radio.deprecated@1.0

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.legacy.rc
    
# Ramdisk
PRODUCT_PACKAGES += \
	init.baseband.rc \
    init.target.rc

# Shims
PRODUCT_PACKAGES += \
    libshim_dmitry_gps \
    libcutils_shim \
    libshim_atomic \
    libshim_binder

# Properties
include $(LOCAL_PATH)/system_prop.mk

# Inherit from universal5420-common
$(call inherit-product, device/samsung/universal5420-common/device-common.mk)

# call the proprietary setup
$(call inherit-product, vendor/samsung/ha3g/ha3g-vendor.mk)
