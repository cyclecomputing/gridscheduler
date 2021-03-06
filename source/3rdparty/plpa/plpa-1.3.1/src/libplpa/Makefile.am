#
# Copyright (c) 2004-2005 The Trustees of Indiana University and Indiana
#                         University Research and Technology
#                         Corporation.  All rights reserved.
# Copyright (c) 2004-2005 The University of Tennessee and The University
#                         of Tennessee Research Foundation.  All rights
#                         reserved.
# Copyright (c) 2004-2005 High Performance Computing Center Stuttgart, 
#                         University of Stuttgart.  All rights reserved.
# Copyright (c) 2004-2005 The Regents of the University of California.
#                         All rights reserved.
# Copyright (c) 2006-2009 Cisco Systems, Inc.  All rights reserved.
# $COPYRIGHT$
# 
# Additional copyrights may follow
# 
# $HEADER$
#

# Defaults
lib_LTLIBRARIES =
noinst_LTLIBRARIES =
nodist_include_HEADERS =
nodist_noinst_HEADERS =

# Note that this file is generated by configure, so we don't want to
# ship it in the tarball.  Hence the "nodist_" prefixes to the HEADERS
# macros, below.
public_headers = plpa.h

# See which mode we're building in
if PLPA_BUILD_STANDALONE
lib_LTLIBRARIES += libplpa.la
nodist_include_HEADERS += $(public_headers)
libplpa_la_LDFLAGS = -version-info $(libplpa_so_version)
else
noinst_LTLIBRARIES += libplpa_included.la
nodist_noinst_HEADERS += $(public_headers)
endif

# The sources
plpa_sources = \
        plpa_internal.h \
        plpa_api_probe.c \
        plpa_dispatch.c \
        plpa_runtime.c \
        plpa_map.c

libplpa_la_SOURCES = $(plpa_sources)
libplpa_included_la_SOURCES = $(plpa_sources)

# Add a hook to run *after* the header file has been installed out to
# the target location.  It changes the pesky PACKAGE_* macros that
# autoconf automatically generates (and there is no way of turning
# off) into PLPA_PACKAGE_* in order to make <plpa.h> safe to include
# with other files.

if PLPA_BUILD_STANDALONE
install-data-hook:
	sed -e 's/define PACKAGE/define PLPA_PACKAGE/' \
		$(DESTDIR)$(includedir)/plpa.h \
		> $(DESTDIR)$(includedir)/plpa.h.install
	cp $(DESTDIR)$(includedir)/plpa.h.install \
		$(DESTDIR)$(includedir)/plpa.h
	rm -f $(DESTDIR)$(includedir)/plpa.h.install
	chmod 0644 $(DESTDIR)$(includedir)/plpa.h
endif
