#include "../common.h"

void * dialog(void * parent) {
    return new QDialog(static_cast<QWidget *>(parent));		//return new QDialog(static_cast<QDialog *>(parent))
}


//bool	isSizeGripEnabled() const
//int	result() const
//void	setModal(bool modal)
//void	setResult(int i)
//void	setSizeGripEnabled(bool)
/*
virtual QSize	minimumSizeHint() const override
virtual void	setVisible(bool visible) override
virtual QSize	sizeHint() const override
*/
//----------------------------------------
bool is_SizeGripEnabled(void * pwidget) {
    QDialog * dialog = static_cast<QDialog*>(pwidget);
	return (dialog -> isSizeGripEnabled());
}

bool q_result(void * pwidget) {
    QDialog * dialog = static_cast<QDialog*>(pwidget);
	return (dialog -> result());
}

void set_modal(void * dialog, bool modal) {
    static_cast<QDialog *>(dialog)->setModal(modal);
}

void set_result(void * dialog, int i) {
    static_cast<QDialog *>(dialog)->setResult(i);
}

void set_SizeGripEnabled(void * dialog, bool modal) {
    static_cast<QDialog *>(dialog)->setSizeGripEnabled(modal);
}



//----------------------------------------
/*
void set_title(void * dialog, const char * title) {
    static_cast<QDialog *>(dialog)->setWindowTitle(title);
}

void show_widget(void * dialog) {
    static_cast<QDialog *>(dialog)->show();
}

void resize(void * dialog, int width, int height) {
    static_cast<QDialog *>(dialog)->resize(width, height);
}

void move(void * dialog, int x, int y) {
    static_cast<QDialog *>(dialog)->move(x, y);
}

void set_geometry(void * dialog, int x, int y, int width, int height) {
    static_cast<QDialog *>(dialog)->setGeometry(x, y, width, height);
}

void set_layout(void * dialog, void * layout) {
    static_cast<QDialog *>(dialog)->setLayout(static_cast<QLayout *>(layout));
}

void set_stylesheet(void * dialog, const char * text) {
    static_cast<QDialog *>(dialog)->setStyleSheet(text);

*/