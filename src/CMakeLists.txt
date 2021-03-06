set (log4cplus_sources
      appenderattachableimpl.cxx
      appender.cxx
      asyncappender.cxx
      clogger.cxx
      configurator.cxx
      consoleappender.cxx
      env.cxx
      factory.cxx
      fileappender.cxx
      filter.cxx
      global-init.cxx
      hierarchy.cxx
      hierarchylocker.cxx
      layout.cxx
      logger.cxx
      loggerimpl.cxx
      loggingevent.cxx
      loggingmacros.cxx
      loglevel.cxx
      loglog.cxx
      logloguser.cxx
      mdc.cxx
      ndc.cxx
      nullappender.cxx
      objectregistry.cxx
      patternlayout.cxx
      pointer.cxx
      property.cxx
      queue.cxx
      rootlogger.cxx
      sleep.cxx
      snprintf.cxx
      socketappender.cxx
      socketbuffer.cxx
      socket.cxx
      stringhelper.cxx
      stringhelper-clocale.cxx
      stringhelper-cxxlocale.cxx
      stringhelper-iconv.cxx
      syncprims.cxx
      syslogappender.cxx
      threads.cxx
      timehelper.cxx
      tls.cxx
      version.cxx

)
set ( log4cplus_headers
    ../include/log4cplus/socketappender.h
    ../include/log4cplus/hierarchy.h
    ../include/log4cplus/hierarchylocker.h
    ../include/log4cplus/version.h
    ../include/log4cplus/syslogappender.h
    ../include/log4cplus/tchar.h
    ../include/log4cplus/loggingmacros.h
    ../include/log4cplus/helpers/property.h
    ../include/log4cplus/helpers/socketbuffer.h
    ../include/log4cplus/helpers/sleep.h
    ../include/log4cplus/helpers/thread-config.h
    ../include/log4cplus/helpers/timehelper.h
    ../include/log4cplus/helpers/logloguser.h
    ../include/log4cplus/helpers/stringhelper.h
    ../include/log4cplus/helpers/socket.h
    ../include/log4cplus/helpers/snprintf.h
    ../include/log4cplus/helpers/appenderattachableimpl.h
    ../include/log4cplus/helpers/pointer.h
    ../include/log4cplus/helpers/queue.h
    ../include/log4cplus/helpers/loglog.h
    ../include/log4cplus/win32consoleappender.h
    ../include/log4cplus/tstring.h
    ../include/log4cplus/config/windowsh-inc.h
    ../include/log4cplus/config/macosx.h
    ../include/log4cplus/config/win32.h
    ../include/log4cplus/configurator.h
    ../include/log4cplus/win32debugappender.h
    ../include/log4cplus/clogger.h
    ../include/log4cplus/fstreams.h
    ../include/log4cplus/ndc.h
    ../include/log4cplus/nullappender.h
    ../include/log4cplus/tracelogger.h
    ../include/log4cplus/streams.h
    ../include/log4cplus/logger.h
    ../include/log4cplus/internal/env.h
    ../include/log4cplus/internal/socket.h
    ../include/log4cplus/internal/internal.h
    ../include/log4cplus/fileappender.h
    ../include/log4cplus/asyncappender.h
    ../include/log4cplus/layout.h
    ../include/log4cplus/spi/objectregistry.h
    ../include/log4cplus/spi/filter.h
    ../include/log4cplus/spi/loggerimpl.h
    ../include/log4cplus/spi/factory.h
    ../include/log4cplus/spi/loggingevent.h
    ../include/log4cplus/spi/rootlogger.h
    ../include/log4cplus/spi/appenderattachable.h
    ../include/log4cplus/spi/loggerfactory.h
    ../include/log4cplus/consoleappender.h
    ../include/log4cplus/mdc.h
    ../include/log4cplus/loglevel.h
    ../include/log4cplus/thread/threads.h
    ../include/log4cplus/thread/impl/tls.h
    ../include/log4cplus/thread/impl/threads-impl.h
    ../include/log4cplus/thread/impl/syncprims-win32.h
    ../include/log4cplus/thread/impl/syncprims-pthreads.h
    ../include/log4cplus/thread/impl/syncprims-impl.h
    ../include/log4cplus/thread/impl/syncprims-pmsm.h
    ../include/log4cplus/thread/syncprims.h
    ../include/log4cplus/thread/syncprims-pub-impl.h
    ../include/log4cplus/nteventlogappender.h
    ../include/log4cplus/appender.h

)

set ( log4cplus_libraries
    ${CMAKE_THREAD_LIBS_INIT}
)

#message (STATUS "Type: ${UNIX}|${CYGWIN}|${WIN32}")

# Uncomment the following line to get locale aware string conversions.
#add_definitions (-DLOG4CPLUS_WORKING_LOCALE)

if( PACK_ROLLED_FILES )
    find_package(Boost COMPONENTS iostreams)
    if ( Boost_FOUND )
        add_definitions(-DPACK_ROLLED_FILES)
        include_directories(${Boost_INCLUDE_DIRS})
        set ( log4cplus_libraries ${log4cplus_libraries} ${Boost_LIBRARIES} )
    endif()
endif()


if ("${UNIX}" OR "${CYGWIN}")
  set (log4cplus_sources ${log4cplus_sources}
    socket-unix.cxx)
