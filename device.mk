#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 mdeejay
# Copyright (C) 2013 faust93
# Copyright (C) 2013-2015 ShevT
# Copyright (C) 2015 liang
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, hardware/ti/omap4/omap4.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

COMMON_FOLDER := device/huawei/viva

PRODUCT_CHARACTERISTICS := default
DEVICE_PACKAGE_OVERLAYS := $(COMMON_FOLDER)/overlay

# Audio Packages
PRODUCT_PACKAGES += \
    tinycap \
    tinymix \
    tinyplay \
    libtinyalsa \
    libaudioutils

# Hardware HALs
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.omap4 \
    gralloc.omap4.so \
    power.viva \
    camera.omap4 \
    lights.omap4

# Init scripts
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/rootdir/init.viva.rc:root/init.viva.rc \
    $(COMMON_FOLDER)/rootdir/init.viva.usb.rc:root/init.viva.usb.rc \
    $(COMMON_FOLDER)/rootdir/ueventd.viva.rc:root/ueventd.viva.rc \
    $(COMMON_FOLDER)/rootdir/fstab.viva:root/fstab.viva

# Utilities
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/prebuilt/xbin/remount:system/xbin/remount \
    $(COMMON_FOLDER)/prebuilt/etc/utils/optimizedb:system/etc/utils/optimizedb \
    $(COMMON_FOLDER)/prebuilt/etc/utils/optimizestorage:system/etc/utils/optimizestorage \
    $(COMMON_FOLDER)/prebuilt/etc/init.d/11frandom:system/etc/init.d/11frandom

# Media / Audio
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
    $(COMMON_FOLDER)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(COMMON_FOLDER)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_FOLDER)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(COMMON_FOLDER)/configs/audio/cm_viva_audio_config.conf:system/etc/huawei/audio/cm_viva_audio_config.conf \
    $(COMMON_FOLDER)/configs/audio/viva_audio_config.conf:system/etc/huawei/audio/viva_audio_config.conf \
    $(COMMON_FOLDER)/configs/audio/viva_factory_audio_config.conf:system/etc/huawei/audio/viva_factory_audio_config.conf

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/gps.conf:system/etc/gps.conf \
    $(COMMON_FOLDER)/configs/gpsconfig.xml:system/etc/gpsconfig.xml

# WiFi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    hostapd_default.conf \
    libwpa_client \
    p2p_supplicant \
    wpa_supplicant \
    wpa_supplicant.conf

# Common
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    e2fsck \
    com.android.future.usb.accessory

# Network tools
PRODUCT_PACKAGES += \
    libpcap \
    tcpdump \
    libnetcmdiface \
    l2ping

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# Key maps
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/usr/omap4-keypad.kl:system/usr/keylayout/omap4-keypad.kl \
    $(COMMON_FOLDER)/configs/usr/omap4-keypad.kcm:system/usr/keychars/omap4-keypad.kcm \
    $(COMMON_FOLDER)/configs/usr/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/usr/syn_tm12xx_ts_1.idc:system/usr/idc/syn_tm12xx_ts_1.idc \
    $(COMMON_FOLDER)/configs/usr/syn_tm12xx_ts_2.idc:system/usr/idc/syn_tm12xx_ts_2.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    persist.sys.root_access=3 \
    persist.adb.notify=0 \
    persist.call_recording.enabled=1

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.sys.usb.config=mtp

# Art Settings
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-filter=balanced \
    dalvik.vm.dex2oat-flags=--no-watch-dog \
    dalvik.vm.image-dex2oat-filter=speed

# The number of background processes
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.max_starting_bg=8 \
    ro.sys.fw.bg_apps_limit=16

# Low-RAM optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    persist.sys.force_highendgfx=true \
    ro.product.locale.language=zh \
    ro.product.locale.region=CN \
    ro.com.android.dateformat=dd-MM-yyyy \
    persist.sys.timezone=Asia/Shanghai \
    config.disable_atlas=true


# Memory management
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ksm.default=1

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

# Newer camera API isn't supported.
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.disable_scissor_opt=true \
    debug.hwui.render_dirty_regions=false

# Here crashes gallery
# if ro.build.display.id is such "cm_viva-userdebug 4.2.2 JDQ39E eng.shev.20130805.153138 test-keys" then gellery/camera crashshshsh
# as well - does not crash
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=cm_viva

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product-if-exists, vendor/huawei/viva/viva-vendor.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-dalvik-heap.mk)
#$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

#PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += zh_CN hdpi
BOARD_WLAN_DEVICE_REV := bcm4330_b1
WIFI_BAND             := 802_11_ABG
