//qmk compile -kb lily58/rev1 -km mine
// qmk flash -kb lily58 -km mine -bl dfu

#include QMK_KEYBOARD_H

enum layer_number {
  _QWERTY = 0,
  _LOWER,
  _RAISE,
  //_ADJUST,
};

enum custom_keycodes {
    KC_QWERTY = SAFE_RANGE,
    KC_COLEMAK_DH,
    KC_LOWER,
    KC_RAISE,
    // KC_ADJUST,
    // KC_PRVWD,
    // KC_NXTWD,
    KC_LSTRT,
    KC_LEND,
    // KC_DLINE
};

// Tap Dance keycodes
enum td_keycodes {
    ALT_S
};

// Define a type containing as many tapdance states as you need
typedef enum {
    TD_NONE,
    TD_UNKNOWN,
    TD_SINGLE_TAP,
    TD_SINGLE_HOLD,
    TD_DOUBLE_SINGLE_TAP,
    TD_DOUBLE_HOLD
} td_state_t;

// Create a global instance of the tapdance state type
// static td_state_t td_state;

// Declare your tapdance functions:

// Function to determine the current tapdance state
// td_state_t cur_dance(qk_tap_dance_state_t *state);

 // `finished` and `reset` functions for each tapdance keycode
// void alttl_finished(qk_tap_dance_state_t *state, void *user_data);
// void alttl_reset(qk_tap_dance_state_t *state, void *user_data);

#define CTL_ESC MT(MOD_LCTL, KC_ESC)
#define SFT_SPC MT(MOD_LSFT, KC_SPC)

#define TAB_LOW LT(1, KC_TAB)
#define ENT_RAI LT(2, KC_ENT)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/* QWERTY
 * ,--------------------------------------------.                    ,-----------------------------------------.
 * | ESC     |   1  |   2  |   3  |   4  |   5  |                    |   6  |   7  |   8  |   9  |   0  | DEL  |
 * |---------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * | Tab     |   Q  |   W  |   E  |   R  |   T  |                    |   Y  |   U  |   I  |   O  |   P  | BSPC |
 * |---------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * | LSFT    |   A  |   S  |   D  |   F  |   G  |-------.    ,-------|   H  |   J  |   K  |   L  |   ;  |  '   |
 * |---------+------+------+------+------+------|   [   |    |    ]  |------+------+------+------+------+------|
 * | CTRL ESC|   Z  |   X  |   C  |   V  |   B  |-------|    |-------|   N  |   M  |   ,  |   .  |   /  |RShift|
 * `--------------------------------------------/       /     \      \-----------------------------------------'
 *                      | LGUI | LAlt | TAB  | /Space  /       \Enter \  |Bspc  |RAlt  | RGUI |
 *                      |      |      |LOWER |/ LSFT  /         \RAISE \ |      |      |      |
 *                      `----------------------------'           '------''--------------------'
 */

 [_QWERTY] = LAYOUT(
  KC_GRV,   KC_1,   KC_2,    KC_3,    KC_4,    KC_5,                          KC_6,    KC_7,    KC_8,    KC_9,    KC_0,     KC_DEL,
  KC_TAB,   KC_Q,   KC_W,    KC_E,    KC_R,    KC_T,                          KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,     KC_BSPC,
  KC_LSFT,  KC_A,   KC_S,    KC_D,    KC_F,    KC_G,                          KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN,  KC_QUOT,
  CTL_ESC,  KC_Z,   KC_X,    KC_C,    KC_V,    KC_B, KC_LBRC,       KC_RBRC,  KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH,  KC_RSFT,
                        KC_LGUI, KC_LALT, TAB_LOW, SFT_SPC ,              ENT_RAI, KC_BSPC, KC_RALT, KC_RGUI
),



