ACLOCAL_AMFLAGS = -I m4

SUBDIRS = tests
DIST_SUBDIRS = tests

AM_CFLAGS = -Wall -ggdb -D_GNU_SOURCE -pthread
AM_CFLAGS += $(FUSE_CFLAGS)
AM_CFLAGS += -DLIBDIR=\"$(LIBDIR)\"
AM_LDFLAGS = $(FUSE_LIBS) -pthread
#AM_CFLAGS += -DDEBUG

AM_CFLAGS += -DRUNTIME_PATH=\"$(RUNTIME_PATH)\"

noinst_HEADERS = bindings.h macro.h

sodir=$(libdir)

liblxcfs_la_SOURCES = macro.h bindings.c cpuset.c bindings.h
liblxcfs_la_CFLAGS = $(AM_CFLAGS)
liblxcfs_la_LDFLAGS = $(AM_CFLAGS) -module -avoid-version -shared

lxcfs_LTLIBRARIES = liblxcfs.la

liblxcfstest_la_SOURCES = bindings.c cpuset.c bindings.h macro.h
liblxcfstest_la_CFLAGS = $(AM_CFLAGS) -DRELOADTEST
liblxcfstest_la_LDFLAGS = $(AM_CFLAGS) -module -avoid-version -shared

EXTRA_LTLIBRARIES = liblxcfstest.la

lxcfs_SOURCES = lxcfs.c
lxcfs_LDADD = -ldl
lxcfs_CFLAGS = $(AM_CFLAGS)
lxcfs_LDFLAGS = $(AM_LDFLAGS)

bin_PROGRAMS = lxcfs

EXTRA_DIST = \
	lxcfs.man.add \
	lxcfs.spec

if HAVE_HELP2MAN
man_MANS = lxcfs.1
lxcfs.1: lxcfs lxcfs.man.add
	$(HELP2MAN) -n "Set up cgroup fs for containers" --no-discard-stderr -s 1 -I lxcfs.man.add -N ./lxcfs > lxcfs.1
endif

tests: tests/test_read tests/test_cpusetrange tests/test_syscalls

tests/test_read: tests/test_read.c
	$(CC) -o $@ $^
tests/test_cpusetrange: tests/test_cpusetrange.c cpuset.c
	$(CC) -o $@ $^
tests/test_syscalls: tests/test_syscalls.c
	$(CC) -o $@ $^

distclean:
	rm -rf .deps/ \
		INSTALL \
		Makefile \
		Makefile.in \
		aclocal.m4 \
		autom4te.cache/ \
		compile \
		config.guess \
		config.h \
		config.h.in \
		config.log \
		config.status \
		config.sub \
		configure \
		depcomp \
		install-sh \
		libtool \
		ltmain.sh \
		lxcfs \
		lxcfs.1 \
		lxcfs.o \
		m4/ \
		missing \
		stamp-h1 \
		tests/test_read \
		tests/test_cpusetrange \
		tests/test_syscalls \
		*.lo *.la
# FIXME: do something about m4/acinclude.m4
