##
# Makefile for zlib
##

# Project info
Project         = zlib
UserType        = Developer
ToolType        = Libraries
GnuAfterInstall = shortbus-install
Extra_CC_Flags  = -DHAVE_UNISTD_H -DUSE_MMAP

# It's a GNU Source project
include $(MAKEFILEPATH)/CoreOS/ReleaseControl/GNUSource.make

# Well, not quite, but we're hackers here...

Configure       = ./configure
Configure_Flags = --prefix="$(Install_Prefix)" --shared

lazy_install_source:: shadow_source

Install_Target = 

Version := $(shell sed -n -e '/VERSION "/s/.*"\(.*\)".*/\1/p' < $(Sources)/zlib.h)

shortbus-install:
	mkdir -p "$(DSTROOT)$(USRLIBDIR)"
	cp "$(OBJROOT)/libz.1.1.3.dylib" "$(DSTROOT)$(USRLIBDIR)"
	$(STRIP) -S $(DSTROOT)$(USRLIBDIR)/libz.1.1.3.dylib
