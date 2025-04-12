@pub mutable struct QStyleFactory <: QObject
	pointer::Ptr{Nothing}

	function QStyleFactory()

		f = dlsym(libqt_wrapper[], "qstylefactory")
#		pointer = ccall(f, Ptr{Nothing}, (Cint, Cint, Cint, Cint), aleft, atop, awidth, aheight)
		pointer = ccall(f, Ptr{Nothing}, () ) 
		
		result = new(pointer)
		finalizer(freeCommon, result)

		return result
	end
	
end

# QStyle *QStyleFactory::create(const QString &key)

@pub function QStyleFactoryCreate(text::String)
    f = dlsym(libqt_wrapper[], "qstylefactorycreate")
 	return    ccall(f, 						# function name
			Cvoid, 					# return type
			(Ptr{Cchar},), # (argtype1, ...)
			text) 			# argvalue1


end