# ADB Enable ADB Debugging By Default & Disable USB Debugging 
PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    persist.sys.usb.config=adb \
    ro.adb.secure=0
    
# ADB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    ro.debug_level=0x4948

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.vc_call_vol_steps=7
    
# Camera
PRODUCT_PROPERTY_OVERRIDES += \
	media.stagefright.legacyencoder=true \
	media.stagefright.less-secure=true

# Dalvik Heap
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapstartsize=16m \
	dalvik.vm.heapgrowthlimit=192m \
	dalvik.vm.heapsize=512m \
	dalvik.vm.heaptargetutilization=0.75 \
	dalvik.vm.heapminfree=2m \
	dalvik.vm.heapmaxfree=8m

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.rild.libpath=/vendor/lib/libsecril-shim.so \
	vendor.rild.libargs=-d /dev/ttyS0
	keyguard.no_require_sim=true \
    ro.com.android.dataroaming=false \
	ro.ril.telephony.mqanelements=6 \
	persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.add_power_save=1 \
    telephony.lteOnCdmaDevice=0 \
    ro.telephony.default_network=0 \
	ro.telephony.get_imsi_from_sim=true \
	ro.ril.force_eri_from_xml=true \
	net.tethering.noprovisioning=true \
	ro.telephony.ril_class=SamsungExynosRIL \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10
