#= Enumeration works differently in Julia compared to C++
 In cases in which the values do not matter, I left them 
 as @enum.  In the remaining cases in which an exact vale is 
 assigned, I changed the to constants.
=#

@enum GlobalColor begin
    color0
    color1
    black
    white
    darkGray
    gray
    lightGray
    red
    green
    blue
    cyan
    magenta
    yellow
    darkRed
    darkGreen
    darkBlue
    darkCyan
    darkMagenta
    darkYellow
    transparent
end

@enum ColorScheme begin
    Unknown
    Light
    Dark
end

# I'm not sure if there is any real reason to enumerate these in Julia.
# Also, enum in Julia doesn't behave exaclty like enum in C/C++, and this
# is causing errors.

#@enum MouseButton::Int64 begin
const   NoButton = 0x00000000
const   LeftButton = 0x00000001
const   RightButton = 0x00000002
const   MiddleButton = 0x00000004
const   BackButton = 0x00000008
const   XButton1 = BackButton
const   ExtraButton1 = XButton1
const   ForwardButton = 0x00000010
const   XButton2 = ForwardButton
const   ExtraButton2 = ForwardButton
const   TaskButton = 0x00000020
const   ExtraButton3 = TaskButton
const   ExtraButton4 = 0x00000040
const   ExtraButton5 = 0x00000080
const   ExtraButton6 = 0x00000100
const   ExtraButton7 = 0x00000200
const   ExtraButton8 = 0x00000400
const   ExtraButton9 = 0x00000800
const   ExtraButton10 = 0x00001000
const   ExtraButton11 = 0x00002000
const   ExtraButton12 = 0x00004000
const   ExtraButton13 = 0x00008000
const   ExtraButton14 = 0x00010000
const   ExtraButton15 = 0x00020000
const   ExtraButton16 = 0x00040000
const   ExtraButton17 = 0x00080000
const   ExtraButton18 = 0x00100000
const   ExtraButton19 = 0x00200000
const   ExtraButton20 = 0x00400000
const   ExtraButton21 = 0x00800000
const   ExtraButton22 = 0x01000000
const   ExtraButton23 = 0x02000000
const   ExtraButton24 = 0x04000000
const   AllButtons = 0x07ffffff
const	MaxMouseButton = ExtraButton24
const   MouseButtonMask=  4294967295 
#end

#@enum Orientation begin
const   Horizontal = 0x1
const   Vertical = 0x2
#end

#@enum FocusPolicy begin
const   NoFocus = 0
const   TabFocus = 0x1
const   ClickFocus = 0x2
const   StrongFocus = TabFocus | ClickFocus | 0x8
const   WheelFocus = StrongFocus | 0x4

#end

#@enum TabFocusBehavior begin
const   NoTabFocus = 0x00
const   TabFocusTextControls = 0x01
const   TabFocusListControls = 0x02
const   TabFocusAllControls = 0xff
#end

@enum SortOrder begin
   AscendingOrder
   DescendingOrder
end

#@enum SplitBehaviorFlags begin
const   KeepEmptyParts = 0
const   SkipEmptyParts = 0x1
#end

@enum TileRule begin
   StretchTile
   RepeatTile
   RoundTile
end

#@enum AlignmentFlag begin
const   AlignLeft = 0x0001
const   AlignLeading = AlignLeft
const   AlignRight = 0x0002
const   AlignTrailing = AlignRight
const   AlignHCenter = 0x0004
const   AlignJustify = 0x0008
const   AlignAbsolute = 0x0010
const   AlignHorizontal_Mask = AlignLeft | AlignRight | AlignHCenter | AlignJustify | AlignAbsolute

const   AlignTop = 0x0020
const   AlignBottom = 0x0040
const   AlignVCenter = 0x0080
const   AlignBaseline = 0x0100
const   AlignVertical_Mask = AlignTop | AlignBottom | AlignVCenter | AlignBaseline
const   AlignCenter = AlignVCenter | AlignHCenter

#end

