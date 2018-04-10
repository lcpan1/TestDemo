QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

contains(QT_ARCH, i386) {    
    TARGET = test32
}else{
    TARGET = test64
}

TEMPLATE = app

SOURCES += main.cpp\
        widget.cpp

HEADERS  += widget.h

FORMS    += widget.ui


win32{
    contains(DEFINES, WIN64){                   #x64
        CONFIG(debug,debug|release){            #debug
            contains(TEMPLATE,"lib"){
                DESTDIR = $$PWD/../projects/x64/Debug/lib       #lib
                DLLDESTDIR = $$PWD/../projects/x64/Debug/dll    #dll
            }else{
                DESTDIR = $$PWD/../projects/x64/Debug/bin       #bin
            }
        }else{                                  #release
            contains(TEMPLATE,"lib"){
                DESTDIR = $$PWD/../projects/x64/Release/lib     #lib
                DLLDESTDIR = $$PWD/../projects/x64/Release/dll  #dll
            }else{
                DESTDIR = $$PWD/../projects/x64/Release/bin     #bin
            }
        }
    }else{                                      #x86
        CONFIG(debug,debug|release){
            contains(TEMPLATE,"lib"){
                DESTDIR = $$PWD/../projects/x32/Debug/lib
                DLLDESTDIR = $$PWD/../projects/x32/Debug/dll
            }else{
                DESTDIR = $$PWD/../projects/x32/Debug/bin
            }
        }else{
            contains(TEMPLATE,"lib"){
                DESTDIR = $$PWD/../projects/x32/Release/lib
                DLLDESTDIR = $$PWD/../projects/x32/Release/dll
            }else{
                DESTDIR = $$PWD/../projects/x32/Release/bin
            }
        }

    }
}else{
    DESTDIR = $${PWD}/../bin  #unix
}