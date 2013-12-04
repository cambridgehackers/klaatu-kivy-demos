LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

file := $(TARGET_ROOT_OUT)/init.klaatu-kivy.rc
$(file) : $(LOCAL_PATH)/init.klaatu-kivy.rc | $(TARGET_ROOT_OUT)/init.klaatu.rc $(ACP)
	$(transform-prebuilt-to-target)
	echo "import /init.klaatu-kivy.rc" >> $(TARGET_ROOT_OUT)/init.klaatu.rc
	mkdir -p $(TARGET_OUT_DATA)/property
	echo -n kivy > $(TARGET_OUT_DATA)/property/persist.sys.ui.config
	echo "kivy Python/Kivy" >> $(TARGET_ROOT_OUT)/UIs.txt
ALL_MODULES += $(file)
ALL_DEFAULT_INSTALLED_MODULES += $(file)
