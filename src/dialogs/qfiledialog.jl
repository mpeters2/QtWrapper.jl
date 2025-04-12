#=


=#

const    QFileDialog_ShowDirsOnly	= 0x00000001	# Only show directories. By default, both files and directories are shown. This option is only effective in the Directory file mode.
const    QFileDialog_DontResolveSymlinks	= 0x00000002	# Don't resolve symlinks. By default, symlinks are resolved.
const    QFileDialog_DontConfirmOverwrite	= 0x00000004	# Don't ask for confirmation if an existing file is selected. By default, confirmation is requested.
const    QFileDialog_DontUseNativeDialog	= 0x00000008	# Don't use a platform-native file dialog, but the widget-based one provided by Qt.
const    QFileDialog_ReadOnly	= 0x00000010	# Indicates that the model is read-only.
const    QFileDialog_HideNameFilterDetails	= 0x00000020	#Indicates if the file name filter details are hidden or not.
const    QFileDialog_DontUseCustomDirectoryIcons	= 0x00000040 # Always use the default directory icon.

export QFileDialog_ShowDirsOnly, QFileDialog_DontResolveSymlinks, QFileDialog_DontConfirmOverwrite, QFileDialog_DontUseNativeDialog
export QFileDialog_ReadOnly, QFileDialog_HideNameFilterDetails, QFileDialog_DontUseCustomDirectoryIcons




@pub mutable struct QFileDialog <: QAbstractDialog		# QtWidget
    pointer::Ptr{Nothing}

    #function QFileDialog(parent::Union{Nothing, QtWidget} = nothing)
    function QFileDialog(parent::QApplication)
        f = dlsym(libqt_wrapper[], "qfiledialog")
        pointer = ccall(f, Ptr{Nothing}, (Ptr{Nothing}, ), ptr(parent))
        result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
end

# get_Existing_Directory(QWidget * parent, const char * caption, const char * dir, QFileDialog::Options options = QFileDialog::ShowDirsOnly)

@pub function getExistingDirectory(app::QApplication, caption::String, dir::String, options::UInt32)
    f = dlsym(libqt_wrapper[], "get_existing_directory")
   # chars = ccall(f, Cstring, (Ptr{Nothing}, Cstring, Cstring, Cint), ptr(app), caption, dir, options)
    chars = ccall(f, Cstring, (Ptr{Nothing}, Cstring, Cstring, Cuint), ptr(app), caption, dir, options)
    result = unsafe_string(chars)

    free = dlsym(libqt_wrapper[], "free_char_sequence")
    ccall(free, Cvoid, (Cstring, ), chars)

    return result
end

#-------------------------------------------------------------------------
@pub function getOpenFileName(app::QApplication, caption::String, dir::String, filter::String)
    f = dlsym(libqt_wrapper[], "get_Open_FileName")
   # chars = ccall(f, Cstring, (Ptr{Nothing}, Cstring, Cstring, Cint), ptr(app), caption, dir, options)
    #chars = ccall(f, Cstring, (Ptr{Nothing}, Cstring, Cstring, Cint), ptr(app), caption, dir, options)
    chars = ccall(f, Cstring, (Ptr{Nothing}, Cstring, Cstring, Cstring), ptr(app), caption, dir, filter)
    result = unsafe_string(chars)

    free = dlsym(libqt_wrapper[], "free_char_sequence")
    ccall(free, Cvoid, (Cstring, ), chars)

    return result
end

#-------------------------------------------------------------------------
@pub function getSaveFileName(app::QApplication, caption::String, dir::String, filter::String)
    f = dlsym(libqt_wrapper[], "get_Save_FileName")
 
     chars = ccall(f, Cstring, (Ptr{Nothing}, Cstring, Cstring, Cstring), ptr(app), caption, dir, filter)
    result = unsafe_string(chars)

    free = dlsym(libqt_wrapper[], "free_char_sequence")
    ccall(free, Cvoid, (Cstring, ), chars)

    return result
end

#=
@pub function getOpenFileName(app::QApplication, caption::String, dir::String, filter::String, selectedFilter::String,options::UInt32)
    f = dlsym(libqt_wrapper[], "get_Open_FileName")
   # chars = ccall(f, Cstring, (Ptr{Nothing}, Cstring, Cstring, Cint), ptr(app), caption, dir, options)
    chars = ccall(f, Cstring, (Ptr{Nothing}, Cstring, Cstring, Cint), ptr(app), caption, dir, options)
    result = unsafe_string(chars)

    free = dlsym(libqt_wrapper[], "free_char_sequence")
    ccall(free, Cvoid, (Cstring, ), chars)

    return result
end
=#
#=
const char * get_Open_FileName(QWidget * parent, const char * caption, const char * dir, const char * filter, QString * selectedFilter, QFileDialog::Options options = QFileDialog::ShowDirsOnly) 
{
	std::string string = (QFileDialog::getOpenFileName(0, 	// writing this like a static function, so null pointer for parent
											caption,
                                            dir,
											filter,
											selectedFilter,
                                            options) ).toStdString();

    char * cstring = new char[string.size() + 1];
    strncpy(cstring, string.c_str(), string.size());
    return cstring;
}
=#





# =============================================================================
# Wrappers around QFileDialog static methods
# =============================================================================
#=
def getexistingdirectory(parent=None, caption='', basedir='',
                         options=QFileDialog.ShowDirsOnly):
    """Wrapper around QtGui.QFileDialog.getExistingDirectory static method
    Compatible with PyQt >=v4.4 (API #1 and #2) and PySide >=v1.0"""
    # Calling QFileDialog static method
    if sys.platform == "win32":
        # On Windows platforms: redirect standard outputs
        _temp1, _temp2 = sys.stdout, sys.stderr
        sys.stdout, sys.stderr = None, None
    try:
        result = QFileDialog.getExistingDirectory(parent, caption, basedir,
                                                  options)
    finally:
        if sys.platform == "win32":
            # On Windows platforms: restore standard outputs
            sys.stdout, sys.stderr = _temp1, _temp2
    if not is_text_string(result):
        # PyQt API #1
        result = to_text_string(result)
    return result


def _qfiledialog_wrapper(attr, parent=None, caption='', basedir='',
                         filters='', selectedfilter='', options=None):
    if options is None:
        options = QFileDialog.Option(0)

    func = getattr(QFileDialog, attr)

    # Calling QFileDialog static method
    if sys.platform == "win32":
        # On Windows platforms: redirect standard outputs
        _temp1, _temp2 = sys.stdout, sys.stderr
        sys.stdout, sys.stderr = None, None
    result = func(parent, caption, basedir, filters, selectedfilter, options)
    if sys.platform == "win32":
        # On Windows platforms: restore standard outputs
        sys.stdout, sys.stderr = _temp1, _temp2

    output, selectedfilter = result

    # Always returns the tuple (output, selectedfilter)
    return output, selectedfilter


def getopenfilename(parent=None, caption='', basedir='', filters='',
                    selectedfilter='', options=None):
    """Wrapper around QtGui.QFileDialog.getOpenFileName static method
    Returns a tuple (filename, selectedfilter) -- when dialog box is canceled,
    returns a tuple of empty strings
    Compatible with PyQt >=v4.4 (API #1 and #2) and PySide >=v1.0"""
    return _qfiledialog_wrapper('getOpenFileName', parent=parent,
                                caption=caption, basedir=basedir,
                                filters=filters, selectedfilter=selectedfilter,
                                options=options)

								=#