#@enum TextFlag begin
const   TextSingleLine = 0x0100
const   TextDontClip = 0x0200
const   TextExpandTabs = 0x0400
const   TextShowMnemonic = 0x0800
const   TextWordWrap = 0x1000
const   TextWrapAnywhere = 0x2000
const   TextDontPrint = 0x4000
const   TextIncludeTrailingSpaces = 0x08000000
const   TextHideMnemonic = 0x8000
const   TextJustificationForced = 0x10000
const   TextForceLeftToRight = 0x20000
const   TextForceRightToLeft = 0x40000
const   TextLongestVariant = 0x80000
#end

@enum TextElideMode begin
    ElideLeft
    ElideRight
    ElideMiddle
    ElideNone
end

@enum WhiteSpaceMode begin
    WhiteSpaceNormal
    WhiteSpacePre
    WhiteSpaceNoWrap
    WhiteSpaceModeUndefined = -1
end

@enum HitTestAccuracy begin
    ExactHit
    FuzzyHit
end

#aWindow = 0x00000001
#aDialog = 0x00000002 | aWindow
#aSheet = 0x00000004 | aWindow
#aPopup = 0x00000008 | aWindow
#aToolTip = aPopup | aSheet

#aWindowMinimizeButtonHint = 0x00004000
#aWindowMaximizeButtonHint = 0x00008000
#aWindowMinMaxButtonsHint = aWindowMinimizeButtonHint | aWindowMaximizeButtonHint


#@enum WindowType::Int64 begin
const   Widget = 0x00000000
const   Window = 0x00000001
const   Dialog = 0x00000002 | Window
const   Sheet = 0x00000004 | Window
const   Drawer = Sheet | Dialog
const   Popup = 0x00000008 | Window
const   Tool = Popup | Dialog
const   ToolTip = Popup | Sheet
const   SplashScreen = ToolTip | Dialog
const   Desktop = 0x00000010 | Window
const   SubWindow = 0x00000012
const   ForeignWindow = 0x00000020 | Window
const   CoverWindow = 0x00000040 | Window

const   WindowType_Mask = 0x000000ff
const   MSWindowsFixedSizeDialogHint = 0x00000100
const   MSWindowsOwnDC = 0x00000200
const   BypassWindowManagerHint = 0x00000400
const   X11BypassWindowManagerHint = BypassWindowManagerHint
const   FramelessWindowHint = 0x00000800
const   WindowTitleHint = 0x00001000
const   WindowSystemMenuHint = 0x00002000
const   WindowMinimizeButtonHint = 0x00004000
const   WindowMaximizeButtonHint = 0x00008000
const   WindowMinMaxButtonsHint = WindowMinimizeButtonHint | WindowMaximizeButtonHint
const   WindowContextHelpButtonHint = 0x00010000
const   WindowShadeButtonHint = 0x00020000
const   WindowStaysOnTopHint = 0x00040000
const   WindowTransparentForInput = 0x00080000
const   WindowOverridesSystemGestures = 0x00100000
const   WindowDoesNotAcceptFocus = 0x00200000
const   MaximizeUsingFullscreenGeometryHint = 0x00400000

const   CustomizeWindowHint = 0x02000000
const   WindowStaysOnBottomHint = 0x04000000
const   WindowCloseButtonHint = 0x08000000
const   MacWindowToolBarButtonHint = 0x10000000
const   BypassGraphicsProxyWidget = 0x20000000
const   NoDropShadowWindowHint = 0x40000000
const   WindowFullscreenButtonHint = 0x80000000

#end

#@enum WindowState begin
const   WindowNoState = 0x00000000
const   WindowMinimized = 0x00000001
const   WindowMaximized = 0x00000002
const   WindowFullScreen = 0x00000004
const   WindowActive = 0x00000008
#end

#@enum ApplicationState begin
const   ApplicationSuspended = 0x00000000
const   ApplicationHidden = 0x00000001
const   ApplicationInactive = 0x00000002
const   ApplicationActive = 0x00000004
#end

#@enum ScreenOrientation begin
const   PrimaryOrientation = 0x00000000
const   PortraitOrientation = 0x00000001
const   LandscapeOrientation = 0x00000002
const   InvertedPortraitOrientation = 0x00000004
const   InvertedLandscapeOrientation = 0x00000008

