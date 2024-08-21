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
#include <zmk/events/hid_indicators_changed.h>

#include "hid_indicators.h"

#define LED_NLCK 0x01
#define LED_CLCK 0x02
#define LED_SLCK 0x04

struct hid_indicators_state {    
    uint8_t hid_indicators;
};

static sys_slist_t widgets = SYS_SLIST_STATIC_INIT(&widgets);

static void set_hid_indicators(lv_obj_t *label, struct hid_indicators_state state) {
    char text[7] = {};
    bool lock = false;

    if (state.hid_indicators & LED_CLCK) {
        strncat(text, "C", 1);
        lock = true;
    }
    if (state.hid_indicators & LED_NLCK) {
        strncat(text, "N", 1);
        lock = true;
    }
    if (state.hid_indicators & LED_SLCK) {
        strncat(text, "S", 1);
        lock = true;
    }
    if (lock) {
        strncat(text, "LCK", 3);
    }

    lv_label_set_text(label, text);
}

void hid_indicators_update_cb(struct hid_indicators_state state) {
    struct zmk_widget_hid_indicators *widget;
    SYS_SLIST_FOR_EACH_CONTAINER(&widgets, widget, node) { set_hid_indicators(widget->obj, state); }
}

static struct hid_indicators_state hid_indicators_get_state(const zmk_event_t *eh) {
    struct zmk_hid_indicators_changed *ev = as_zmk_hid_indicators_changed(eh);
    return (struct hid_indicators_state) {
        .hid_indicators = ev->indicators,
    };
}

ZMK_DISPLAY_WIDGET_LISTENER(widget_hid_indicators, struct hid_indicators_state,
                            hid_indicators_update_cb, hid_indicators_get_state)

ZMK_SUBSCRIPTION(widget_hid_indicators, zmk_hid_indicators_changed);

int zmk_widget_hid_indicators_init(struct zmk_widget_hid_indicators *widget, lv_obj_t *parent) {
    widget->obj = lv_label_create(parent);

    sys_slist_append(&widgets, &widget->node);

    widget_hid_indicators_init();

    return 0;
}

lv_obj_t *zmk_widget_hid_indicators_obj(struct zmk_widget_hid_indicators *widget) {
    return widget->obj;
}
