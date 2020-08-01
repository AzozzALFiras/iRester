
THEOS = /Users/azozzalfiras/opt/theos
THEOS_MAKE_PATH = /Users/azozzalfiras/opt/theos

include $(THEOS)/makefiles/common.mk

ARCHS = armv7 armv7s arm64 arm64e



BUNDLE_NAME = iResters

iResters_FILES = iRestersRootListController.mm
iResters_INSTALL_PATH = /Library/PreferenceBundles
iResters_FRAMEWORKS = UIKit
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value
$(TWEAK_NAME)_LDFLAGS = -Wl,-segalign,4000
$(BUNDLE_NAME)_PRIVATE_FRAMEWORKS = Preferences
$(BUNDLE_NAME)_FRAMEWORKS = UIKit QuartzCore CoreGraphics MessageUI Social Twitter
$(BUNDLE_NAME)_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/iResters.plist$(ECHO_END)
