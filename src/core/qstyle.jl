@pub mutable struct QStyle <: QObject
	pointer::Ptr{Nothing}
	#=
	function Qstyle(pointer::Ptr{Nothing})
		result = new(pointer)
		finalizer(freeCommon, result)
		return result
	end
	=#
	function QStyle()

		f = dlsym(libqt_wrapper[], "qstyle")
#		pointer = ccall(f, Ptr{Nothing}, (Cint, Cint, Cint, Cint), aleft, atop, awidth, aheight)
		pointer = ccall(f, Ptr{Nothing}, () ) 
		
		result = new(pointer)
		finalizer(freeCommon, result)

		return result
	end
	
end

@pub mutable struct QMacStyle <: QObject
	pointer::Ptr{Nothing}


	function QMacStyle()

		f = dlsym(libqt_wrapper[], "qmacstyle")
#		pointer = ccall(f, Ptr{Nothing}, (Cint, Cint, Cint, Cint), aleft, atop, awidth, aheight)
		pointer = ccall(f, Ptr{Nothing}, () ) 
		
		result = new(pointer)
		finalizer(freeCommon, result)

		return result
	end
	
end
