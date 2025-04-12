#include "../common.h"

void * lineedit(const char * text, void * parent) {
    QString qstring(text);
    return new QLineEdit(qstring, static_cast<QWidget *>(parent));
}

void lineedit_connect_text_changed(void * pwidget, void (*callback)(const char *)) {
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    QObject::connect(lineedit, &QLineEdit::textChanged, lineedit, [callback](const QString & qstring) {
        std::string s = qstring.toStdString();
        callback(s.data());
    });
}

void lineedit_disconnect_text_changed_all(void * pwidget) {
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    bool result = QObject::disconnect(lineedit, &QLineEdit::textChanged, lineedit, nullptr);

    if (!result) {
        qWarning("failed to disconnect text changed signal");
    }    
}

void lineedit_connect_editing_finished(void * pwidget, void (*callback)()) {
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    QObject::connect(lineedit, &QLineEdit::editingFinished, lineedit, callback);
}

void lineedit_disconnect_editing_finished_all(void * pwidget) {
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    bool result = QObject::disconnect(lineedit, &QLineEdit::editingFinished, lineedit, nullptr);

    if (!result) {
        qWarning("failed to disconnect editing finished signal");
    }    
}

void lineedit_connect_return_pressed(void * pwidget, void (*callback)()) {
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    QObject::connect(lineedit, &QLineEdit::returnPressed, lineedit, callback);
}

void lineedit_disconnect_return_pressed_all(void * pwidget) {
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    bool result = QObject::disconnect(lineedit, &QLineEdit::returnPressed, lineedit, nullptr);

    if (!result) {
        qWarning("failed to disconnect return pressed signal");
    }    
}

void lineedit_connect_cursor_position_changed(void * pwidget, void (*callback)(int, int)) {
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    QObject::connect(lineedit, &QLineEdit::cursorPositionChanged, lineedit, callback);
}

void lineedit_disconnect_cursor_position_changed_all(void * pwidget) {
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    bool result = QObject::disconnect(lineedit, &QLineEdit::cursorPositionChanged, lineedit, nullptr);
    
    if (!result) {
        qWarning("failed to disconnect cursor position changed signal");
    }
}

void lineedit_set_geometry(void * pwidget, QRect rect) {
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    lineedit -> setGeometry(rect);
}

void lineedit_set_geometry2(void * pwidget, int x, int y, int width, int height) {
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    lineedit -> setGeometry(x, y, width, height);
}


void lineedit_set_text(void * pwidget, const char * text) {
    QString qstring(text);
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    lineedit -> setText(qstring);
}