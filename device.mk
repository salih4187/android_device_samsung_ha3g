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

DEVICE_PATH := device/samsung/ha3g

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay-lineage
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    device/samsung/ha3g/overlay/hardware/samsung/AdvancedDisplay

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# AdvancedDisplay (MDNIE)
PRODUCT_PACKAGES += \
    AdvancedDisplay

# Audio
PRODUCT_PACKAGES += \
    libtinyxml \
    libtinyalsa

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/configs/audio/ysound.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/ysound.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/bt_vendor.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/bluetooth/bt_vendor.conf

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Doze
PRODUCT_PACKAGES += \
	SamsungDoze

# FlipFlap
PRODUCT_PACKAGES += \
    FlipFlap

# GPS
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gps.xml

# Input device
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/Synaptics_HID_TouchPad.idc \
    $(DEVICE_PATH)/configs/idc/sec_e-pen.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/sec_e-pen.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/Button_Jack.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Button_Jack.kl \
    $(DEVICE_PATH)/configs/keylayout/gpio_keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio_keys.kl \
    $(DEVICE_PATH)/configs/keylayout/sec_e-pen.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_e-pen.kl \
    $(DEVICE_PATH)/configs/keylayout/sec_touchkey.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchkey.kl

# NFC
$(call inherit-product, device/samsung/ha3g/nfc/bcm2079x/product.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
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
    $(DEVICE_PATH)/configs/init/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.legacy.rc

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/telephony/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml \
    $(DEVICE_PATH)/configs/telephony/spn-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/spn-conf.xml

# Ramdisk
PRODUCT_PACKAGES += \
    init.baseband.rc \
    init.target.rc

# Shims
PRODUCT_PACKAGES += \
    libcutils_shim \
    libshim_atomic \
    libshim_binder \
    libshim_dmitry_gps

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2016-01-01

# Inherit from universal5420-common
$(call inherit-product, device/samsung/universal5420-common/device-common.mk)

# call the proprietary setup
$(call inherit-product, vendor/samsung/ha3g/ha3g-vendor.mk)
