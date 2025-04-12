@pub mutable struct QTextEdit <: QtWidget
    pointer::Ptr{Nothing}

    function QTextEdit(text::String, parent::Union{Nothing, QtWidget} = nothing)
        f = dlsym(libqt_wrapper[], "textedit")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, Ptr{Nothing}), text, ptr(parent))
        result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
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