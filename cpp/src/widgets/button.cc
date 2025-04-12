#include "../common.h"

// constructors
void * push_button(const char * text, void * parent) {
    QString string(text);
    return new QPushButton(string, static_cast<QWidget *>(parent));
}

void * radio_button(const char * text, void * parent) {
    QString string(text);
    return new QRadioButton(string, static_cast<QWidget *>(parent));
}


// slots
void button_connect_clicked(void * pwidget, void (*callback)(bool)) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    QObject::connect(button, &QAbstractButton::clicked, button, callback);
}

void button_disconnect_clicked_all(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    bool result = QObject::disconnect(button, &QAbstractButton::clicked, button, nullptr);

    if (!result) {
        qWarning("failed to disconnect clicked signal");
    }
}

void button_connect_pressed(void * pwidget, void (*callback)()) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    QObject::connect(button, &QAbstractButton::pressed, button, callback);
}

void button_disconnect_pressed_all(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    bool result = QObject::disconnect(button, &QAbstractButton::pressed, button, nullptr);

    if (!result) {
        qWarning("failed to disconnect pressed signal");
    }
}

void button_connect_released(void * pwidget, void (*callback)()) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    QObject::connect(button, &QAbstractButton::released, button, callback);
}

void button_disconnect_released(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    bool result = QObject::disconnect(button, &QAbstractButton::released, button, nullptr);

    if (!result) {
        qWarning("failed to disconnect released signal");
    }    
}

void radiobutton_connect_toggled(void * pwidget, void (*callback)(bool)) {
    QRadioButton * radiobutton = static_cast<QRadioButton*>(pwidget);
    QObject::connect(radiobutton, &QRadioButton::toggled, radiobutton, callback);
}

void radiobutton_disconnect_toggled_all(void * pwidget) {
    QRadioButton * radiobutton = static_cast<QRadioButton*>(pwidget);
    bool result = QObject::disconnect(radiobutton, &QRadioButton::toggled, radiobutton, nullptr);

    if (!result) {
        qWarning("failed to disconnect toggled signal");
    }
}

// property
bool button_auto_exclusive(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    return button->autoExclusive();
}

void button_set_auto_exclusive(void * pwidget, bool auto_exclusive) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button->setAutoExclusive(auto_exclusive);
}

bool button_auto_repeat(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    return button->autoRepeat();
}

void button_set_auto_repeat(void * pwidget, bool auto_repeat) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button->setAutoRepeat(auto_repeat);
}

int button_auto_repeat_delay(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    return button->autoRepeatDelay();
}

void button_set_auto_repeat_delay(void * pwidget, int delay) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button->setAutoRepeatDelay(delay);
}

int button_auto_repeat_interval(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    return button->autoRepeatInterval();
}

void button_set_auto_repeat_interval(void * pwidget, int interval) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button->setAutoRepeatInterval(interval);
}

bool button_checkable(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    return button->isCheckable();
}

void button_set_checkable(void * pwidget, bool checkable) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button->setCheckable(checkable);
}

bool button_down(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    return button->isDown();
}

void button_set_down(void * pwidget, bool down) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button->setDown(down);
}

void * button_icon(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    return new QIcon(button->icon());
}

void button_set_icon(void * pwidget, void * picon) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    QIcon * icon = static_cast<QIcon*>(picon);
    button->setIcon(*icon);
}

void * button_icon_size(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    return new QSize(button->iconSize());
}

void button_set_icon_size(void * pwidget, int width, int height) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button->setIconSize(QSize(width, height));
}

void * button_shortcut(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    return new QKeySequence(button -> shortcut());
}

void button_set_shortcut(void * pwidget, const char * key) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button -> setShortcut(QKeySequence(key));
}

const char * button_text(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    std::string string = (button -> text()).toStdString();
    char * cstring = new char[string.size() + 1];
    strncpy(cstring, string.c_str(), string.size());

    return cstring;
}

void button_set_text(void * pwidget, const char * text) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button -> setText(QString(text));
}
//------------------------------
// qbutton setstylesheet prototype
void button_set_stylesheet(void * pwidget, const char * text) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button -> setStyleSheet(QString(text));
}

//------------------------------

void free_char_sequence(const char * str) {
    delete [] str;
}

void button_click(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button -> click();
}

void button_animate_click(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button -> animateClick();
}

void button_set_checked(void * pwidget, bool checked) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button -> setChecked(checked);
}

void button_toggle(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button -> toggle();
}

void button_set_geometry(void * pwidget, QRect rect) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button -> setGeometry(rect);
}

void button_set_geometry2(void * pwidget, int x, int y, int width, int height) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button -> setGeometry(x, y, width, height);
}

