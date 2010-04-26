SET(LIBNFC_DRIVER_ACR122 ON CACHE BOOL "Enable ACR122 support (Depends on PC/SC)")
SET(LIBNFC_DRIVER_PN531_USB ON CACHE BOOL "Enable PN531_USB support (Depends on libusb)")
SET(LIBNFC_DRIVER_PN533_USB ON CACHE BOOL "Enable PN533_USB support (Depends on libusb)")
SET(LIBNFC_DRIVER_ARYGON ON CACHE BOOL "Enable ARYGON support (Use serial port)")
SET(LIBNFC_DRIVER_PN532_UART OFF CACHE BOOL "Enable PN533_USB support (Use serial port)")

IF(LIBNFC_DRIVER_ACR122)
  FIND_PACKAGE(PCSC REQUIRED)
  ADD_DEFINITIONS("-DDRIVER_ACR122_ENABLED")
  SET(DRIVERS_SOURCES ${DRIVERS_SOURCES} "drivers/acr122")
ENDIF(LIBNFC_DRIVER_ACR122)

IF(LIBNFC_DRIVER_PN531_USB)
  FIND_PACKAGE(LIBUSB REQUIRED)
  ADD_DEFINITIONS("-DDRIVER_PN531_USB_ENABLED")
  SET(DRIVERS_SOURCES ${DRIVERS_SOURCES} "drivers/pn531_usb" "drivers/pn53x_usb.c")
ENDIF(LIBNFC_DRIVER_PN531_USB)

IF(LIBNFC_DRIVER_PN533_USB)
  FIND_PACKAGE(LIBUSB REQUIRED)
  ADD_DEFINITIONS("-DDRIVER_PN533_USB_ENABLED") 
  SET(DRIVERS_SOURCES ${DRIVERS_SOURCES} "drivers/pn533_usb" "drivers/pn53x_usb.c")
ENDIF(LIBNFC_DRIVER_PN533_USB)

IF(LIBNFC_DRIVER_ARYGON)
  ADD_DEFINITIONS("-DDRIVER_ARYGON_ENABLED")
  SET(DRIVERS_SOURCES drivers/arygon)
ENDIF(LIBNFC_DRIVER_ARYGON)

IF(LIBNFC_DRIVER_PN532_UART)
  ADD_DEFINITIONS("-DDRIVER_PN532_UART_ENABLED")
  SET(DRIVERS_SOURCES drivers/pn532_uart)
ENDIF(LIBNFC_DRIVER_PN532_UART)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/drivers)

