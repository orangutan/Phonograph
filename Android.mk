LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := phonograph
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := phonograph

phonograph_root  := $(LOCAL_PATH)
phonograph_dir   := app
phonograph_out   := $(PWD)/$(OUT_DIR)/target/common/obj/APPS/$(LOCAL_MODULE)_intermediates
phonograph_build := $(phonograph_root)/$(phonograph_dir)/build
phonograph_apk   := build/outputs/apk/release/app-release-unsigned.apk

$(phonograph_root)/$(phonograph_dir)/$(phonograph_apk):
	rm -Rf $(phonograph_build)
	mkdir -p $(phonograph_out)
	ln -sf $(phonograph_out) $(phonograph_build)
	cd $(phonograph_root)/$(phonograph_dir) && gradle assembleRelease

LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(phonograph_dir)/$(phonograph_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)
