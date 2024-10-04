#
# Copyright (C) 2021 The Waydroid Project
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

# Inherit from aosp products.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit some common ROM stuff
$(call inherit-product-if-exists, vendor/lineage/config/common_full_tablet_wifionly.mk)
$(call inherit-product-if-exists, vendor/bliss/config/common_full_tablet_wifionly.mk)

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-service \
    android.hardware.gnss@1.0-impl

PRODUCT_COPY_FILES += \
    hardware/quectel/gps/gps_cfg.inf:$(TARGET_COPY_OUT_VENDOR)/etc/gps_cfg.inf \
    hardware/quectel/gps/gps.default.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/gps.default.so

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.gps=ttyUSB1 \
    ro.kernel.android.gps.speed=9600 \
    ro.kernel.android.gps.max_rate=1

# Cellular
# Stuff required for all quectel RIL driver versions
PRODUCT_PACKAGES += \
    BasicSmsReceiver \
    CarrierConfig \
    CellBroadcastApp \
    Contacts \
    Dialer \
    com.android.phone.common \
    CellBroadcastServiceCommon \
    BlockedNumberProvider \
    CallLogBackup \
    ContactsProvider \
    TelephonyProvider \
    MmsService \
    Telecom \
    TeleService

PRODUCT_COPY_FILES += \
    hardware/quectel/cellular/vendor/etc/ql-ril.conf:$(TARGET_COPY_OUT_VENDOR)/etc/ql-ril.conf \
    hardware/quectel/cellular/system/bin/chat:$(TARGET_COPY_OUT_SYSTEM)/bin/chat \
    hardware/quectel/cellular/system/etc/apns-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/apns-conf.xml \
    hardware/quectel/cellular/system/etc/ppp/ip-down:$(TARGET_COPY_OUT_SYSTEM)/etc/ppp/ip-down \
    hardware/quectel/cellular/system/etc/ppp/ip-up:$(TARGET_COPY_OUT_SYSTEM)/etc/ppp/ip-up \
    device/waydroid/waydroid/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml

# For RIL 1.1
#PRODUCT_PACKAGES += \
#    android.hardware.radio.config@1.0 \
#    android.hardware.radio.config@1.1 \
#    android.hardware.radio.config@1.2 \
#    android.hardware.radio@1.0 \
#    android.hardware.radio@1.1 \
#    rild

#PRODUCT_COPY_FILES += \
#    hardware/quectel/cellular/ril_V3_6_35/vendor/lib64/hw/libreference-ril.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/libreference-ril.so \
#    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio@1.0.so \
#    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio@1.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio@1.1.so \
#    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio@1.2.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio@1.2.so \
#    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio.config@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio.config@1.0.so \
#    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio.config@1.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio.config@1.1.so \
#    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio.config@1.2.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio.config@1.2.so

#For RIL 1.6
#libhwbinder.so is ok to copy in this case because it doesnt contain any symbols.
#All symbols previously in libhwbinder.so have been moved to libhidlbase.so since android 10
PRODUCT_COPY_FILES += \
    hardware/quectel/cellular/waydroid_x86_64/vendor/bin/hw/rild:$(TARGET_COPY_OUT_VENDOR)/bin/hw/rild \
    hardware/quectel/cellular/waydroid_x86_64/vendor/etc/init/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.rc \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/hw/libreference-ril.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/libreference-ril.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/libril.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libril.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/libhwbinder.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhwbinder.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/librilutils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/librilutils.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio.config@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio.config@1.0.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio.config@1.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio.config@1.1.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio.config@1.2.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio.config@1.2.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio@1.0.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio@1.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio@1.1.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio@1.2.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio@1.2.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio@1.3.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio@1.3.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio@1.4.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio@1.4.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio@1.5.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio@1.5.so \
    hardware/quectel/cellular/waydroid_x86_64/vendor/lib64/android.hardware.radio@1.6.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.radio@1.6.so

PRODUCT_PROPERTY_OVERRIDES += \
        hw.nophone=no \
        ro.boot.noril=no \
        ro.radio.noril=no \
        ro.telephony.default_network=10 \
        vendor.rild.libpath=/vendor/lib64/hw/libreference-ril.so \
        keyguard.no_require_sim=true \
        ril.function.dataonly=0 \
        ril.subscription.types=SIM \
        persist.telephony.support.ipv6=1 \
        persist.telephony.support.ipv4=1 \
        telephony.lteOnGsmDevice=1 \
        telephony.lteOnCdmaDevice=1 \
        ro.telephony.call_ring.delay=0 \
        ro.ril.enable.amr.wideband=1 \
        ring.delay=0 \
        ro.config.vc_call_steps=20 \
        persist.cust.tel.eons=1 \
        ro.config.hw_fast_dormancy=1 \
        ro.radio.networkmode=enable \
        persist.audio.fluence.voicecall=false \
        ro.com.android.dataroaming=true \
        ro.telephony.get_imsi_from_sim=true \
        ro.telephony.ril.config=simactivation \
        ro.factory.hasGPS=true

# Audio HAL
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@4.0-impl \
    audio.primary.waydroid \
    audio.r_submix.default \
    audio.usb.default \
    libasound_module_pcm_pulse \
    libasound_module_ctl_pulse \
    libasound_module_conf_pulse

PRODUCT_COPY_FILES += \
    hardware/waydroid/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Camera
#USE_CAMERA_V4L2_HAL := true

#PRODUCT_PACKAGES += \
#    android.hardware.camera.provider@2.4-impl \
#    android.hardware.camera.provider@2.4-service \
#    camera.v4l2

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    vendor.waydroid.task@1.0-service \
    hwcomposer.waydroid

PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle \
    vulkan.pastel

ifneq ($(TARGET_USE_MESA),false)
PRODUCT_PACKAGES += \
    gralloc.minigbm_gbm_mesa \
    gralloc.gbm \
    libEGL_mesa \
    libGLESv1_CM_mesa \
    libGLESv2_mesa \
    libgallium_dri \
    libglapi \
    libgbm_mesa_wrapper

PRODUCT_PACKAGES += \
    vulkan.radeon
#    vulkan.freedreno \
#    vulkan.broadcom \
#    vulkan.panfrost \
#    vulkan.virtio \
#    vulkan.lvp

#ifneq ($(filter %_waydroid_x86 %_waydroid_x86_64,$(TARGET_PRODUCT)),)
#PRODUCT_PACKAGES += \
#    vulkan.intel \
#    vulkan.intel_hasvk
#endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml
endif

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.3-service.clearkey

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service \
    gatekeeper.waydroid

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service.waydroid

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0-service

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.waydroid

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Media - Stagefright FFMPEG plugin
ifneq ($(filter %_waydroid_x86 %_waydroid_x86_64,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.hwaccel=1
endif

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    memtrack.waydroid

# NFC
#PRODUCT_PACKAGES += \
#    NfcNci

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.location.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:system/etc/permissions/android.software.freeform_window_management.xml
#    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
#    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
#    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
#    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service.waydroid

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-service.waydroid

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service.waydroid

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Binder IPC
PRODUCT_PACKAGES += \
    vndservicemanager

ifeq ($(filter %_waydroid_x86 %_waydroid_x86_64,$(TARGET_PRODUCT)),)
PRODUCT_EXTRA_VNDK_VERSIONS := 28 29 30
endif

# Updater
PRODUCT_PACKAGES += \
    WaydroidUpdater