# QKeySequence constants
const   QT_Key_Return = 0x01000004
const   QT_Key_Enter = 0x01000005
const   QT_Key_Insert = 0x01000006
const   QT_Key_Delete = 0x01000007
const   QT_Key_Pause = 0x01000008
const   QT_Key_Print = 0x01000009
const   QT_Key_SysReq = 0x0100000a
const   QT_Key_Clear = 0x0100000b
const   QT_Key_Home = 0x01000010                # cursor movement
const   QT_Key_End = 0x01000011
const   QT_Key_Left = 0x01000012
const   QT_Key_Up = 0x01000013
const   QT_Key_Right = 0x01000014
const   QT_Key_Down = 0x01000015
const   QT_Key_PageUp = 0x01000016


#end

#=

@enum MouseButton::Int64 begin
    NoButton = 0x00000000
    LeftButton = 0x00000001
    RightButton = 0x00000002
    MiddleButton = 0x00000004
    BackButton = 0x00000008
   # XButton1 = 0x00000008			# XButton1 = BackButton
   # ExtraButton1 = 0x00000008			# ExtraButton1 = XButton1
    ForwardButton = 0x00000010
   # XButton2 = 0x00000010		# XButton2 = ForwardButton
   # ExtraButton2 = 0x00000010	# ExtraButton2 = ForwardButton
    TaskButton = 0x00000020
    #ExtraButton3 = 0x00000020	# ExtraButton3 = TaskButton
    ExtraButton4 = 0x00000040
    ExtraButton5 = 0x00000080
    ExtraButton6 = 0x00000100
    ExtraButton7 = 0x00000200
    ExtraButton8 = 0x00000400
    ExtraButton9 = 0x00000800
    ExtraButton10 = 0x00001000
    ExtraButton11 = 0x00002000
    ExtraButton12 = 0x00004000
    ExtraButton13 = 0x00008000
    ExtraButton14 = 0x00010000
    ExtraButton15 = 0x00020000
    ExtraButton16 = 0x00040000
    ExtraButton17 = 0x00080000
    ExtraButton18 = 0x00100000
    ExtraButton19 = 0x00200000
    ExtraButton20 = 0x00400000
    ExtraButton21 = 0x00800000
    ExtraButton22 = 0x01000000
    ExtraButton23 = 0x02000000
    ExtraButton24 = 0x04000000
    AllButtons = 0x07ffffff
   # MaxMouseButton = 0x04000000		# MaxMouseButton = ExtraButton24
    #MouseButtonMask = 0xffffffff
	MouseButtonMask=  4294967295 
end

@enum Orientation begin
    Horizontal = 0x1
    Vertical = 0x2
end

@enum FocusPolicy begin
    NoFocus = 0
    TabFocus = 0x1
    ClickFocus = 0x2
   #StrongFocus = TabFocus | ClickFocus | 0x8
	StrongFocus = 11
	#WheelFocus = StrongFocus | 0x4
	WheelFocus = 15
end

@enum TabFocusBehavior begin
    NoTabFocus = 0x00
    TabFocusTextControls = 0x01
    TabFocusListControls = 0x02
    TabFocusAllControls = 0xff
end

@enum SortOrder begin
    AscendingOrder
    DescendingOrder
end

@enum SplitBehaviorFlags begin
    KeepEmptyParts = 0
    SkipEmptyParts = 0x1
end

@enum TileRule begin
    StretchTile
    RepeatTile
    RoundTile
end

@enum AlignmentFlag begin
    AlignLeft = 0x0001
    #AlignLeading = AlignLeft
    #AlignLeading = 0x0001
    AlignRight = 0x0002
    #AlignTrailing = AlignRight
    #AlignTrailing = 0x0002
    AlignHCenter = 0x0004
    AlignJustify = 0x0008
    AlignAbsolute = 0x0010
   # AlignHorizontal_Mask = AlignLeft | AlignRight | AlignHCenter | AlignJustify | AlignAbsolute
    AlignHorizontal_Mask = 31

    AlignTop = 0x0020
    AlignBottom = 0x0040
    AlignVCenter = 0x0080
    AlignBaseline = 0x0100
    #AlignVertical_Mask = AlignTop | AlignBottom | AlignVCenter | AlignBaseline
    AlignVertical_Mask = 480

    #AlignCenter = AlignVCenter | AlignHCenter
    AlignCenter = 132
