#include "../common.h"

// Debug code -------------------
/*
void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{	FILE* outfile;
	outfile = fopen("/Users/MattPetersonsAccount/.julia/packages/QtWrapper/wg9NK/errLog.txt","a");
    QByteArray localMsg = msg.toLocal8Bit();
    switch (type) {
    case QtDebugMsg:
        fprintf(outfile, "Debug: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtInfoMsg:
        fprintf(outfile, "Info: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtWarningMsg:
        fprintf(outfile, "Warning: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtCriticalMsg:
        fprintf(outfile, "Critical: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtFatalMsg:
        fprintf(stderr, "Fatal: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        abort();
	default:
		fprintf(outfile, "default: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
		break;
    }
	fflush(outfile);
}

void secondaryMessageOutput(char* msg1, const char *  msg2)
{	FILE* outfile;
	outfile = fopen("/Users/MattPetersonsAccount/.julia/packages/QtWrapper/wg9NK/textLog.txt","a");

	fprintf(outfile, "outtext: %s: '%s' \n", msg1, msg2);
 	fflush(outfile);
}
*/
// Debug code END -------------------

void * textedit(const char * text, void * parent) {
    QString qstring(text);
    return new QTextEdit(qstring, static_cast<QWidget *>(parent));
}
// Only add functions that I call

void textedit_set_geometry(void * pwidget, QRect rect) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    textedit -> setGeometry(rect);
}

void textedit_set_geometry2(void * pwidget, int x, int y, int width, int height) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    textedit -> setGeometry(x, y, width, height);
}

void textedit_set_plain_text(void * pwidget, const char * text) {
	//qInstallMessageHandler(myMessageOutput); // Install the handler
	//qDebug() << text;
	//secondaryMessageOutput((char*)"text",text);
	
	QString qstring(text);
 
	//qDebug() << qstring;
	//secondaryMessageOutput((char*)"qstring", qstring.toUtf8().data());	
	
	QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    textedit -> setPlainText(qstring);
//    textedit -> setPlainText(text);

}

const char * textedit_to_plain_text(void * pwidget) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);

	std::string string = (textedit -> toPlainText()).toStdString();
    char * cstring = new char[string.size() + 1];
    strncpy(cstring, string.c_str(), string.size());
    return cstring;
}


void textedit_set_stylesheet(void * pwidget, const char * text) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    textedit -> setStyleSheet(QString(text));
}

void textedit_set_readonly(void * pwidget, bool value) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    textedit -> setReadOnly(value);
}
/*
self.displayBox.setObjectName(u"displayBox")
	self.displayBox.setGeometry(QRect(10, 10, 241, 50))
self.displayBox.setStyleSheet(u"background-color: rgb(255, 255, 255);")
	self.displayBox.setPlainText( str(self.equation) )

Inherited
--------
self.displayBox.show()
setStyleSheet
setObjectName
*/

/*
// stuff from lineedit
void textedit_connect_text_changed(void * pwidget, void (*callback)(const char *)) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    QObject::connect(textedit, &QTextEdit::textChanged, textedit, [callback](const QString & qstring) {
        std::string s = qstring.toStdString();
        callback(s.data());
    });
}

void textedit_disconnect_text_changed_all(void * pwidget) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    bool result = QObject::disconnect(textedit, &QTextEdit::textChanged, textedit, nullptr);

    if (!result) {
        qWarning("failed to disconnect text changed signal");
    }    
}

void textedit_connect_editing_finished(void * pwidget, void (*callback)()) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    QObject::connect(textedit, &QTextEdit::editingFinished, textedit, callback);
}

void textedit_disconnect_editing_finished_all(void * pwidget) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    bool result = QObject::disconnect(textedit, &QTextEdit::editingFinished, textedit, nullptr);

    if (!result) {
        qWarning("failed to disconnect editing finished signal");
    }    
}

void textedit_connect_return_pressed(void * pwidget, void (*callback)()) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    QObject::connect(textedit, &QTextEdit::returnPressed, textedit, callback);
}

void textedit_disconnect_return_pressed_all(void * pwidget) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    bool result = QObject::disconnect(textedit, &QTextEdit::returnPressed, textedit, nullptr);

    if (!result) {
        qWarning("failed to disconnect return pressed signal");
    }    
}

void textedit_connect_cursor_position_changed(void * pwidget, void (*callback)(int, int)) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    QObject::connect(textedit, &QTextEdit::cursorPositionChanged, textedit, callback);
}

void textedit_disconnect_cursor_position_changed_all(void * pwidget) {
    QTextEdit * textedit = static_cast<QTextEdit*>(pwidget);
    bool result = QObject::disconnect(textedit, &QTextEdit::cursorPositionChanged, textedit, nullptr);
    
    if (!result) {
        qWarning("failed to disconnect cursor position changed signal");
    }
}
	*/