elseif (WIN32)
  set (log4cplus_sources ${log4cplus_sources}
    nteventlogappender.cxx
    socket-win32.cxx
    win32consoleappender.cxx
    win32debugappender.cxx)

  # Comment out the following lines if you want non-Unicode version.
  add_definitions (-DUNICODE -D_UNICODE -UMBCS -U_MBCS)
  set (log4cplus_postfix "${log4cplus_postfix}U")

  #add_definitions (-DLOG4CPLUS_STATIC)
  #set (log4cplus_postfix "${log4cplus_postfix}S")
endif ()


add_library (log4cplus ${log4cplus_sources} ${log4cplus_headers})
target_link_libraries (log4cplus ${log4cplus_libraries})

set_target_properties (log4cplus PROPERTIES
  VERSION "${log4cplus_version_major}.${log4cplus_version_minor}.${log4cplus_version_patch}"
  SOVERSION "${log4cplus_soversion}"
  COMPILE_FLAGS "-DINSIDE_LOG4CPLUS")

if (WIN32)
  set_target_properties (log4cplus PROPERTIES
    DEBUG_POSTFIX "${log4cplus_postfix}D"
    RELEASE_POSTFIX "${log4cplus_postfix}"
    MINSIZEREL_POSTFIX "${log4cplus_postfix}"
    RELWITHDEBINFO_POSTFIX "${log4cplus_postfix}")
  target_link_libraries (log4cplus ws2_32 advapi32)
endif ()

install(TARGETS log4cplus LIBRARY DESTINATION lib
                          ARCHIVE DESTINATION lib
                          RUNTIME DESTINATION bin)

install(FILES ../include/log4cplus/appender.h
              ../include/log4cplus/asyncappender.h
              ../include/log4cplus/clogger.h
              ../include/log4cplus/config.hxx
              ../include/log4cplus/configurator.h
              ../include/log4cplus/consoleappender.h
              ../include/log4cplus/fileappender.h
              ../include/log4cplus/fstreams.h
              ../include/log4cplus/hierarchy.h
              ../include/log4cplus/hierarchylocker.h
              ../include/log4cplus/layout.h
              ../include/log4cplus/logger.h
              ../include/log4cplus/loggingmacros.h
              ../include/log4cplus/loglevel.h
              ../include/log4cplus/mdc.h
              ../include/log4cplus/ndc.h
              ../include/log4cplus/nteventlogappender.h
              ../include/log4cplus/nullappender.h
              ../include/log4cplus/socketappender.h
              ../include/log4cplus/streams.h
              ../include/log4cplus/syslogappender.h
              ../include/log4cplus/tchar.h
              ../include/log4cplus/tracelogger.h
              ../include/log4cplus/tstring.h
              ../include/log4cplus/version.h
              ../include/log4cplus/win32debugappender.h
              ../include/log4cplus/win32consoleappender.h
        DESTINATION include/log4cplus )

install(FILES ../include/log4cplus/boost/deviceappender.hxx
        DESTINATION include/log4cplus/boost )


install(FILES ../include/log4cplus/helpers/appenderattachableimpl.h
              ../include/log4cplus/helpers/loglog.h
              ../include/log4cplus/helpers/logloguser.h
              ../include/log4cplus/helpers/pointer.h
              ../include/log4cplus/helpers/property.h
              ../include/log4cplus/helpers/queue.h
              ../include/log4cplus/helpers/sleep.h
              ../include/log4cplus/helpers/snprintf.h
              ../include/log4cplus/helpers/socket.h
              ../include/log4cplus/helpers/socketbuffer.h
              ../include/log4cplus/helpers/stringhelper.h
              ../include/log4cplus/helpers/thread-config.h
              ../include/log4cplus/helpers/timehelper.h
        DESTINATION include/log4cplus/helpers )

install(FILES ../include/log4cplus/internal/env.h
              ../include/log4cplus/internal/internal.h
              ../include/log4cplus/internal/socket.h
        DESTINATION include/log4cplus/internal )

install(FILES ../include/log4cplus/spi/appenderattachable.h
              ../include/log4cplus/spi/factory.h
              ../include/log4cplus/spi/filter.h
              ../include/log4cplus/spi/loggerfactory.h
              ../include/log4cplus/spi/loggerimpl.h
              ../include/log4cplus/spi/loggingevent.h
              ../include/log4cplus/spi/objectregistry.h
              ../include/log4cplus/spi/rootlogger.h
        DESTINATION include/log4cplus/spi )

install(FILES ../include/log4cplus/thread/impl/syncprims-impl.h
#              ../include/log4cplus/thread/impl/syncprims-pmsm.h
              ../include/log4cplus/thread/impl/syncprims-pthreads.h
              ../include/log4cplus/thread/impl/syncprims-win32.h
              ../include/log4cplus/thread/impl/threads-impl.h
              ../include/log4cplus/thread/impl/tls.h
        DESTINATION include/log4cplus/thread/impl )

install(FILES ../include/log4cplus/thread/syncprims-pub-impl.h
              ../include/log4cplus/thread/syncprims.h
              ../include/log4cplus/thread/threads.h
        DESTINATION include/log4cplus/thread )

install(FILES ../include/log4cplus/config/macosx.h
              ../include/log4cplus/config/win32.h
              ../include/log4cplus/config/windowsh-inc.h
              ${CMAKE_BINARY_DIR}/include/log4cplus/config/defines.hxx
        DESTINATION include/log4cplus/config )

