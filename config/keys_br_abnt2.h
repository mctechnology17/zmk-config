/* Copyright 2017 Potiguar Faga
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include <dt-bindings/zmk/hid_usage.h>
#include <dt-bindings/zmk/hid_usage_pages.h>
#include <dt-bindings/zmk/modifiers.h>
#include <dt-bindings/zmk/keys.h>

// clang-format off

/*
 * ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐
 * │ ' │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │       │
 * ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤
 * │     │ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │ ´ │ [ │     │
 * ├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┐    │
 * │      │ A │ S │ D │ F │ G │ H │ J │ K │ L │ Ç │ ~ │ ] │    │
 * ├────┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
 * │    │ \ │ Z │ X │ C │ V │ B │ N │ M │ , │ . │ ; │ / │      │
 * ├────┼───┴┬──┴─┬─┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬──┴─┬────┤
 * │    │    │    │                        │    │    │    │    │
 * └────┴────┴────┴────────────────────────┴────┴────┴────┴────┘
 */
// Row 1
#define BR_SQT GRAVE  // '
#define BR_N1    N1    // 1
#define BR_N2    N2    // 2
#define BR_N3    N3    // 3
#define BR_N4    N4    // 4
#define BR_N5    N5    // 5
#define BR_N6    N6    // 6
#define BR_N7    N7    // 7
#define BR_N8    N8    // 8
#define BR_N9    N9    // 9
#define BR_N0    N0    // 0
#define BR_MINUS MINUS // -
#define BR_EQUAL  EQUAL  // =
// Row 2
#define BR_Q    Q    // Q
#define BR_W    W    // W
#define BR_E    E    // E
#define BR_R    R    // R
#define BR_T    T    // T
#define BR_Y    Y    // Y
#define BR_U    U    // U
#define BR_I    I    // I
#define BR_O    O    // O
#define BR_P    P    // P
#define BR_ACUT LBKT // ´ (dead)
#define BR_LBKT RBKT // [
// Row 3
#define BR_A    A    // A
#define BR_S    S    // S
#define BR_D    D    // D
#define BR_F    F    // F
#define BR_G    G    // G
#define BR_H    H    // H
#define BR_J    J    // J
#define BR_K    K    // K
#define BR_L    L    // L
#define BR_CCED SEMI // Ç
#define BR_TILDE SQT // ~ (dead)
#define BR_RBKT BSLH // ]
// Row 4
#define BR_BSLH NUBS // (backslash)
#define BR_Z    Z    // Z
#define BR_X    X    // X
#define BR_C    C    // C
#define BR_V    V    // V
#define BR_B    B    // B
#define BR_N    N    // N
#define BR_M    M    // M
#define BR_COMMA COMMA // ,
#define BR_DOT  DOT  // .
#define BR_SEMI SLASH // ;
#define BR_SLASH INT1 // /
// Numpad
#define BR_KP_DOT KP_COMMA // .
#define BR_KP_COMMA KP_DOT // ,

/* Shifted symbols
 * ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐
 * │ " │ ! │ @ │ # │ $ │ % │ ¨ │ & │ * │ ( │ ) │ _ │ + │       │
 * ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤
 * │     │   │   │   │   │   │   │   │   │   │   │ ` │ { │     │
 * ├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┐    │
 * │      │   │   │   │   │   │   │   │   │   │   │ ^ │ } │    │
 * ├────┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
 * │    │ | │   │   │   │   │   │   │   │ < │ > │ : │ ? │      │
 * ├────┼───┴┬──┴─┬─┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬──┴─┬────┤
 * │    │    │    │                        │    │    │    │    │
 * └────┴────┴────┴────────────────────────┴────┴────┴────┴────┘
 */
// Row 1
#define BR_DQT LS(BR_SQT) // "
#define BR_EXCL LS(BR_N1)    // !
#define BR_AT   LS(BR_N2)    // @
#define BR_HASH LS(BR_N3)    // #
#define BR_DLLR  LS(BR_N4)    // $
#define BR_PRCNT LS(BR_N5)    // %
#define BR_DIAE LS(BR_N6)    // ¨ (dead)
#define BR_AMPS LS(BR_N7)    // &
#define BR_ASTRK LS(BR_N8)    // *
#define BR_LPAR LS(BR_N9)    // (
#define BR_RPAR LS(BR_N0)    // )
#define BR_UNDER LS(BR_MINUS) // _
#define BR_PLUS LS(BR_EQUAL)  // +
// Row 2
#define BR_GRAVE  LS(BR_ACUT) // ` (dead)
#define BR_LBRC LS(BR_LBKT) // {
// Row 3
#define BR_CIRC LS(BR_TILDE) // ^ (dead)
#define BR_RBRC LS(BR_RBKT) // }
// Row 4
#define BR_PIPE LS(BR_BSLH) // |
#define BR_LT LS(BR_COMMA) // <
#define BR_GT LS(BR_DOT)  // >
#define BR_COLON LS(BR_SEMI) // :
#define BR_QMARK LS(BR_SLASH) // ?

/* AltGr symbols
 * ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐
 * │   │ ¹ │ ² │ ³ │ £ │ ¢ │ ¬ │   │   │   │   │   │ § │       │
 * ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤
 * │     │   │   │ ° │   │   │   │   │   │   │   │   │ ª │     │
 * ├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┐    │
 * │      │   │   │   │   │   │   │   │   │   │   │   │ º │    │
 * ├────┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
 * │    │   │   │   │ ₢ │   │   │   │   │   │   │   │   │      │
 * ├────┼───┴┬──┴─┬─┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬──┴─┬────┤
 * │    │    │    │                        │    │    │    │    │
 * └────┴────┴────┴────────────────────────┴────┴────┴────┴────┘
 */
// Row 1
#define BR_SUP1 ALGR(BR_N1)    // ¹
#define BR_SUP2 ALGR(BR_N2)    // ²
#define BR_SUP3 ALGR(BR_N3)    // ³
#define BR_PND  ALGR(BR_N4)    // £
#define BR_CENT ALGR(BR_N5)    // ¢
#define BR_NOT  ALGR(BR_N6)    // ¬
#define BR_SECT ALGR(BR_EQUAL)  // §
// Row 2
#define BR_DEG  ALGR(BR_E)    // °
#define BR_FORD ALGR(BR_LBKT) // ª
// Row 3
#define BR_MORD ALGR(BR_RBKT) // º
// Row 4
#define BR_CRUZ ALGR(BR_C)    // ₢