/* LOWER
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * |      |  F1  |  F2  |  F3  |  F4  |  F5  |                    |  F6  |  F7  |  F8  |  F9  | F10  | F11  |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |      |   1  |   2  |   3  |   4  |   5  |                    |   6  |   7  |   8  |   9  |   0  | F12  |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |      |   !  |   @  |  #   |  $   |   %  |-------.    ,-------|   ^  |   (  |   )  |   &  |   *  |   |  |
 * |------+------+------+------+------+------|       |    |       |------+------+------+------+------+------|
 * |      |  {   |  }   |  +   |   -  |   =  |-------|    |-------|   [  |   ]  |   ;  |   :  |   \  | Shift|
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *                   |      |      |      | /       /       \RAISE \  |      |      |      |
 *                   |      |      |      |/       /         \      \ |      |      |      |
 *                   `----------------------------'           '------''--------------------'
 */
[_LOWER] = LAYOUT( \
  _______, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,                          KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,\
  _______, KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                           KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_F12, \
  _______, KC_EXLM, KC_AT, 	 KC_HASH, KC_DLR,  KC_PERC,                        KC_CIRC, KC_LPRN, KC_RPRN, KC_AMPR, KC_ASTR, KC_PIPE, \
  _______, KC_LCBR, KC_RCBR, KC_PLUS, KC_MINS, KC_EQL, _______,       _______, KC_LBRC, KC_RBRC, KC_SCLN, KC_COLN, KC_BSLS, _______, \
				       _______, _______, _______, _______,                 KC_RAISE, _______, _______, _______ \
),



/* RAISE
 * ,----------------------------------------.                    ,-----------------------------------------.
 * | PSCR |   !  |   @  |   #  |   $  |  %  |                    |MBTN1 | MUP  |MBTN2 |      |      |      |
 * |------+------+------+------+------+-----|                    |------+------+------+------+------+------|
 * |      |  {   |  }   |  +   |   -  |  =  |                    |MLEFT | MDOWN|MRIGHT|      |      |      |
 * |------+------+------+------+------+-----|                    |------+------+------+------+------+------|
 * |      |  ^  |   (  |   )  |   &  |   *  |-------.    ,-------| Left | Down |  Up  | Down |      |      |
 * |------+-----+------+------+------+------|       |    |       |------+------+------+------+------+------|
 * |      |  [  |   ]  |   ;  |   :  |   \  |-------|    |-------| Pgup |Pgdown|      |      | Home | End  |
 * `-----------------------------------------/      /     \       \-----------------------------------------'
 *                   | CAPS |      |LOWER | /      /       \Enter  \  |RAISE |BackSP| RGUI |
 *                   |      |      |      |/      /         \       \ |      |      |      |
 *                   `---------------------------'           '-------''--------------------'
 */

[_RAISE] = LAYOUT( \
  KC_PSCR,  KC_EXLM, KC_AT,   KC_HASH, KC_DLR,  KC_PERC,                        KC_MS_BTN1, KC_MS_UP,   KC_MS_BTN2,  _______, _______, _______, \
  _______,  KC_LCBR, KC_RCBR, KC_PLUS, KC_MINS, KC_EQL,              		        KC_MS_LEFT, KC_MS_DOWN, KC_MS_RIGHT, _______, _______, _______, \
  _______,  KC_CIRC, KC_LPRN, KC_RPRN, KC_AMPR, KC_ASTR,         		            KC_LEFT,  KC_DOWN, KC_UP,   KC_RIGHT,  _______, _______, \
  _______,  KC_LBRC, KC_RBRC, KC_SCLN, KC_COLN, KC_BSLS, _______,      _______, KC_PGUP,  KC_PGDOWN, _______, _______, KC_LSTRT, KC_LEND, \
				        KC_CAPS, _______, KC_LOWER, _______,                 _______, _______, _______, _______ \
),


/* ADJUST
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * |      |      |      |      |      |      |                    |      |      |      |      |      |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |      |      |      |      |      |      |                    |      |      |      |      |      |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |      |      |      |      |      |      |-------.    ,-------|      |      |RGB ON| HUE+ | SAT+ | VAL+ |
 * |------+------+------+------+------+------|       |    |       |------+------+------+------+------+------|
 * |      |      |      |      |      |      |-------|    |-------|      |      | MODE | HUE- | SAT- | VAL- |
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *                   | LAlt | LGUI |LOWER | /Space  /       \Enter \  |RAISE |BackSP| RGUI |
 *                   |      |      |      |/       /         \      \ |      |      |      |
 *                   `----------------------------'           '------''--------------------'
 */
  // [_ADJUST] = LAYOUT(
  // XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  // XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  // XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  // XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //                            _______, _______, _______, _______, _______,  _______, _______, _______
  // )
};

