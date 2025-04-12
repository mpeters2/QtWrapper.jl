#include "common.h"

void * application(int argc, char ** argv) {
    return new QApplication(argc, argv);
}

void exec(void * app) {
    QApplication * qapp = static_cast<QApplication *>(app);
    qapp->exec();
}

QStyle * app_style(void * app) {
    QApplication * qapp = static_cast<QApplication *>(app);
    return (qapp->style());
}
/*
void app_set_style(void * app, QStyle *style) {
    QApplication * qapp = static_cast<QApplication *>(app);
    qapp -> setStyle(style);
}
*/
void app_set_style(void * app, const char * text) 
{
	QString qstring(text);
    QApplication * qapp = static_cast<QApplication *>(app);
    qapp -> setStyle( QStyleFactory::create(qstring));
}

//void QApplication::setStyle(QStyle *style)

//QApplication::setStyle(QStyleFactory::create("macintosh"));