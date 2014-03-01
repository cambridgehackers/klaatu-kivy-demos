LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

launcher_dir := $(TARGET_OUT_SHARED_LIBRARIES)/python2.7/kc-launcher

file := $(launcher_dir)/kc-launcher
$(file): srcdir := $(LOCAL_PATH)
$(file): dstdir := $(launcher_dir)
$(file) : $(LOCAL_PATH)/*.py $(LOCAL_PATH)/*.kv $(LOCAL_PATH)/*.jpg | $(ACP)
	@mkdir -p $(dstdir)
	$(ACP) $(srcdir)/*.kv $(srcdir)/*.jpg $(srcdir)/*.py $(dstdir)
	@mkdir -p $(dstdir)/apps
	$(ACP) $(srcdir)/apps/*.py $(dstdir)/apps
ALL_MODULES += $(file)
ALL_DEFAULT_INSTALLED_MODULES += $(file)
