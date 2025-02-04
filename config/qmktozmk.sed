s/QUOT/SQT/g
s/MINS/MINUS/g
s/EQL/EQUAL/g
s/LBRC/LBKT/g
s/RBRC/RBKT/g
s/TILD/TILDE/g
s/BSLS/BSLH/g
s/COMM/COMMA/g
s/DOT/DOT/g
s/SCLN/SEMI/g
s/SLSH/SLASH/g
s/PDOT/KP_DOT/g
s/PCMM/KP_COMMA/g

s/DQUO/DQT/g
s/EXLM/EXCL/g
s/AT/AT/g
s/HASH/HASH/g
s/DLR/DLLR/g
s/PERC/PRCNT/g
s/AMPR/AMPS/g
s/ASTR/ASTRK/g
s/LPRN/LPAR/g
s/RPRN/RPAR/g
s/UNDS/UNDER/g
s/PLUS/PLUS/g

s/GRV/GRAVE/g
s/LCBR/LBRC/g
s/CIRC/CIRC/g
s/RCBR/RBRC/g
s/PIPE/PIPE/g
s/LABK/LT/g
s/RABK/GT/g
s/COLN/COLON/g
s/QUES/QMARK/g

s/\(KC_\|BR_\)\([0-9]\)/\1N\2/g
s/KC_//g
s/S\((\)/LS\1/g

s:#include "keymap.h":#include <dt-bindings/zmk/hid_usage.h>\n#include <dt-bindings/zmk/hid_usage_pages.h>\n#include <dt-bindings/zmk/modifiers.h>\n#include <dt-bindings/zmk/keys.h>:g