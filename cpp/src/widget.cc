#ifndef __QT_WRAPPER_CC__
#define __QT_WRAPPER_CC__

#include <QApplication>
#include <QLabel>
#include <QPushButton>
#include <QtCore/qstring.h>
#include <QLayout>
#endif

void * widget(void * parent) {
    return new QWidget(static_cast<QWidget *>(parent));
}

void set_title(void * widget, const char * title) {
    static_cast<QWidget *>(widget)->setWindowTitle(title);
}

void show_widget(void * widget) {
    static_cast<QWidget *>(widget)->show();
}

void resize(void * widget, int width, int height) {
    static_cast<QWidget *>(widget)->resize(width, height);
}

void move(void * widget, int x, int y) {
    static_cast<QWidget *>(widget)->move(x, y);
}

void set_geometry(void * widget, int x, int y, int width, int height) {
    static_cast<QWidget *>(widget)->setGeometry(x, y, width, height);
}

void set_layout(void * widget, void * layout) {
    static_cast<QWidget *>(widget)->setLayout(static_cast<QLayout *>(layout));
}