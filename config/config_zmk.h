/* ========================================
FileName: config_zmk.h
Date: 15:17 23.September.2022
Author: Marcos Chow Castro
Email: mctechnology170318@gmail.com
GitHub: https://github.com/mctechnology17
Brief: define config for the wireless corne keyboard
Use: in your keymap file, include this file
     #include "config_zmk.h"
===========================================
Copyright 2023 Marcos Ivan Chow Castro
                           ╔═╦═╦═╗
                    ╔════╗ ║║║║║╔╝
                    ║╔╗╔╗║ ║║║║║╚╗
                    ╚╝║║╚╝ ║╠═╩╩═╝
                      ║╠═╦═╣╚╦═╦╦═╦╗╔═╦═╦╦╗
                      ║║╩╣═╣║║║║║╬║╚╣╬║╬║║║
                      ╚╩═╩═╩╩╩╩═╩═╩═╩═╬╗╠╗║
                                      ╚═╩═╝

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

// mouse config, 1 = enable, 0 = disable, default = 1
#define MC_TECHNOLOGY_MOUSE_ENABLE 1

// layers
#define DEFAULT 0
#define NUMBER 1
#define SYMBOL 2
#define FUNCTION 3
#define MEDIA 4
#define MOUSE 5
// esta capa la uso por la compatibilidad entre mac, windows y linux
// a veces los caracteres no son los mismos
#define LX_ 6
#define LOCK 7

#define NAV_LEFT &mt HOME LEFT  // tap: left  | long-tap: beginning of line
#define NAV_RIGHT &mt END RIGHT // tap: right | long-tap: end       of line
#define NAV_UP &mt LC(HOME) UP  // tap: up    | long-tap: beginning of document
#define NAV_DOWN                                                               \
  &mt LC(END) DOWN // tap: down  | long-tap: end       of document
#define NAV_BSPC                                                               \
  &mt LC(BSPC) BSPC             // tap: bspc  | long-tap: delete word backward
#define NAV_DEL &mt LC(DEL) DEL // tap: del   | long-tap: delete word forward

// combinadas para optimizar espacio
#define MEDIA_ESC &lt MEDIA ESC
#define MOUSE_TAB &lt MOUSE TAB
#define NUMBER_SPACE &lt NUMBER SPACE
#define SYMBOL_RGUI &mo SYMBOL     // &lt SYMBOL RGUI
#define FUNCTION_RALT &mo FUNCTION // &lt FUNCTION RALT

// default_layer
#define LSHFT_COMMA &mt LSHFT COMMA

// function_layer
#define SPELL &kp LC(LG(D))
#define TRADUCT &kp LS(LA(T))
#define SNIPPET &kp LA(LG(G))
#define CLIPBRD &kp LA(LG(V))
#define EMOJI &kp LC(LG(SPACE))
#define TASKM &kp LC(LA(DEL)) // C-A-DEL

// media_layer
#define SC_FLOW &kp LS(LG(NUMBER_1)) // <S-D-1> ScrenFlow app for MacOS
#define TXTSNIP &kp LS(LG(NUMBER_2)) // <S-D-2> TextSniper app for MacOS
#define SC_SHOT                                                                \
  &kp LS(LG(NUMBER_3)) // <S-D-3> ScrenShot for all system see &kp PRINTSCREEN
                       // for MacOS
#define SC_SPSF                                                                \
  &kp LS(LG(NUMBER_4)) // <S-D-4> Save picture of screen as a file for MacOS
#define SC_RE                                                                  \
  &kp LS(LG(NUMBER_5)) // <S-D-5> Screenshot and recording options for MacOS
#define OP_TERM                                                                \
  &kp LC(LG(LA(SLASH))) // open terminal iTerm2 in current directory for MacOS
#define POS1                                                                   \
  &kp LA(LG(NUMBER_1)) // positions of current app with cmacro2iner integration
                       // for MacOS
#define POS2                                                                   \
  &kp LA(LG(NUMBER_2)) // positions of current app with cmacro2iner integration
                       // for MacOS
#define POS3                                                                   \
  &kp LA(LG(NUMBER_3)) // positions of current app with cmacro2iner integration
                       // for MacOS
#define POS4                                                                   \
  &kp LA(LG(NUMBER_4)) // positions of current app with cmacro2iner integration
                       // for MacOS

// define blueth
#define BT(n) BT_SEL n

// vim: set ft=c fdm=marker:
