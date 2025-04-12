#include "../common.h"
//====================================================================
#include <QDebug>
FILE* debugOut;

void openDebugFiles(void)
{
	debugOut = fopen("debug.txt","a");


}
/*

	openDebugFiles();
	fprintf(debugOut, "------------------------------\n"); fflush(debugOut);
	fprintf(debugOut, "pre-FileDialogContantsToQflag\n"); fflush(debugOut);

	//QFileDialog::Options optionQFlags = FileDialogContantsToQflag(options);
	fprintf(debugOut, "post-FileDialogContantsToQflag\n"); fflush(debugOut);
	*/

//====================================================================

void * qfiledialog(QWidget * parent) {
    return new QFileDialog(static_cast<QWidget *>(parent));
}
//-----------------------------------------------------------------------------
/*	In the original C++ QT, QFileDialog::Options are QFlag objects that are
	ORed together to set a file dialog's options.
	Only the Julia side, we use constant for the QFileDialog::Options and OR
	them together to set a file dialog's options.

	FileDialogContantsToQflag() translates the Julia options integer to a QFlag
	that we can pass the QT C++ filedialog functions.
*/

QFileDialog::Options	FileDialogContantsToQflag(int	options)
{	
	QFileDialog::Options  optionFlags;

	if(options & 0x00000001)	{
		if (optionFlags == 0)
			optionFlags = QFileDialog::ShowDirsOnly;
		else
			optionFlags = optionFlags| QFileDialog::ShowDirsOnly;
	}
	if(options & 0x00000002)	{
		if (optionFlags == 0)
			optionFlags = QFileDialog::DontResolveSymlinks;
		else
			optionFlags = optionFlags| QFileDialog::DontResolveSymlinks;
	}
	if(options & 0x00000004)	{
		if (optionFlags == 0)
			optionFlags = QFileDialog::DontConfirmOverwrite;
		else
			optionFlags = optionFlags| QFileDialog::DontConfirmOverwrite;
	}
	if(options & 0x00000008)	{
		if(optionFlags == 0)
			optionFlags = QFileDialog::DontUseNativeDialog;
		else
			optionFlags = optionFlags| QFileDialog::DontUseNativeDialog;
	}
	if(options & 0x00000010)	{
		if(optionFlags == 0)
			optionFlags = QFileDialog::ReadOnly;
		else
			optionFlags = optionFlags| QFileDialog::ReadOnly;
	}
	if(options & 0x00000020)	{
		if(optionFlags == 0)
			optionFlags = QFileDialog::HideNameFilterDetails;
		else
			optionFlags = optionFlags| QFileDialog::HideNameFilterDetails;
	}
	if(options & 0x00000040)	{
		if(optionFlags == 0)
			optionFlags = QFileDialog::DontUseCustomDirectoryIcons;
		else
			optionFlags = optionFlags| QFileDialog::DontUseCustomDirectoryIcons;
	}
	return optionFlags;


}



//-----------------------------------------------------------------------------
/*
getExistingDirectory(QWidget *parent = nullptr, 
					const QString &caption = QString(), 
					const QString &dir = QString(), 
					QFileDialog::Options options = ShowDirsOnly)
*/

//const char * get_existing_directory(QWidget * parent, const char * caption, const char * dir, int options = 1) 
const char * get_existing_directory(QWidget * parent, const char * caption, const char * dir, uint32_t options)// QFileDialog::Options options = QFileDialog::ShowDirsOnly) 
{
	QFileDialog::Options optionQFlags = FileDialogContantsToQflag(options);

	std::string string = (QFileDialog::getExistingDirectory(0, 
											caption,
                                            dir,
                                            optionQFlags) ).toStdString();

    char * cstring = new char[string.size() + 1];
    strncpy(cstring, string.c_str(), string.size());
    return cstring;
}
//-----------------------------------------------------------------------------
/*
QString QFileDialog::getOpenFileName(QWidget *parent = nullptr, 
										const QString &caption = QString(), 
										const QString &dir = QString(), 
										const QString &filter = QString(), 
										QString *selectedFilter = nullptr, 
										QFileDialog::Options options = Options())

USING static version
QString fileName = QFileDialog::getOpenFileName(this, 										// parent
												tr("Open File"),							// caption
                                                "/home",									// dir
                                                tr("Images (*.png *.xpm *.jpg)"));			// filter

*/

// static version
const char * get_Open_FileName(QWidget * parent, const char * caption, const char * dir, const char * filter)
{
	std::string string = (QFileDialog::getOpenFileName(0, 	// writing this like a static function, so null pointer for parent
														caption,
														dir,
														filter
														).toStdString() 
							);
	char * cstring = new char[string.size() + 1];
    return cstring;
}

void doNothing(void)
{	printf("nothing");
}

/*
const char * get_Open_FileName(QWidget * parent, const char * caption, const char * dir, const char * filter, QString * selectedFilter, uint32_t options)// QFileDialog::Options options = QFileDialog::ShowDirsOnly) 
{

	openDebugFiles();
	fprintf(debugOut, "------------------------------\n"); fflush(debugOut);
	fprintf(debugOut, "pre-FileDialogContantsToQflag\n"); fflush(debugOut);

	QFileDialog::Options optionQFlags = FileDialogContantsToQflag(options);
	fprintf(debugOut, "post-FileDialogContantsToQflag\n"); fflush(debugOut);

	std::string string = (QFileDialog::getOpenFileName(0, 	// writing this like a static function, so null pointer for parent
											caption,
                                            dir,
											filter,
											selectedFilter,
                                            optionQFlags) ).toStdString();

 	fprintf(debugOut, "post-getOpenFileName\n"); fflush(debugOut);
   char * cstring = new char[string.size() + 1];
    strncpy(cstring, string.c_str(), string.size());
    return cstring;
}
*/
//--------------------------------------
/*
QString getSaveFileName(QWidget *parent = nullptr, 
						const QString &caption = QString(), 
						const QString &dir = QString(), 
						const QString &filter = QString(), 
						QString *selectedFilter = nullptr, 
						QFileDialog::Options options = Options())

STATIC version:
QString fileName = QFileDialog::getSaveFileName(
							this, 								// parent
							tr("Save File"),					// caption
                        	"/home/jana/untitled.png",			// dir
                        	tr("Images (*.png *.xpm *.jpg)"));	// filter
*/

// using static version
const char * get_Save_FileName(QWidget * parent, const char * caption, const char * dir, const char * filter)
{

	std::string string = (QFileDialog::getSaveFileName(
											0, 	// writing this like a static function, so null pointer for parent
											caption,
                                            dir,
                                            filter 
											).toStdString()
						);
    char * cstring = new char[string.size() + 1];
    strncpy(cstring, string.c_str(), string.size());
    return cstring;
}


/*
non-static version (needs some work)

const char * get_Save_FileName(QWidget * parent, const char * caption, const char * dir, const char * filter, QString *selectedFilter, QFileDialog::Options options = QFileDialog::ShowDirsOnly) 
{
	QFileDialog *dialog=new QFileDialog();
	std::string string = (QFileDialog::getSaveFileName(0, 	// writing this like a static function, so null pointer for parent
											caption,
                                            dir,
                                            filter,
											selectedFilter,
                                            options) ).toStdString();

    char * cstring = new char[string.size() + 1];
    strncpy(cstring, string.c_str(), string.size());
    return cstring;
}

*/