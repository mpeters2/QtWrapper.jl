struct q_Rect
	x::Cint
	y::Cint
	w::Cint
	h::Cint
end
	

@pub mutable struct QRect
	pointer::Ptr{Nothing}

	function QRect(pointer::Ptr{Nothing})
		result = new(pointer)
		finalizer(freeCommon, result)
		return result
	end

	function QRect(aleft::Int, atop::Int,  awidth::Int, aheight::Int)
		
		rectTemp = q_Rect(aleft, atop,  awidth, aheight)
		
		f = dlsym(libqt_wrapper[], "rect")
#		pointer = ccall(f, Ptr{Nothing}, (Cint, Cint, Cint, Cint), aleft, atop, awidth, aheight)
		pointer = ccall(f, Ptr{Nothing}, (Cint, Cint, Cint, Cint), rectTemp.x, rectTemp.y, rectTemp.w, rectTemp.h)
		
		result = new(pointer)
		finalizer(freeCommon, result)

		return result
	end
	
end
# constexpr inline QRect::QRect(int aleft, int atop, int awidth, int aheight) 