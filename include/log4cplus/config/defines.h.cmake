#ifndef LOG4CPLUS_CONFIG_DEFINES_HXX
#define LOG4CPLUS_CONFIG_DEFINES_HXX

/* */
#cmakedefine LOG4CPLUS_HAVE_SYSLOG_H ${LOG4CPLUS_HAVE_SYSLOG_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_NETINET_IN_H ${LOG4CPLUS_HAVE_NETINET_IN_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_SYS_TYPES_H ${LOG4CPLUS_HAVE_SYS_TYPES_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_SYS_SOCKET_H ${LOG4CPLUS_HAVE_SYS_SOCKET_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_SYS_STAT_H ${LOG4CPLUS_HAVE_SYS_STAT_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_SYS_TIMEB_H ${LOG4CPLUS_HAVE_SYS_TIMEB_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_SYS_TIME_H ${LOG4CPLUS_HAVE_SYS_TIME_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_TIME_H ${LOG4CPLUS_HAVE_TIME_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_NETDB_H ${LOG4CPLUS_HAVE_NETDB_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_UNISTD_H ${LOG4CPLUS_HAVE_UNISTD_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_ERRNO_H ${LOG4CPLUS_HAVE_ERRNO_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_STDARG_H ${LOG4CPLUS_HAVE_STDARG_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_STDIO_H ${LOG4CPLUS_HAVE_STDIO_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_WCHAR_H ${LOG4CPLUS_HAVE_WCHAR_H}

/* */
#cmakedefine LOG4CPLUS_HAVE_FTIME ${LOG4CPLUS_HAVE_FTIME}

/* */
#cmakedefine LOG4CPLUS_HAVE_GETADDRINFO ${LOG4CPLUS_HAVE_GETADDRINFO}

/* */
#cmakedefine LOG4CPLUS_HAVE_GETHOSTBYNAME_R ${LOG4CPLUS_HAVE_GETHOSTBYNAME_R}

/* */
#cmakedefine LOG4CPLUS_HAVE_GETPID ${LOG4CPLUS_HAVE_GETPID}

/* */
#cmakedefine LOG4CPLUS_HAVE_GETTIMEOFDAY ${LOG4CPLUS_HAVE_GETTIMEOFDAY}

/* */
#cmakedefine LOG4CPLUS_HAVE_GMTIME_R ${LOG4CPLUS_HAVE_GMTIME_R}

/* */
#cmakedefine LOG4CPLUS_HAVE_HTONL ${LOG4CPLUS_HAVE_HTONL}

/* */
#cmakedefine LOG4CPLUS_HAVE_HTONS ${LOG4CPLUS_HAVE_HTONS}

/* */
#cmakedefine LOG4CPLUS_HAVE_LOCALTIME_R ${LOG4CPLUS_HAVE_LOCALTIME_R}

/* */
#cmakedefine LOG4CPLUS_HAVE_LSTAT ${LOG4CPLUS_HAVE_LSTAT}

/* */
#cmakedefine LOG4CPLUS_HAVE_NTOHL ${LOG4CPLUS_HAVE_NTOHL}

/* */
#cmakedefine LOG4CPLUS_HAVE_NTOHS ${LOG4CPLUS_HAVE_NTOHS}

/* */
#cmakedefine LOG4CPLUS_HAVE_STAT ${LOG4CPLUS_HAVE_STAT}

/* Define if this is a single-threaded library. */
#cmakedefine LOG4CPLUS_SINGLE_THREADED ${LOG4CPLUS_SINGLE_THREADED}

/* */
#cmakedefine LOG4CPLUS_USE_PTHREADS ${LOG4CPLUS_USE_PTHREADS}

/* Define for compilers/standard libraries that support more than just the "C"
   locale. */
#cmakedefine LOG4CPLUS_WORKING_LOCALE ${LOG4CPLUS_WORKING_LOCALE}

/* Define to int if undefined. */
#cmakedefine socklen_t ${socklen_t}

/* Defined for --enable-debugging builds. */
#cmakedefine LOG4CPLUS_DEBUGGING ${LOG4CPLUS_DEBUGGING}

/* Defined if the compiler understands __declspec(export) or __attribute__((export)) construct. */
#cmakedefine LOG4CPLUS_DECLSPEC_EXPORT ${LOG4CPLUS_DECLSPEC_EXPORT}

/* Defined if the compiler understands __declspec(import) or __attribute__((import)) construct. */
#cmakedefine LOG4CPLUS_DECLSPEC_IMPORT ${LOG4CPLUS_DECLSPEC_IMPORT}

/* Defined if the host OS provides ENAMETOOLONG errno value. */
#cmakedefine LOG4CPLUS_HAVE_ENAMETOOLONG ${LOG4CPLUS_HAVE_ENAMETOOLONG}

/* Define to ${} if you have the `clock_gettime' function. */
#cmakedefine LOG4CPLUS_HAVE_CLOCK_GETTIME ${LOG4CPLUS_HAVE_CLOCK_GETTIME}

#endif // LOG4CPLUS_CONFIG_DEFINES_HXX
