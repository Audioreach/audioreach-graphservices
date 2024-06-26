#                                               -*- Autoconf -*-
# configure.ac -- Autoconf script for spf
#

# Process this file with autoconf to produce a configure script

# Requires autoconf tool later than 2.61
AC_PREREQ(2.69)

AC_INIT([arosp],1.0.1)
# Does not strictly follow GNU Coding standards
AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])
LT_INIT
AC_PROG_CC
AC_PROG_CXX
AC_PROG_LIBTOOL
AM_PROG_AR

AC_ARG_WITH([qcom],
    AS_HELP_STRING([install qcom header files (default is no)]),
        [with_qcom=$withval],
	    [with_qcom=no])
	    AM_CONDITIONAL([ARGS_VENDOR_QCOM], [test "x${with_qcom}" = "xyes"])

AC_ARG_WITH([syslog],
    AS_HELP_STRING([use syslog (default is no)]),
        [with_syslog=$withval],
	    [with_syslog=no])
	    AM_CONDITIONAL([ARGS_USE_SYSLOG], [test "x${with_syslog}" = "xyes"])

AC_ARG_WITH([glib],
      AC_HELP_STRING([--with-glib],
         [enable glib, Build against glib. Use this when building for HLOS systems which use glib]))

if (test "x${with_glib}" = "xyes"); then
        PKG_CHECK_MODULES(GTHREAD, gthread-2.0 >= 2.16, dummy=yes,
                                AC_MSG_ERROR(GThread >= 2.16 is required))
        PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.16, dummy=yes,
                                AC_MSG_ERROR(GLib >= 2.16 is required))
        GLIB_CFLAGS="$GLIB_CFLAGS $GTHREAD_CFLAGS"
        GLIB_LIBS="$GLIB_LIBS $GTHREAD_LIBS"

        AC_SUBST(GLIB_CFLAGS)
        AC_SUBST(GLIB_LIBS)
fi

AM_CONDITIONAL(USE_GLIB, test "x${with_glib}" = "xyes")

AC_ARG_WITH([cutils],
    AS_HELP_STRING([Use cutils (default is yes)]),
     [with_cutils=$withval],
     [with_cutils=yes])
AM_CONDITIONAL([CUTILS_SUPPORTED], [test "x${with_cutils}" = "xyes"])

AC_ARG_WITH([ats_transport_tcp_ip],
    AS_HELP_STRING([Use ats transport TCP/IP (default is yes)]),
     [with_ats_transport_tcp_ip=$withval],
     [with_ats_transport_tcp_ip=yes])
AM_CONDITIONAL([USES_ATS_TRANSPORT_TCPIP], [test "x${with_ats_transport_tcp_ip}" = "xyes"])

AC_ARG_WITH([dummy_diag],
      AC_HELP_STRING([--with-dummy_diag],
         [use dummy diag instead of libdiag]))

if (test "x${with_dummy_diag}" = "xno"); then
        PKG_CHECK_MODULES([DIAG], [diag])
        AC_SUBST([DIAG_CFLAGS])
        AC_SUBST([DIAG_LIBS])
fi

AM_CONDITIONAL(USE_DUMMY_DIAG, test "x${with_dummy_diag}" = "xyes")

AC_CONFIG_FILES(
Makefile
spf/Makefile
ar_osal/Makefile
ar_util/Makefile
acdb/Makefile
acdb/ats/Makefile
gpr/Makefile
gsl/Makefile
spf/spf.pc
ar_osal/ar_osal.pc
ar_util/ar_util.pc
acdb/acdb.pc
acdb/ats/ats.pc
gpr/gpr.pc
gsl/gsl.pc
)


AC_OUTPUT
