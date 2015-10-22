ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.com.android.dataroaming=false \
    ro.build.selinux=1

# Thank you, please drive thru!
#PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
ifneq ($(WITH_GMS),true)
PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/bin/50-eos.sh:system/addon.d/50-eos.sh \
    vendor/eos/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/eos/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions
endif

# init.d support
PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/eos/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# init file
PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/etc/init.eos.rc:root/init.eos.rc

# Enable SIP+VoIP on all targets
#PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Add few DRM libs
#PRODUCT_COPY_FILES += \
#    vendor/eos/prebuilt/common/vendor/lib/drm/libdrmwvmplugin.so:system/vendor/lib/drm/libdrmwvmplugin.so \
#    vendor/eos/prebuilt/common/vendor/lib/mediadrm/libdrmclearkeyplugin.so:system/vendor/lib/mediadrm/libdrmclearkeyplugin.so \
#    vendor/eos/prebuilt/common/vendor/lib/mediadrm/libwvdrmengine.so:system/vendor/lib/mediadrm/libwvdrmengine.so

# Extra packages
PRODUCT_PACKAGES += \
    AudioFX \
    CustomWallpapers \
    Eleven \
    OTACenter \
    Launcher3 \
    LockClock

# Busybox
PRODUCT_PACKAGES += \
    Busybox

#PRODUCT_PACKAGES += \
#    procmem \
#    procrank \
#    su

# Screen recorder package and lib
#PRODUCT_PACKAGES += \
#    ScreenRecorder \
#    libscreenrecorder

#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.sys.root_access=0

PRODUCT_PACKAGE_OVERLAYS += vendor/eos/overlay/common

# Inherit common product build prop overrides
-include vendor/eos/config/common_versions.mk
