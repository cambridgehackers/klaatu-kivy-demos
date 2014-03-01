LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

launcher_dir := $(TARGET_OUT_SHARED_LIBRARIES)/python2.7/kc-launcher

app := kc-launcher
$(app): srcdir := $(LOCAL_PATH)
$(app): dstdir := $(launcher_dir)
$(app) : $(LOCAL_PATH)/*.py $(LOCAL_PATH)/*.kv $(LOCAL_PATH)/*.jpg | $(ACP)
	@mkdir -p $(dstdir)
	$(ACP) $^ $(dstdir)
	@mkdir -p $(dstdir)/apps
	$(ACP) $(srcdir)/apps/*.py $(dstdir)/apps
ALL_MODULES += $(app)
ALL_DEFAULT_INSTALLED_MODULES += $(app)
.PHONY: $(app)

app := touchtracer
appdir := $(LOCAL_PATH)/apps/$(app)
$(app): srcdir := $(LOCAL_PATH)/apps/touchtracer
$(app): dstdir := $(launcher_dir)/apps/touchtracer
$(app) : $(appdir)/*.py $(appdir)/*.kv $(appdir)/*.png | $(ACP)
	@mkdir -p $(dstdir)
	$(ACP) $^ $(dstdir)
ALL_MODULES += $(app)
ALL_DEFAULT_INSTALLED_MODULES += $(app)
.PHONY: $(app)
