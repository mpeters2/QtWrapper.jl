const   InvalidRole	= 		-1	# The button is invalid.
const   AcceptRole	= 		0	# Clicking the button causes the dialog to be accepted (e.g. OK).
const   RejectRole	= 		1	# Clicking the button causes the dialog to be rejected (e.g. Cancel).
const   DestructiveRole	= 	2	# Clicking the button causes a destructive change (e.g. for Discarding Changes) and closes the dialog.
const   ActionRole	= 		3	# Clicking the button causes changes to the elements within the dialog.
const   HelpRole	= 		4	# The button can be clicked to request help.
const   YesRole	= 			5	# The button is a "Yes"-like button.
const   NoRole	= 			6	# The button is a "No"-like button.
const   ApplyRole	= 		8	# The button applies current changes.
const   ResetRole	= 		7	# The button resets the dialog's fields to default values.

# Standard Buttons constants for QMessageBox:

const   QMessageBox_Ok	= 0x00000400	# An "OK" button defined with the AcceptRole.
const   QMessageBox_Open	= 0x00002000	# An "Open" button defined with the AcceptRole.
const    QMessageBox_Save	= 0x00000800	# A "Save" button defined with the AcceptRole.
const    QMessageBox_Cancel	= 0x00400000	# A "Cancel" button defined with the RejectRole.
const    QMessageBox_Close	= 0x00200000	# A "Close" button defined with the RejectRole.
const    QMessageBox_Discard	= 0x00800000	# A "Discard" or "Don't Save" button, depending on the platform, defined with the DestructiveRole.
const    QMessageBox_Apply	= 0x02000000	# An "Apply" button defined with the ApplyRole.
const    QMessageBox_Reset	= 0x04000000	# A "Reset" button defined with the ResetRole.
const    QMessageBox_RestoreDefaults	= 0x08000000	# A "Restore Defaults" button defined with the ResetRole.
const    QMessageBox_Help	= 0x01000000	# A "Help" button defined with the HelpRole.
const    QMessageBox_SaveAll	= 0x00001000	# A "Save All" button defined with the AcceptRole.
const    QMessageBox_Yes	= 0x00004000	# A "Yes" button defined with the YesRole.
const    QMessageBox_YesToAll	= 0x00008000	# A "Yes to All" button defined with the YesRole.
const   QMessageBox_No	= 0x00010000	# A "No" button defined with the NoRole.
const    QMessageBox_NoToAll	= 0x00020000	# A "No to All" button defined with the NoRole.
const    QMessageBox_Abort	= 0x00040000	# An "Abort" button defined with the RejectRole.
const    QMessageBox_Retry	= 0x00080000	# A "Retry" button defined with the AcceptRole.
const    QMessageBox_Ignore	= 0x00100000	# An "Ignore" button defined with the AcceptRole.
const    QMessageBox_NoButton	= 0x00000000	# An invalid button.

const	QMessageBox_DontUseNativeDialog	= 	0x00000001	# Don't use the native message dialog.

export QMessageBox_Ok, QMessageBox_Save, QMessageBox_Discard, QMessageBox_Cancel, QMessageBox_DontUseNativeDialog




@pub mutable struct QMessageBox <: QAbstractDialog		# QtWidget
    pointer::Ptr{Nothing}

    function QMessageBox(parent::Union{Nothing, QtWidget} = nothing)
        f = dlsym(libqt_wrapper[], "messageBox")
        pointer = ccall(f, Ptr{Nothing}, (Ptr{Nothing}, ), ptr(parent))
         result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
end

@pub function addButton!(messageBox::QMessageBox, widget::QtWidget, role::Int)
    f = dlsym(libqt_wrapper[], "messageBox_add_button")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}, Cint), ptr(messageBox), ptr(widget), role)
end

@pub function setText(messageBox::QMessageBox, text::String)
    f = dlsym(libqt_wrapper[], "messageBox_set_text")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Cchar}), ptr(messageBox), text)
end

@pub function setInformativeText(messageBox::QMessageBox, text::String)
    f = dlsym(libqt_wrapper[], "messageBox_set_InformativeText")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Cchar}), ptr(messageBox), text)
end

@pub function setStandardButtons(messageBox::QMessageBox, buttonFlags::UInt32)
    f = dlsym(libqt_wrapper[], "messageBox_set_standardButtons")
    ccall(f, Cvoid, (Ptr{Nothing}, Cint), ptr(messageBox), buttonFlags)
end

@pub function setDefaultButton(messageBox::QMessageBox, buttonFlags::UInt32)
    f = dlsym(libqt_wrapper[], "messageBox_set_DefaultButton")
    ccall(f, Cvoid, (Ptr{Nothing}, Cint), ptr(messageBox), buttonFlags)
end

@pub function setOptions(messageBox::QMessageBox, optionFlags::UInt32, on::Bool )
    f = dlsym(libqt_wrapper[], "messageBox_set_Option")
    ccall(f, Cvoid, (Ptr{Nothing}, Cint, Cint), ptr(messageBox), optionFlags, on)
