single_app = nothing

@pub mutable struct QApplication <: QObject
    pointer::Ptr{Nothing}

    function QApplication(argv::Vector{String})
        global single_app
        if !isnothing(single_app)
            finalize(single_app)
        end

        len = length(argv)

        f = dlsym(libqt_wrapper[], "application")
        pointer = ccall(f, Ptr{Nothing}, (Int, Vector{Cstring}), len, argv)
        single_app = new(pointer)

        finalizer(freeQObject, single_app)
        return single_app
    end
end

@pub function exec!(app::QApplication)
    f = dlsym(libqt_wrapper[], "exec")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(app))
end

@pub function style(app::QApplication)
    f = dlsym(libqt_wrapper[], "app_style")
    return ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(app))
end

@pub function setStyle(app::QApplication , text::String)
    f = dlsym(libqt_wrapper[], "app_set_style")
    return ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Cchar}), ptr(app), text)

end



#=
@pub function setStyle(app::QApplication, style::QStyle)
    f = dlsym(libqt_wrapper[], "app_set_style")
    return ccall(f, Cvoid, (Ptr{Nothing}, QStyle), ptr(style), style)
end
=#

#=
ccall((function_name, library), returntype, (argtype1, ...), argvalue1, ...)
ccall(function_name, returntype, (argtype1, ...), argvalue1, ...)
ccall(function_pointer, returntype, (argtype1, ...), argvalue1, ...)


QLineEdit(Ptr{Nothing} @0x0000000160099230)
ERROR: MethodError: objects of type Nothing are not callable
The object of type `Nothing` exists, but no method is defined for this combination of argument types when trying to treat it as a callable object.
=#