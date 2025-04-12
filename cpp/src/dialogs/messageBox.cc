#include "../common.h"

void * messageBox(void * parent) {
    return new QMessageBox(static_cast<QWidget *>(parent));
}

//void	addButton(QAbstractButton *button, QMessageBox::ButtonRole role)

void messageBox_add_button(void * messageBox, void * button, QMessageBox::ButtonRole role) {
    static_cast<QMessageBox *>(messageBox)->addButton(static_cast<QAbstractButton *>(button), role);
}

void messageBox_set_text(void * pwidget, const char * text) {
    QMessageBox * messageBox = static_cast<QMessageBox*>(pwidget);
    messageBox -> setText(QString(text));
}

void messageBox_set_InformativeText(void * pwidget, const char * text) {
    QMessageBox * messageBox = static_cast<QMessageBox*>(pwidget);
    messageBox -> setInformativeText(QString(text));
}

void messagebox_exec(void * pwidget) {
    QMessageBox * messageBox = static_cast<QMessageBox*>(pwidget);
    messageBox -> exec();
}

void messageBox_set_standardButtons(void * messageBox, QMessageBox::StandardButtons buttons) {
    static_cast<QMessageBox *>(messageBox)->setStandardButtons( buttons);
}

void messageBox_set_DefaultButton(void * messageBox, QMessageBox::StandardButton button) {
    static_cast<QMessageBox *>(messageBox)->setDefaultButton( button);
}

void messageBox_set_Option(void * messageBox, QMessageBox::Option option, bool on = true) 
{
    static_cast<QMessageBox *>(messageBox)->setOption( option, on);
}

void messageBox_set_style(void * messageBox, const char * text) 
{
	QString qstring(text);
    QMessageBox * qMsgBx = static_cast<QMessageBox *>(messageBox);
    qMsgBx -> setStyle( QStyleFactory::create(qstring));
}
//-=======================================================================
// Static versions of functions
/*
QMessageBox::StandardButton QMessageBox::information(
											QWidget *parent, 
											const QString &title, 
											const QString &text, 
											QMessageBox::StandardButtons buttons = Ok, 
											QMessageBox::StandardButton defaultButton = NoButton
											)
*/
// QMessageBox::StandardButton

/* Was supposed to return a QMessageBox::StandardButton, but a strategic (temporary?)
	decision was to have it return nothing.  Was originally returned void, but ccall 
	couldn't find qmessageBox_information, so I changed the return type to int.

 */

int  qmessageBox_information(QWidget * parent, const char * title, const char * text)//, QMessageBox::StandardButtons buttons = Ok, QMessageBox::StandardButton defaultButton = NoButton)
{
	QMessageBox::StandardButtons buttons = QMessageBox::Ok;
	QMessageBox::StandardButton defaultButton = QMessageBox::NoButton;

	QMessageBox::information(
								0, 				// writing this like a static function, so null pointer for parent
								title,
								text,
								buttons,
								defaultButton
								);
	return 0;
}




//void QMessageBox::setOption(QMessageBox::Option option, bool on = true)
/*
void * QMessageBox(QMessageBox::Icon icon, 
					const QString &title, 
					const QString &text, 
					QMessageBox::StandardButtons buttons = NoButton, 
					QWidget *parent = nullptr, 
					Qt::WindowFlags f = Qt::Dialog | Qt::MSWindowsFixedSizeDialogHint)
{
    return new QMessageBox(static_cast<QWidget *>(parent));
}
*/
//QDialog(QWidget *parent = nullptr, Qt::WindowFlags f = Qt::WindowFlags())

/*
QMessageBox(QMessageBox::Icon icon, const QString &title, const QString &text, QMessageBox::StandardButtons buttons = NoButton, QWidget *parent = nullptr, Qt::WindowFlags f = Qt::Dialog | Qt::MSWindowsFixedSizeDialogHint)
virtual	~QMessageBox()
QPushButton *	addButton(QMessageBox::StandardButton button)
QPushButton *	addButton(const QString &text, QMessageBox::ButtonRole role)
QAbstractButton *	button(QMessageBox::StandardButton which) const
QMessageBox::ButtonRole	buttonRole(QAbstractButton *button) const
QList<QAbstractButton *>	buttons() const
QCheckBox *	checkBox() const
QAbstractButton *	clickedButton() const
QPushButton *	defaultButton() const
QString	detailedText() const
QAbstractButton *	escapeButton() const
QMessageBox::Icon	icon() const
QPixmap	iconPixmap() const
QString	informativeText() const
void	open(QObject *receiver, const char *member)
QMessageBox::Options	options() const
void	removeButton(QAbstractButton *button)
void	setCheckBox(QCheckBox *cb)
void	setDefaultButton(QMessageBox::StandardButton button)
void	setDefaultButton(QPushButton *button)
void	setDetailedText(const QString &text)
void	setEscapeButton(QAbstractButton *button)
void	setEscapeButton(QMessageBox::StandardButton button)
void	setIcon(QMessageBox::Icon)
void	setIconPixmap(const QPixmap &pixmap)

(since 6.6) void	setOption(QMessageBox::Option option, bool on = true)
void	setOptions(QMessageBox::Options options)
void	setStandardButtons(QMessageBox::StandardButtons buttons)
void	setText(const QString &text)
void	setTextFormat(Qt::TextFormat format)
void	setTextInteractionFlags(Qt::TextInteractionFlags flags)
void	setWindowModality(Qt::WindowModality windowModality)
void	setWindowTitle(const QString &title)
QMessageBox::StandardButton	standardButton(QAbstractButton *button) const
QMessageBox::StandardButtons	standardButtons() const
(since 6.6) bool	testOption(QMessageBox::Option option) const
QString	text() const
Qt::TextFormat	textFormat() const
Qt::TextInteractionFlags	textInteractionFlags() const
*/
//----------------------------------------------------------
//----------------------------------------------------------
/*
COMPLETED
QMessageBox(QWidget *parent = nullptr)
void	addButton(QAbstractButton *button, QMessageBox::ButtonRole role)
void	setText(const QString &text)
void	setInformativeText(const QString &text)
*/




