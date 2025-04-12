@pub mutable struct QPushButton <: QAbstractButton
    pointer::Ptr{Nothing}

    function QPushButton(text::String, parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "push_button")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, Ptr{Nothing}), text, ptr(parent))
        result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
end

@pub mutable struct QRadioButton <: QAbstractButton
    pointer::Ptr{Nothing}
    
    function QRadioButton(text::String, parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "radio_button")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, Ptr{Nothing}), text, ptr(parent))
        result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
end



@pub mutable struct QCheckbBox <: QAbstractButton
    pointer::Ptr{Nothing}
    
    function QCheckbBox(text::String, parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "checkbox")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, Ptr{Nothing}), text, ptr(parent))
        result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
end

@pub function clicked!(button::QAbstractButton, callback::Function)
    f = dlsym(libqt_wrapper[], "button_connect_clicked")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), @cfunction($callback, Cvoid, (Bool,)))
end

#=
	ccall( function,
			returnType,
			(argtypes...),
			argvalues...
		)
	
	ccall( QtCfunction,
			Cvoid,
			(Ptr{Nothing}, Ptr{Nothing}),

    ccall(f, 
			Cvoid, 
			(Ptr{Nothing}, Ptr{Nothing}), 
			ptr(button), @cfunction($callback, Cvoid, (Bool,)))

=#

# experimentalversion to try to get around closure problem on Apple Silicon
@pub function clicked2!(button::QAbstractButton, callback::Function)
    f = dlsym(libqt_wrapper[], "button_connect_clicked")
	callback_wrapper = @cfunction($callback, Cint, (Cdouble, Cstring, Any))
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), callback_wrapper)
end

@pub function resetClicked!(button::QAbstractButton)
    f = dlsym(libqt_wrapper[], "button_disconnect_clicked_all")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function pressed!(button::QAbstractButton, callback::Function)
    f = dlsym(libqt_wrapper[], "button_connect_pressed")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), @cfunction($callback, Cvoid, ()))
end

@pub function resetPressed!(button::QAbstractButton)
    f = dlsym(libqt_wrapper[], "button_disconnect_pressed_all")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function released!(button::QAbstractButton, callback::Function)
    f = dlsym(libqt_wrapper[], "button_connect_released")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), @cfunction($callback, Cvoid, ()))
end

@pub function resetReleased!(button::QAbstractButton)
    f = dlsym(libqt_wrapper[], "button_disconnect_released_all")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function toggled!(button::QRadioButton, callback::Function)
    f = dlsym(libqt_wrapper[], "radiobutton_connect_toggled")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), @cfunction($callback, Cvoid, (Bool,)))
end

@pub function resetToggled!(button::QRadioButton)
    f = dlsym(libqt_wrapper[], "radiobutton_disconnect_toggled_all")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function toggled!(button::QCheckbBox, callback::Function)
    f = dlsym(libqt_wrapper[], "checkbox_connect_toggled")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), @cfunction($callback, Cvoid, (Bool,)))
end

@pub function resetToggled!(button::QCheckbBox)
    f = dlsym(libqt_wrapper[], "checkbox_disconnect_toggled_all")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function autoExclusive(button::QAbstractButton, value::Bool)	#::Bool
    f = dlsym(libqt_wrapper[], "button_auto_exclusive")
    return ccall(f, Bool, (Ptr{Nothing}, ), ptr(button))
end

@pub function autoExclusive!(button::QAbstractButton, value::Bool)
    f = dlsym(libqt_wrapper[], "button_set_auto_exclusive")
    ccall(f, Cvoid, (Ptr{Nothing}, Bool), ptr(button), value)
end

@pub function autoRepeat(button::QAbstractButton, value::Bool)	#)::Bool
    f = dlsym(libqt_wrapper[], "button_auto_repeat")
    return ccall(f, Bool, (Ptr{Nothing}, ), ptr(button))
end

@pub function autoRepeat!(button::QAbstractButton, value::Bool)
    f = dlsym(libqt_wrapper[], "button_set_auto_repeat")
    ccall(f, Cvoid, (Ptr{Nothing}, Bool), ptr(button), value)
end

@pub function autoRepeatDelay(button::QAbstractButton, value::Int)	#)::Int
    f = dlsym(libqt_wrapper[], "button_auto_repeat_delay")
    return ccall(f, Cint, (Ptr{Nothing}, ), ptr(button))
end

@pub function autoRepeatDelay!(button::QAbstractButton, value::Int)
    f = dlsym(libqt_wrapper[], "button_set_auto_repeat_delay")
    ccall(f, Cvoid, (Ptr{Nothing}, Cint), ptr(button), value)
end

@pub function autoRepeatInterval(button::QAbstractButton, value::Int)	#)::Int
    f = dlsym(libqt_wrapper[], "button_auto_repeat_interval")
    return ccall(f, Cint, (Ptr{Nothing}, ), ptr(button))
end