end


@pub function exec!(messageBox::QMessageBox)
    f = dlsym(libqt_wrapper[], "messagebox_exec")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(messageBox))
end

@pub function setStyle(qMsgBx::QMessageBox , text::String)
    f = dlsym(libqt_wrapper[], "messageBox_set_style")
    return ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Cchar}), ptr(qMsgBx), text)

end
#-=======================================================================
# Static versions of functions

#=
QMessageBox::StandardButton QMessageBox::information(
											QWidget *parent, 
											const QString &title, 
											const QString &text, 
											QMessageBox::StandardButtons buttons = Ok, 
											QMessageBox::StandardButton defaultButton = NoButton
											)
=#
#-------------------------------------------------------------------------
@pub function QMessageBox_information(app::QApplication, title::String, text::String)
    f = dlsym(libqt_wrapper[], "qmessageBox_information")
 
    result = ccall(f, Cvoid, (Ptr{Nothing}, Cstring, Cstring), ptr(app), title, text)
    result = ccall(f, Cint, (Ptr{Nothing}, Cstring, Cstring), ptr(app), title, text)


end

#qmessageBox_information(QWidget * parent, const char * title, const char * text)

#=
@pub function addWidget!(layout::QLayout, widget::QtWidget, row::Int64, column::Int64, rowSpan::Int64, columnSpan::Int64)
    f = dlsym(libqt_wrapper[], "layout_add_grid_widget")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}, Cint, Cint, Cint, Cint), ptr(layout), ptr(widget), row, column, rowSpan, columnSpan)
end



@pub function textChanged!(textedit::QTextEdit, callback::Function)
    f = dlsym(libqt_wrapper[], "textedit_connect_text_changed")
    nextCallback(cstring::Cstring) = begin
        string = unsafe_string(cstring)
        callback(string)

        nothing
    end


    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(textedit), @cfunction($nextCallback, Cvoid, (Cstring,)))
end
# Only add functions that I call
@pub function setGeometry(textedit::QTextEdit, theRect::QRect)
    f = dlsym(libqt_wrapper[], "textedit_set_geometry")
    ccall(f, Cvoid, (Ptr{Nothing}, QRect), ptr(textedit), theRect)
end

@pub function setGeometry(textedit::QTextEdit, x::Int, y::Int, width::Int, height::Int)
    f = dlsym(libqt_wrapper[], "textedit_set_geometry2")
	ccall(f, Cvoid, (Ptr{Nothing}, Cint, Cint, Cint, Cint), ptr(textedit), x, y, width, height)
end


@pub function setPlainText(textedit::QTextEdit, text::String)
	println("SPT: ", text)
    f = dlsym(libqt_wrapper[], "textedit_set_plain_text")
    ccall(f, 						# function name
			Cvoid, 					# return type
#			(Ptr{Nothing}, String), # (argtype1, ...)
			(Ptr{Nothing}, Ptr{Cchar}), # (argtype1, ...)
			ptr(textedit), 			# argvalue1
			text)					# argvalue2
end
# ccall(function_name, returntype, (argtype1, ...), argvalue1, ...)
# Ptr{Cchar}


@pub function toPlainText(textedit::QTextEdit)
    f = dlsym(libqt_wrapper[], "textedit_to_plain_text")
    chars = ccall(f, Cstring, (Ptr{Nothing}, ), ptr(textedit))
    result = unsafe_string(chars)

    free = dlsym(libqt_wrapper[], "free_char_sequence")
    ccall(free, Cvoid, (Cstring, ), chars)

    return result
end

@pub function setStyleSheet!(textedit::QTextEdit, text::String)
    f = dlsym(libqt_wrapper[], "textedit_set_stylesheet")
    ccall(f, Cvoid, (Ptr{Nothing}, Cstring), ptr(textedit), text)
end

@pub function setReadOnly(textedit::QTextEdit, value::Bool)
    f = dlsym(libqt_wrapper[], "textedit_set_readonly")
    ccall(f, Cvoid, (Ptr{Nothing}, Cuchar), ptr(textedit), value)
end
#-===========================================================================
@pub function editingFinished(textedit::QTextEdit, callback::Function)
    f = dlsym(libqt_wrapper[], "textedit_connect_editing_finished")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(textedit), @cfunction($callback, Cvoid, ()))
end

@pub function returnPressed!(textedit::QTextEdit, callback::Function)
    f = dlsym(libqt_wrapper[], "textedit_connect_return_pressed")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(textedit), @cfunction($callback, Cvoid, ()))
end

@pub function cursorPositionChanged!(textedit::QTextEdit, callback::Function)
    f = dlsym(libqt_wrapper[], "textedit_connect_cursor_position_changed")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(textedit), @cfunction($callback, Cvoid, (Cint, Cint)))
end









#void	setText(const QString &)


=#