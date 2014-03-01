LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

launcher_dir := $(TARGET_OUT_SHARED_LIBRARIES)/python2.7/kc-launcher

file := $(launcher_dir)/apps/touchtracer
$(file): srcdir := $(LOCAL_PATH)
$(file): dstdir := $(file)
$(file) : $(LOCAL_PATH)/*.py $(LOCAL_PATH)/*.kv $(LOCAL_PATH)/*.png | $(ACP)
	@mkdir -p $(dstdir)
	$(ACP) $(srcdir)/*.kv $(srcdir)/*.png $(srcdir)/*.py $(dstdir)
ALL_MODULES += $(file)
ALL_DEFAULT_INSTALLED_MODULES += $(file)