@pub function autoRepeatInterval!(button::QAbstractButton, value::Int)
    f = dlsym(libqt_wrapper[], "button_set_auto_repeat_interval")
    ccall(f, Cvoid, (Ptr{Nothing}, Cint), ptr(button), value)
end

@pub function checkable(button::QAbstractButton, value::Bool)	#)::Bool
    f = dlsym(libqt_wrapper[], "button_checkable")
    return ccall(f, Cint, (Ptr{Nothing}, ), ptr(button)) 
end

@pub function checkable!(button::QAbstractButton, value::Bool)
    f = dlsym(libqt_wrapper[], "button_set_checkable")
    ccall(f, Cvoid, (Ptr{Nothing}, Bool), ptr(button), value)
end

@pub function down(button::QAbstractButton, value::Bool)	#)::Bool
    f = dlsym(libqt_wrapper[], "button_down")
    return ccall(f, Cint, (Ptr{Nothing}, ), ptr(button)) 
end

@pub function down!(button::QAbstractButton, value::Bool)
    f = dlsym(libqt_wrapper[], "button_set_down")
    ccall(f, Cvoid, (Ptr{Nothing}, Bool), ptr(button), value)
end

@pub function icon(button::QAbstractButton, icon::QIcon)	#)::QIcon
    f = dlsym(libqt_wrapper[], "button_icon")
    pointer = ccall(f, Ptr{Nothing}, (Ptr{Nothing}, ), ptr(button))
    return QIcon(pointer)
end

@pub function icon!(button::QAbstractButton, icon::QIcon)
    f = dlsym(libqt_wrapper[], "button_set_icon")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), ptr(icon))
end

@pub function iconSize(button::QAbstractButton, size::QSize)
    f = dlsym(libqt_wrapper[], "button_icon_size")
    pointer = ccall(f, Ptr{Nothing}, (Ptr{Nothing}, ), ptr(button))
    return QSize(pointer)
end

@pub function iconSize!(button::QAbstractButton, width::Int, height::Int)
    f = dlsym(libqt_wrapper[], "button_set_icon_size") 
    ccall(f, Cvoid, (Ptr{Nothing}, Cint, Cint), ptr(button), width, height)
end

@pub function shortcut(button::QAbstractButton, shortcut::QKeySequence)
    f = dlsym(libqt_wrapper[], "button_shortcut")
    pointer = ccall(f, Ptr{Nothing}, (Ptr{Nothing}, ), ptr(button))

    return QKeySequence(pointer)
end

@pub function shortcut!(button::QAbstractButton, shortcut::QKeySequence)
    f = dlsym(libqt_wrapper[], "button_set_shortcut")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), ptr(shortcut))
end

@pub function shortcut!(button::QAbstractButton, text::String)
    f = dlsym(libqt_wrapper[], "button_set_shortcut")
    ccall(f, Cvoid, (Ptr{Nothing}, Cstring), ptr(button), text)
end

@pub function text(button::QAbstractButton, text::String)
    f = dlsym(libqt_wrapper[], "button_text")
    chars = ccall(f, Cstring, (Ptr{Nothing}, ), ptr(button))
    result = unsafe_string(chars)

    free = dlsym(libqt_wrapper[], "free_char_sequence")
    ccall(free, Cvoid, (Cstring, ), chars)

    return result
end

@pub function text!(button::QAbstractButton, text::String)
    f = dlsym(libqt_wrapper[], "button_set_text")
    ccall(f, Cvoid, (Ptr{Nothing}, Cstring), ptr(button), text)
end
#------------------------------
# qbutton setstylesheet prototype
#=
void button_set_stylesheet(void * pwidget, const char * text) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    button -> setStyleSheet(QString(text));
}
=#
@pub function setStyleSheet!(button::QAbstractButton, text::String)
    f = dlsym(libqt_wrapper[], "button_set_stylesheet")
    ccall(f, Cvoid, (Ptr{Nothing}, Cstring), ptr(button), text)
end
#------------------------------
@pub function click(button::QAbstractButton)
    f = dlsym(libqt_wrapper[], "button_click")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function animateClick(button::QAbstractButton)
    f = dlsym(libqt_wrapper[], "button_animate_click")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function checked!(button::QAbstractButton, value::Bool)
    f = dlsym(libqt_wrapper[], "button_set_checked")
    ccall(f, Cvoid, (Ptr{Nothing}, Bool), ptr(button), value)
end

@pub function toggle(button::QAbstractButton)
    f = dlsym(libqt_wrapper[], "button_toggle")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function setGeometry(button::QAbstractButton, theRect::QRect)
    f = dlsym(libqt_wrapper[], "button_set_geometry")
    ccall(f, Cvoid, (Ptr{Nothing}, QRect), ptr(button), theRect)
end

@pub function setGeometry(button::QAbstractButton, x::Int, y::Int, width::Int, height::Int)
    f = dlsym(libqt_wrapper[], "button_set_geometry2")
	#println("setGeometry through four params")
	ccall(f, Cvoid, (Ptr{Nothing}, Cint, Cint, Cint, Cint), ptr(button), x, y, width, height)
end