end

@enum TextFlag begin
    TextSingleLine = 0x0100
    TextDontClip = 0x0200
    TextExpandTabs = 0x0400
    TextShowMnemonic = 0x0800
    TextWordWrap = 0x1000
    TextWrapAnywhere = 0x2000
    TextDontPrint = 0x4000
    TextIncludeTrailingSpaces = 0x08000000
    TextHideMnemonic = 0x8000
    TextJustificationForced = 0x10000
    TextForceLeftToRight = 0x20000
    TextForceRightToLeft = 0x40000
    TextLongestVariant = 0x80000
end

@enum TextElideMode begin
    ElideLeft
    ElideRight
    ElideMiddle
    ElideNone
end

@enum WhiteSpaceMode begin
    WhiteSpaceNormal
    WhiteSpacePre
    WhiteSpaceNoWrap
    WhiteSpaceModeUndefined = -1
end

@enum HitTestAccuracy begin
    ExactHit
    FuzzyHit
end

aWindow = 0x00000001
aDialog = 0x00000002 | aWindow
aSheet = 0x00000004 | aWindow
aPopup = 0x00000008 | aWindow
aToolTip = aPopup | aSheet

aWindowMinimizeButtonHint = 0x00004000
aWindowMaximizeButtonHint = 0x00008000
aWindowMinMaxButtonsHint = aWindowMinimizeButtonHint | aWindowMaximizeButtonHint


@enum WindowType::Int64 begin
    Widget = 0x00000000
    Window = aWindow
    Dialog = aDialog
    Sheet = aSheet
    Drawer = aSheet | aDialog
    Popup = aPopup
    Tool = aPopup | aDialog
    ToolTip = aToolTip
    SplashScreen = aToolTip | aDialog
    Desktop = 0x00000010 | aWindow
    SubWindow = 0x00000012
    ForeignWindow = 0x00000020 | aWindow
    CoverWindow = 0x00000040 | aWindow

    WindowType_Mask = 0x000000ff
    MSWindowsFixedSizeDialogHint = 0x00000100
    MSWindowsOwnDC = 0x00000200
    BypassWindowManagerHint = 0x00000400
    #X11BypassWindowManagerHint = BypassWindowManagerHint
    FramelessWindowHint = 0x00000800
    WindowTitleHint = 0x00001000
    WindowSystemMenuHint = 0x00002000
    WindowMinimizeButtonHint = aWindowMinimizeButtonHint
    WindowMaximizeButtonHint = aWindowMaximizeButtonHint
    WindowMinMaxButtonsHint = aWindowMinimizeButtonHint | aWindowMaximizeButtonHint
    WindowContextHelpButtonHint = 0x00010000
    WindowShadeButtonHint = 0x00020000
    WindowStaysOnTopHint = 0x00040000
    WindowTransparentForInput = 0x00080000
    WindowOverridesSystemGestures = 0x00100000
    WindowDoesNotAcceptFocus = 0x00200000
    MaximizeUsingFullscreenGeometryHint = 0x00400000

    CustomizeWindowHint = 0x02000000
    WindowStaysOnBottomHint = 0x04000000
    WindowCloseButtonHint = 0x08000000
    MacWindowToolBarButtonHint = 0x10000000
    BypassGraphicsProxyWidget = 0x20000000
    NoDropShadowWindowHint = 0x40000000
    #WindowFullscreenButtonHint = 0x80000000
    WindowFullscreenButtonHint =   2147483648  
end

@enum WindowState begin
    WindowNoState = 0x00000000
    WindowMinimized = 0x00000001
    WindowMaximized = 0x00000002
    WindowFullScreen = 0x00000004
    WindowActive = 0x00000008
end

@enum ApplicationState begin
    ApplicationSuspended = 0x00000000
    ApplicationHidden = 0x00000001
    ApplicationInactive = 0x00000002
    ApplicationActive = 0x00000004
end

@enum ScreenOrientation begin
    PrimaryOrientation = 0x00000000
    PortraitOrientation = 0x00000001
    LandscapeOrientation = 0x00000002
    InvertedPortraitOrientation = 0x00000004
    InvertedLandscapeOrientation = 0x00000008
end
=#