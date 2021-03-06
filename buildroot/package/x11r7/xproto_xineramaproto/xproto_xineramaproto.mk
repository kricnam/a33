################################################################################
#
# xproto_xineramaproto -- X.Org Xinerama protocol headers
#
################################################################################

XPROTO_XINERAMAPROTO_VERSION = 1.2
XPROTO_XINERAMAPROTO_SOURCE = xineramaproto-$(XPROTO_XINERAMAPROTO_VERSION).tar.bz2
XPROTO_XINERAMAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
XPROTO_XINERAMAPROTO_AUTORECONF = NO
XPROTO_XINERAMAPROTO_INSTALL_STAGING = YES
XPROTO_XINERAMAPROTO_INSTALL_TARGET = NO

$(eval $(call AUTOTARGETS,package/x11r7,xproto_xineramaproto))
