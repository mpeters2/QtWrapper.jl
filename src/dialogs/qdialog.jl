@pub mutable struct QDialog <: QtWidget
    pointer::Ptr{Nothing}

    function QDialog(parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "dialog")		# QDialog
        pointer = ccall(f, Ptr{Nothing}, (Ptr{Nothing}, ), ptr(parent))
        result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
end

@pub function isSizeGripEnabled(dialog::QDialog)
    f = dlsym(libqt_wrapper[], "is_SizeGripEnabled")
    result = ccall(f, Bool, (Ptr{Nothing}, ), ptr(dialog))
    return result
end


@pub function result(dialog::QDialog)
    f = dlsym(libqt_wrapper[], "q_result")
    result = ccall(f, Cint, (Ptr{Nothing}, ), ptr(dialog))
    return result
end

@pub function setModal(dialog::QDialog, modal::Bool)
    f = dlsym(libqt_wrapper[], "set_modal")
    ccall(f, Cvoid, (Ptr{Nothing}, Cint), ptr(dialog), modal)		# trying Cint for a Boolean
end

@pub function setResult(dialog::QDialog, result::Cint)
    f = dlsym(libqt_wrapper[], "set_result")
    ccall(f, Cvoid, (Ptr{Nothing}, Cint), ptr(dialog), result)		# trying Cint for a Boolean
end

@pub function setSizeGripEnabled(dialog::QDialog, modal::Bool)
    f = dlsym(libqt_wrapper[], "set_SizeGripEnabled")
    ccall(f, Cvoid, (Ptr{Nothing}, Cint), ptr(dialog), modal)		# trying Cint for a Boolean
end
#-------------------------------------------