// layer_state_t layer_state_set_user(layer_state_t state) {
//   return update_tri_layer_state(state, _LOWER, _RAISE, _ADJUST);
// }



bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        // case KC_QWERTY:
        //     if (record->event.pressed) {
        //         set_single_persistent_default_layer(_QWERTY);
        //     }
        //     return false;
        // case KC_COLEMAK_DH:
        //     if (record->event.pressed) {
        //         set_single_persistent_default_layer(_COLEMAK_DH);
        //     }
        //     return false;
        case KC_LOWER:
            if (record->event.pressed) {
                layer_on(_LOWER);
                // update_tri_layer(_LOWER, _RAISE, _ADJUST);
            } else {
                layer_off(_LOWER);
                // update_tri_layer(_LOWER, _RAISE, _ADJUST);
            }
            return false;
        case KC_RAISE:
            if (record->event.pressed) {
                layer_on(_RAISE);
                // update_tri_layer(_LOWER, _RAISE, _ADJUST);
            } else {
                layer_off(_RAISE);
                // update_tri_layer(_LOWER, _RAISE, _ADJUST);
            }
            return false;
        // case KC_ADJUST:
        //     if (record->event.pressed) {
        //         layer_on(_ADJUST);
        //     } else {
        //         layer_off(_ADJUST);
        //     }
        //     return false;
        // case KC_PRVWD:
        //     if (record->event.pressed) {
        //         if (keymap_config.swap_lctl_lgui) {
        //             register_mods(mod_config(MOD_LALT));
        //             register_code(KC_LEFT);
        //         } else {
        //             register_mods(mod_config(MOD_LCTL));
        //             register_code(KC_LEFT);
        //         }
        //     } else {
        //         if (keymap_config.swap_lctl_lgui) {
        //             unregister_mods(mod_config(MOD_LALT));
        //             unregister_code(KC_LEFT);
        //         } else {
        //             unregister_mods(mod_config(MOD_LCTL));
        //             unregister_code(KC_LEFT);
        //         }
        //     }
        //     break;
        // case KC_NXTWD:
        //      if (record->event.pressed) {
        //         if (keymap_config.swap_lctl_lgui) {
        //             register_mods(mod_config(MOD_LALT));
        //             register_code(KC_RIGHT);
        //         } else {
        //             register_mods(mod_config(MOD_LCTL));
        //             register_code(KC_RIGHT);
        //         }
        //     } else {
        //         if (keymap_config.swap_lctl_lgui) {
        //             unregister_mods(mod_config(MOD_LALT));
        //             unregister_code(KC_RIGHT);
        //         } else {
        //             unregister_mods(mod_config(MOD_LCTL));
        //             unregister_code(KC_RIGHT);
        //         }
        //     }
        //     break;
        // case KC_LSTRT:
        //     if (record->event.pressed) {
        //         if (keymap_config.swap_lctl_lgui) {
        //              //CMD-arrow on Mac, but we have CTL and GUI swapped
        //             register_mods(mod_config(MOD_LCTL));
        //             register_code(KC_LEFT);
        //         } else {
        //             register_code(KC_HOME);
        //         }
        //     } else {
        //         if (keymap_config.swap_lctl_lgui) {
        //             unregister_mods(mod_config(MOD_LCTL));
        //             unregister_code(KC_LEFT);
        //         } else {
        //             unregister_code(KC_HOME);
        //         }
        //     }
        //     break;
        // case KC_LEND:
        //     if (record->event.pressed) {
        //         if (keymap_config.swap_lctl_lgui) {
        //             //CMD-arrow on Mac, but we have CTL and GUI swapped
        //             register_mods(mod_config(MOD_LCTL));
        //             register_code(KC_RIGHT);
        //         } else {
        //             register_code(KC_END);
        //         }
        //     } else {
        //         if (keymap_config.swap_lctl_lgui) {
        //             unregister_mods(mod_config(MOD_LCTL));
        //             unregister_code(KC_RIGHT);
        //         } else {
        //             unregister_code(KC_END);
        //         }
        //     }
        //     break;
        // case KC_DLINE:
        //     if (record->event.pressed) {
        //         register_mods(mod_config(MOD_LCTL));
        //         register_code(KC_BSPC);
        //     } else {
        //         unregister_mods(mod_config(MOD_LCTL));
        //         unregister_code(KC_BSPC);
        //     }
        //     break;
        // case KC_COPY:
        //     if (record->event.pressed) {
        //         register_mods(mod_config(MOD_LCTL));
        //         register_code(KC_C);
        //     } else {
        //         unregister_mods(mod_config(MOD_LCTL));
        //         unregister_code(KC_C);
        //     }
        //     return false;
        // case KC_PASTE:
        //     if (record->event.pressed) {
        //         register_mods(mod_config(MOD_LCTL));
        //         register_code(KC_V);
        //     } else {
        //         unregister_mods(mod_config(MOD_LCTL));
        //         unregister_code(KC_V);
        //     }
        //     return false;
        // case KC_CUT:
        //     if (record->event.pressed) {
        //         register_mods(mod_config(MOD_LCTL));
        //         register_code(KC_X);
        //     } else {
        //         unregister_mods(mod_config(MOD_LCTL));
        //         unregister_code(KC_X);
        //     }
        //     return false;
        //     break;
        // case KC_UNDO:
        //     if (record->event.pressed) {
        //         register_mods(mod_config(MOD_LCTL));
        //         register_code(KC_Z);
        //     } else {
        //         unregister_mods(mod_config(MOD_LCTL));
        //         unregister_code(KC_Z);
        //     }
        //     return false;
    }
    return true;
}




