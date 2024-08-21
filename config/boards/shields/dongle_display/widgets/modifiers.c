/*
 * Copyright (c) 2024 The ZMK Contributors
 *
 * SPDX-License-Identifier: MIT
 */

#include <zephyr/kernel.h>
#include <zephyr/bluetooth/services/bas.h>

#include <zephyr/logging/log.h>
LOG_MODULE_DECLARE(zmk, CONFIG_ZMK_LOG_LEVEL);

#include <zmk/display.h>
#include <zmk/event_manager.h>
#include <zmk/events/keycode_state_changed.h>
#include <zmk/hid.h>
#include <dt-bindings/zmk/modifiers.h>

#include "modifiers.h"

struct modifiers_state {    
    uint8_t modifiers;
};

struct modifier_symbol {    
    uint8_t modifier;
    const lv_img_dsc_t *symbol_dsc;
    lv_obj_t *symbol;
    lv_obj_t *selection_line; 
    bool is_active;
};

LV_IMG_DECLARE(control_icon);
struct modifier_symbol ms_control = {
    .modifier = MOD_LCTL | MOD_RCTL,
    .symbol_dsc = &control_icon,
};

LV_IMG_DECLARE(shift_icon);
struct modifier_symbol ms_shift = {
    .modifier = MOD_LSFT | MOD_RSFT,
    .symbol_dsc = &shift_icon,
};

LV_IMG_DECLARE(alt_icon);
struct modifier_symbol ms_alt = {
    .modifier = MOD_LALT | MOD_RALT,
    .symbol_dsc = &alt_icon,
};

LV_IMG_DECLARE(win_icon);
struct modifier_symbol ms_gui = {
    .modifier = MOD_LGUI | MOD_RGUI,
    .symbol_dsc = &win_icon,
};

LV_IMG_DECLARE(opt_icon);
struct modifier_symbol ms_opt = {
    .modifier = MOD_LALT | MOD_RALT,
    .symbol_dsc = &opt_icon,
};

LV_IMG_DECLARE(cmd_icon);
struct modifier_symbol ms_cmd = {
    .modifier = MOD_LGUI | MOD_RGUI,
    .symbol_dsc = &cmd_icon,
};

struct modifier_symbol *modifier_symbols[] = {
    // this order determines the order of the symbols
    &ms_cmd,
    &ms_opt,
    &ms_control,
    &ms_shift
};

#define NUM_SYMBOLS (sizeof(modifier_symbols) / sizeof(struct modifier_symbol *))

static sys_slist_t widgets = SYS_SLIST_STATIC_INIT(&widgets);

static void anim_y_cb(void *var, int32_t v) {
    lv_obj_set_y(var, v);
}

static void move_object_y(void *obj, int32_t from, int32_t to) {
    lv_anim_t a;
    lv_anim_init(&a);
    lv_anim_set_var(&a, obj);
    lv_anim_set_time(&a, 200); // will be replaced with lv_anim_set_duration
    lv_anim_set_exec_cb(&a, anim_y_cb);
    lv_anim_set_path_cb(&a, lv_anim_path_overshoot);
    lv_anim_set_values(&a, from, to);
    lv_anim_start(&a);
}

static void set_modifiers(lv_obj_t *widget, struct modifiers_state state) {
    for (int i = 0; i < NUM_SYMBOLS; i++) {
        bool mod_is_active = (state.modifiers & modifier_symbols[i]->modifier) > 0;

        if (mod_is_active && !modifier_symbols[i]->is_active) {
            move_object_y(modifier_symbols[i]->symbol, 1, 0);
            move_object_y(modifier_symbols[i]->selection_line, SIZE_SYMBOLS + 4, SIZE_SYMBOLS + 2);
            modifier_symbols[i]->is_active = true;
        } else if (!mod_is_active && modifier_symbols[i]->is_active) {
            move_object_y(modifier_symbols[i]->symbol, 0, 1);
            move_object_y(modifier_symbols[i]->selection_line, SIZE_SYMBOLS + 2, SIZE_SYMBOLS + 4);
            modifier_symbols[i]->is_active = false;
        }
    }
}

void modifiers_update_cb(struct modifiers_state state) {
    struct zmk_widget_modifiers *widget;
    SYS_SLIST_FOR_EACH_CONTAINER(&widgets, widget, node) { set_modifiers(widget->obj, state); }
}

static struct modifiers_state modifiers_get_state(const zmk_event_t *eh) {
    return (struct modifiers_state) {
        .modifiers = zmk_hid_get_explicit_mods()
    };
}

ZMK_DISPLAY_WIDGET_LISTENER(widget_modifiers, struct modifiers_state,
                            modifiers_update_cb, modifiers_get_state)

ZMK_SUBSCRIPTION(widget_modifiers, zmk_keycode_state_changed);

int zmk_widget_modifiers_init(struct zmk_widget_modifiers *widget, lv_obj_t *parent) {
    widget->obj = lv_obj_create(parent);

    lv_obj_set_size(widget->obj, NUM_SYMBOLS * (SIZE_SYMBOLS + 1) + 1, SIZE_SYMBOLS + 3);
    
    static lv_style_t style_line;
    lv_style_init(&style_line);
    lv_style_set_line_width(&style_line, 2);

    static const lv_point_t selection_line_points[] = { {0, 0}, {SIZE_SYMBOLS, 0} };

    for (int i = 0; i < NUM_SYMBOLS; i++) {
        modifier_symbols[i]->symbol = lv_img_create(widget->obj);
        lv_obj_align(modifier_symbols[i]->symbol, LV_ALIGN_TOP_LEFT, 1 + (SIZE_SYMBOLS + 1) * i, 1);
        lv_img_set_src(modifier_symbols[i]->symbol, modifier_symbols[i]->symbol_dsc);

        modifier_symbols[i]->selection_line = lv_line_create(widget->obj);
        lv_line_set_points(modifier_symbols[i]->selection_line, selection_line_points, 2);
        lv_obj_add_style(modifier_symbols[i]->selection_line, &style_line, 0);
        lv_obj_align_to(modifier_symbols[i]->selection_line, modifier_symbols[i]->symbol, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 3);
    }

    sys_slist_append(&widgets, &widget->node);

    widget_modifiers_init();

    return 0;
}

lv_obj_t *zmk_widget_modifiers_obj(struct zmk_widget_modifiers *widget) {
    return widget->obj;
}