#
# Copyright (C) 2013 The CyanogenMod Project
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

# Inherit from universal5420-common
include device/samsung/universal5420-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/ha3g
COMMON_PATH := device/samsung/universal5420-common

# Platform
BOARD_NO_RECOVERY_PATCH := true

# Audio blobs
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
BOARD_GLOBAL_CFLAGS += -DSEC_PRODUCT_FEATURE_RIL_CALL_DUALMODE_CDMAGSM

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Bootloader
TARGET_OTA_ASSERT_DEVICE := ha3g,ha3gxx

# Display
TARGET_SCREEN_DENSITY := 480

# HIDL
DEVICE_MANIFEST_FILE += $(LOCAL_PATH)/manifest.xml

# IR Blaster
IR_HAS_ONE_FREQ_RANGE := true

# Kernel
TARGET_KERNEL_CONFIG := lineageos_ha3g_defconfig

# Mixer
BOARD_USE_BGRA_8888 := true

# Modem
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6360

# Battery
RED_LED_PATH := "/sys/class/leds/led_r/brightness"
GREEN_LED_PATH := "/sys/class/leds/led_g/brightness"
BLUE_LED_PATH := "/sys/class/leds/led_b/brightness"
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"

# HDMI
BOARD_USES_GSC_VIDEO := true

# Include path
TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

# Network Routing
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# NFC
BOARD_HAVE_NFC := true
BOARD_NFC_HAL_SUFFIX := universal5420

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13631488
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2398552064
# userdata = 27912056832 = (27912073216 - 16384 <encryption footer>)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27912056832
BOARD_CACHEIMAGE_PARTITION_SIZE := 309616640
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Sensors
BOARD_NEEDS_MEMORYHEAPION := true
BOARD_GLOBAL_CFLAGS += -DSAMSUNG_DVFS

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/bin/hw/gpsd|/vendor/lib/libshim_dmitry_gps.so \
    /vendor/lib/libsec-ril.so|libshim_atomic.so \
    /vendor/lib/libsec-ril.so|libcutils_shim.so \
    /vendor/lib/libsensorhub.so|libshim_binder.so

# Camera: portrait orientation
BOARD_CAMERA_FRONT_ROTATION := 270
BOARD_CAMERA_BACK_ROTATION := 90

# inherit from the proprietary version
include vendor/samsung/ha3g/BoardConfigVendor.mk
