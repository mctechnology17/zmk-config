#pragma once

#define TAPPING_TERM 150

#define ZMK_HELPER_STRINGIFY(x) #x

#define AC_MODMORPH(name, ac_binding, shifted_ac_binding) \
    / { \
        behaviors { \
            name: name { \
                compatible = "zmk,behavior-mod-morph"; \
                label = ZMK_HELPER_STRINGIFY(AC_MORPH_ ## name); \
                #binding-cells = <0>; \
                bindings = <uc_binding>, <shifted_uc_binding>; \
                mods = <(MOD_LSFT|MOD_RSFT)>; \
            }; \
        }; \
    };

#define AC_MACRO(name, letter, accent) \
    / { \
        macros { \
            name: name { \
                compatible = "zmk,behavior-macro"; \
                label = ZMK_HELPER_STRINGIFY(AC_MACRO_ ## name); \
                wait-ms = <10>; \
                tap-ms = <10>; \
                #binding-cells = <0>; \
                bindings = <&kp accent &kp letter>;\
            }; \
        }; \
    };


#define AC_KEY(name, letter, accent) \
    / { \
        macros { \
            name ## _down: name ## _down { \
                compatible = "zmk,behavior-macro"; \
                label = ZMK_HELPER_STRINGIFY(AC_MACRO_ ## name ## _down); \
                wait-ms = <10>; \
                tap-ms = <10>; \
                #binding-cells = <0>; \
                bindings = <&kp accent &kp letter>;\
            }; \
            name ## _up: name ## _up { \
                compatible = "zmk,behavior-macro"; \
                label = ZMK_HELPER_STRINGIFY(AC_MACRO_ ## name ## _up); \
                wait-ms = <10>; \
                tap-ms = <10>; \
                #binding-cells = <0>; \
                bindings = <&kp accent &kp LS(letter)>;	\
            }; \
        }; \
        behaviors { \
            name: name { \
                compatible = "zmk,behavior-mod-morph"; \
                label = ZMK_HELPER_STRINGIFY(AC_MORPH_ ## name); \
                #binding-cells = <0>; \
                bindings = <&name ## _down>, <&name ## _up>; \
                mods = <(MOD_LSFT|MOD_RSFT)>; \
            }; \
        }; \
    };

#define UNDEAD_KEY(name, key) \
    / { \
        macros { \
            name: name { \
                compatible = "zmk,behavior-macro"; \
                label = ZMK_HELPER_STRINGIFY(UNDEAD_MACRO_ ## name); \
                wait-ms = <10>; \
                tap-ms = <10>; \
                #binding-cells = <0>; \
                bindings = <&kp key &kp SPACE>; \
            }; \
        }; \
    };