load(qttest_p4)

QT += multimediakit-private
CONFIG += no_private_qt_headers_warning

SOURCES += \
    tst_qmediabindableinterface.cpp

include (../qmultimedia_common/mock.pri)
include (../qmultimedia_common/mockrecorder.pri)