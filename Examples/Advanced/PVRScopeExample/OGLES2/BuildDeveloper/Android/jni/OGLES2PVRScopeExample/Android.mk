LOCAL_PATH := $(call my-dir)/../../../../../../../..
PVRSDKDIR := $(realpath $(LOCAL_PATH))

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/PVRScopeExample/OGLES2/BuildDeveloper/Android/assets


ifneq "$(MAKECMDGOALS)" "clean"
# Prebuilt module PVRScopeDeveloper
include $(CLEAR_VARS)
LOCAL_MODULE := PVRScopeDeveloper
LOCAL_SRC_FILES := $(PVRSDKDIR)/Builds/Android/$(TARGET_ARCH_ABI)/Lib/libPVRScopeDeveloper.a
include $(PREBUILT_STATIC_LIBRARY)
endif

ifneq "$(MAKECMDGOALS)" "clean"
# Prebuilt module ogles2tools
include $(CLEAR_VARS)
LOCAL_MODULE := ogles2tools
LOCAL_SRC_FILES := $(PVRSDKDIR)/Tools/OGLES2/Build/Android/obj/local/$(TARGET_ARCH_ABI)/libogles2tools.a
include $(PREBUILT_STATIC_LIBRARY)
endif


# Module OGLES2PVRScopeExample
include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2PVRScopeExample

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES  := Examples/Advanced/PVRScopeExample/OGLES2/OGLES2PVRScopeExample.cpp \
                    Examples/Advanced/PVRScopeExample/OGLES2/PVRScopeGraphAPI.cpp \
                    Examples/Advanced/PVRScopeExample/PVRScopeGraph.cpp \
                    Shell/PVRShell.cpp \
                    Shell/API/KEGL/PVRShellAPI.cpp \
                    Shell/OS/Android/PVRShellOS.cpp

LOCAL_C_INCLUDES := $(PVRSDKDIR)/Examples/Advanced/PVRScopeExample \
                    $(PVRSDKDIR)/Builds/Include \
                    $(PVRSDKDIR)/Shell \
                    $(PVRSDKDIR)/Shell/API/KEGL \
                    $(PVRSDKDIR)/Shell/OS/Android \
                    $(PVRSDKDIR)/Tools \
                    $(PVRSDKDIR)/Tools/OGLES2

LOCAL_CFLAGS := -DBUILD_OGLES2

LOCAL_LDLIBS := -ldl \
                -llog \
                -landroid \
                -lEGL \
                -lGLESv2

LOCAL_STATIC_LIBRARIES := PVRScopeDeveloper \
                          android_native_app_glue \
                          ogles2tools

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)