// // Determine the tapdance state to return
// td_state_t cur_dance(qk_tap_dance_state_t *state) {
//     if (state->count == 1) {
//         if (state->interrupted || !state->pressed) return TD_SINGLE_TAP;
//         else return TD_SINGLE_HOLD;
//     }

//     if (state->count == 2) {
//         if (state->interrupted || !state->pressed) return TD_DOUBLE_SINGLE_TAP;
// 		else return TD_DOUBLE_HOLD;
// 	}
//     else return TD_UNKNOWN; // Any number higher than the maximum state value you return above
// }

// // Handle the possible states for each tapdance keycode you define:

// void alttl_finished(qk_tap_dance_state_t *state, void *user_data) {
//     td_state = cur_dance(state);
//     switch (td_state) {
//         case TD_SINGLE_TAP:
// 			set_oneshot_mods(MOD_LSFT);
//             break;
//         case TD_SINGLE_HOLD:
//             // register_mods(MOD_BIT(KC_LALT)); // For a layer-tap key, use `layer_on(_MY_LAYER)` here
// 			register_mods(MOD_BIT(KC_LALT));
//             break;
//         default:
//             break;
//     }
// }

// void alttl_reset(qk_tap_dance_state_t *state, void *user_data) {
//     switch (td_state) {
//         case TD_SINGLE_TAP:
//             break;
//         case TD_SINGLE_HOLD:
//             // unregister_mods(MOD_BIT(KC_LALT)); // For a layer-tap key, use `layer_off(_MY_LAYER)` here
// 			unregister_mods(MOD_BIT(KC_LALT));
//             break;
//         default:
//             break;
//     }
// }

// // Define `ACTION_TAP_DANCE_FN_ADVANCED()` for each tapdance keycode, passing in `finished` and `reset` functions
// qk_tap_dance_action_t tap_dance_actions[] = {
//     [ALT_S] = ACTION_TAP_DANCE_FN_ADVANCED(NULL, alttl_finished, alttl_reset)
// };
