@pub mutable struct QLineEdit <: QtWidget
    pointer::Ptr{Nothing}

    function QLineEdit(text::String, parent::Union{Nothing, QtWidget} = nothing)
        f = dlsym(libqt_wrapper[], "lineedit")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, Ptr{Nothing}), text, ptr(parent))
        result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
end

@pub function textChanged!(lineedit::QLineEdit, callback::Function)
    f = dlsym(libqt_wrapper[], "lineedit_connect_text_changed")
    nextCallback(cstring::Cstring) = begin
        string = unsafe_string(cstring)
        callback(string)

        nothing
    end


    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(lineedit), @cfunction($nextCallback, Cvoid, (Cstring,)))
end

@pub function editingFinished(lineedit::QLineEdit, callback::Function)
    f = dlsym(libqt_wrapper[], "lineedit_connect_editing_finished")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(lineedit), @cfunction($callback, Cvoid, ()))
end

@pub function returnPressed!(lineedit::QLineEdit, callback::Function)
    f = dlsym(libqt_wrapper[], "lineedit_connect_return_pressed")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(lineedit), @cfunction($callback, Cvoid, ()))
end

@pub function cursorPositionChanged!(lineedit::QLineEdit, callback::Function)
    f = dlsym(libqt_wrapper[], "lineedit_connect_cursor_position_changed")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(lineedit), @cfunction($callback, Cvoid, (Cint, Cint)))
end


@pub function setGeometry(lineedit::QLineEdit, theRect::QRect)
    f = dlsym(libqt_wrapper[], "lineedit_set_geometry")
    ccall(f, Cvoid, (Ptr{Nothing}, QRect), ptr(lineedit), theRect)
end

@pub function setGeometry(lineedit::QLineEdit, x::Int, y::Int, width::Int, height::Int)
    f = dlsym(libqt_wrapper[], "lineedit_set_geometry2")
	ccall(f, Cvoid, (Ptr{Nothing}, Cint, Cint, Cint, Cint), ptr(lineedit), x, y, width, height)
end


@pub function setText(lineedit::QLineEdit, text::String)
    f = dlsym(libqt_wrapper[], "lineedit_set_text")
    ccall(f, Cvoid, (Ptr{Nothing}, String), ptr(lineedit), text)
end


#void	setText(const QString &)