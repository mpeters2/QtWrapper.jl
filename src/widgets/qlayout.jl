@pub mutable struct QHBoxLayout <: QBoxLayout
    pointer::Ptr{Nothing}

    function QHBoxLayout()
        f = dlsym(libqt_wrapper[], "horizontal_layout")
        pointer = ccall(f, Ptr{Nothing}, ())
        result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
end

@pub mutable struct QVBoxLayout <: QBoxLayout
    pointer::Ptr{Nothing}

    function QVBoxLayout()
        f = dlsym(libqt_wrapper[], "vertical_layout")
        pointer = ccall(f, Ptr{Nothing}, ())
        result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
end

@pub function addLayout!(layout::QBoxLayout, sublayout::QLayout)
    if layout isa QHBoxLayout
        f = dlsym(libqt_wrapper[], "horizontal_add_layout")
        ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(layout), ptr(sublayout))
    elseif layout isa QVBoxLayout
        f = dlsym(libqt_wrapper[], "vertial_add_layout")
        ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(layout), ptr(sublayout))
    else
        error("Unknown layout type")
    end
end

@pub function addStretch!(layout::QBoxLayout, n::Int = 0)
    if layout isa QHBoxLayout
        f = dlsym(libqt_wrapper[], "horizontal_add_stretch")
        ccall(f, Cvoid, (Ptr{Nothing}, Cint), ptr(layout), n)
    elseif layout isa QVBoxLayout
        f = dlsym(libqt_wrapper[], "vertical_add_stretch")
        ccall(f, Cvoid, (Ptr{Nothing}, Cint), ptr(layout), n)
    else
        error("Unknown layout type")
    end
end

@pub function addWidget!(layout::QLayout, widget::QtWidget)
    f = dlsym(libqt_wrapper[], "layout_add_widget")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(layout), ptr(widget))
end
# MSP stuff below ---------------------------------------
@pub mutable struct QGridLayout <: QLayout
    pointer::Ptr{Nothing}

    function QGridLayout()
        f = dlsym(libqt_wrapper[], "grid_layout")
        pointer = ccall(f, Ptr{Nothing}, ())
        result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
end

@pub function addLayout!(layout::QGridLayout, sublayout::QLayout)
    if layout isa QHBoQGridLayoutxLayout
        f = dlsym(libqt_wrapper[], "grid_add_layout")
        ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(layout), ptr(sublayout))
    else
        error("Unknown layout type")
    end
end

@pub function addWidget!(layout::QLayout, widget::QtWidget, row::Int64, column::Int64, rowSpan::Int64, columnSpan::Int64)
    f = dlsym(libqt_wrapper[], "layout_add_grid_widget")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}, Cint, Cint, Cint, Cint), ptr(layout), ptr(widget), row, column, rowSpan, columnSpan)
end

