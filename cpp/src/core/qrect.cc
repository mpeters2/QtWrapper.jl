#include "../common.h"

void * rect(int aleft, int atop, int awidth, int aheight) {
    return new QRect(aleft, atop, awidth, aheight);
}

// constexpr inline QRect::QRect(int aleft, int atop, int awidth, int aheight) 
