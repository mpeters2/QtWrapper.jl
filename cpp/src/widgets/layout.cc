#include "../common.h"
void * horizontal_layout() {
    return new QHBoxLayout();
}

void * vertical_layout() {
    return new QVBoxLayout();
}

void horizontal_add_layout(void * layout, void * sub_layout) {
    static_cast<QHBoxLayout *>(layout)->addLayout(static_cast<QLayout *>(sub_layout));
}

void vertial_add_layout(void * layout, void * sub_layout) {
    static_cast<QVBoxLayout *>(layout)->addLayout(static_cast<QLayout *>(sub_layout));
}

void horizontal_add_stretch(void * layout) {
    static_cast<QHBoxLayout *>(layout)->addStretch();
}

void vertical_add_stretch(void * layout) {
    static_cast<QVBoxLayout *>(layout)->addStretch();
}

void layout_add_widget(void * layout, void * widget) {
    static_cast<QLayout *>(layout)->addWidget(static_cast<QWidget *>(widget));
}
// MSP new stuff below
void * grid_layout() {
    return new QGridLayout();
}

void grid_add_layout(void * layout, void * sub_layout, int row, int column, int rowSpan, int columnSpan, Qt::Alignment alignment = Qt::Alignment()) {
    static_cast<QGridLayout *>(layout)->addLayout(static_cast<QLayout *>(sub_layout), row, column, rowSpan, columnSpan, alignment);
}

void layout_add_grid_widget(void * layout, void * widget, int row, int column, int rowSpan, int columnSpan, Qt::Alignment alignment = Qt::Alignment()) {
    static_cast<QGridLayout *>(layout)->addWidget(static_cast<QWidget *>(widget), row, column, rowSpan, columnSpan, alignment);
}
// void addLayout(QLayout *, int row, int column, Qt::Alignment = Qt::Alignment());
// void addLayout(QLayout *, int row, int column, int rowSpan, int columnSpan, Qt::Alignment = Qt::Alignment());
