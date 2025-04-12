@pub mutable struct QKeySequence
    pointer::Ptr{Nothing}

    function QKeySequence(pointer::Ptr{Nothing})
        result = new(pointer)
        finalizer(freeCommon, result)
        
        return result
    end

    function QKeySequence(key::String)
        f = dlsym(libqt_wrapper[], "keysequence")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, ), key)
        result = new(pointer)

        finalizer(freeCommon, result)

        return result
    end
end