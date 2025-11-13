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

DEVICE_PATH := device/samsung/ha3g

# Battery
RED_LED_PATH := "/sys/class/leds/led_r/brightness"
GREEN_LED_PATH := "/sys/class/leds/led_g/brightness"
BLUE_LED_PATH := "/sys/class/leds/led_b/brightness"

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Bootloader
TARGET_OTA_ASSERT_DEVICE := ha3g,ha3gxx

# Camera
BOARD_CAMERA_BACK_ROTATION := 90
BOARD_CAMERA_FRONT_ROTATION := 270
#BOARD_BACK_CAMERA_SENSOR := SENSOR_NAME_IMX135
#BOARD_FRONT_CAMERA_SENSOR := SENSOR_NAME_S5K6B2

# Display
TARGET_SCREEN_DENSITY := 480

# HDMI
BOARD_USES_CEC := true

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Include path
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

# IR Blaster
IR_HAS_ONE_FREQ_RANGE := true

# Kernel
TARGET_KERNEL_CONFIG := lineageos_ha3g_defconfig

# Legacy BLOB Support
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/vendor/bin/hw/rild=27 \
    /system/vendor/bin/hw/android.hardware.sensors@1.0-service.exynos5420=22 \
    /system/vendor/bin/hw/android.hardware.audio.service.exynos5=22

# Modem
BOARD_MODEM_TYPE := xmm6360
BOARD_PROVIDES_LIBRIL := true

# NFC
include $(DEVICE_PATH)/nfc/bcm2079x/board.mk

# Network Routing
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# NFC
BOARD_HAVE_NFC := true

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
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/bin/gpsd|/vendor/lib/libshim_dmitry_gps.so \
    /vendor/lib/libsec-ril.so|libshim_atomic.so \
    /vendor/lib/libsec-ril.so|libcutils_shim.so \
    /vendor/lib/libsensorhub.so|libshim_binder.so

# inherit from the proprietary version
include vendor/samsung/ha3g/BoardConfigVendor.mk
