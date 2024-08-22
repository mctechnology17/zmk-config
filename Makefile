# ========================================
# FileName: Makefile
# Date: 07.03.2023
# Author: Marcos Chow Castro
# Email: mctechnology170318@gmail.com
# GitHub: https://github.com/mctechnology17
# Brief: Makefile for ZMK firmware with Docker
# Shields: corne sofle splitkb_aurora_sofle
# Boards: nice_nano_v2 puchi_ble_v1 seeeduino_xiao_ble
# =========================================
#                              ╔═╦═╦═╗
#                       ╔════╗ ║║║║║╔╝
#                       ║╔╗╔╗║ ║║║║║╚╗
#                       ╚╝║║╚╝ ║╠═╩╩═╝
#                         ║╠═╦═╣╚╦═╦╦═╦╗╔═╦═╦╦╗
#                         ║║╩╣═╣║║║║║╬║╚╣╬║╬║║║
#                         ╚╩═╩═╩╩╩╩═╩═╩═╩═╬╗╠╗║
#                                         ╚═╩═╝
# to update the branch
# https://hub.docker.com/r/zmkfirmware/zmk-dev-arm/tags
# https://github.com/zmkfirmware/zmk/blob/main/.devcontainer/Dockerfile
# docker pull zmkfirmware/zmk-dev-arm:3.2-branch
#
# CUSTOM BRANCH EXAMPLE:
# git clone https://github.com/petejohanson/zmk -b v3.4.0+zmk-fixes
#
# WIDGET BRANCH ANIMATED
# cmake-args: -DKEYMAP_FILE=../../config/other-corne.keymap -DCONFIG_ZMK_KEYBOARD_NAME=\"other-corne\" -DEXTRA_CONF_FILE=../../config/other-corne.conf
# /Users/marcos/zmk-privat/config/config_ready/nice/oled_rgb/corne.conf
# -DKEYMAP_FILE=../../config/other-corne.keymap -DCONFIG_ZMK_KEYBOARD_NAME=\"other-corne\" -DEXTRA_CONF_FILE=../../config/other-corne.conf
# module:
# https://github.com/caksoylar/zmk-rgbled-widget

### config
# extra_conf_file_oled_rgb= -DEXTRA_CONF_FILE=${PWD}/config/config_ready/nice/oled_rgb/corne.conf
extra_modules_dir=${PWD}
extra_modules= -DZMK_EXTRA_MODULES="/boards"
config=${PWD}/config
nice_mount=/Volumes/NICENANO
puchi_mount=/Volumes/NRF52BOOT
xiao_mount=/Volumes/XIAO-SENSE
zmk_image=zmkfirmware/zmk-dev-arm:3.5
nice=nice_nano_v2
puchi=puchi_ble_v1
xiao=seeeduino_xiao_ble
urob=zmk-codebase_urob
default=zmk-codebase_default
# --name zmk-$@ is for codebase_urob, for example: zmk-codebase_urob
docker_opts= \
	--interactive \
	--tty \
	--name zmk-$@ \
	--workdir /zmk \
	--volume "${config}:/zmk-config:Z" \
	--volume "${PWD}/zmk:/zmk:Z" \
	--volume "${extra_modules_dir}:/boards:Z" \
	${zmk_image}

### name
keyboard_name_nice= '-DCONFIG_ZMK_KEYBOARD_NAME="Nice_Corne_View"'
keyboard_name_nice_oled= '-DCONFIG_ZMK_KEYBOARD_NAME="Nice_Corne_Oled"'
keyboard_name_nice_dongle= '-DCONFIG_ZMK_KEYBOARD_NAME="Nice_Dongle"'
keyboard_name_nice_dongle_oled= '-DCONFIG_ZMK_KEYBOARD_NAME="Nice_Dongle_O"'
keyboard_name_nice_dongle_view= '-DCONFIG_ZMK_KEYBOARD_NAME="Nice_Dongle_V"'
keyboard_name_puchi_view= '-DCONFIG_ZMK_KEYBOARD_NAME="Puchi_Corne_View"'
keyboard_name_puchi_oled= '-DCONFIG_ZMK_KEYBOARD_NAME="Puchi_Corne_Oled"'
keyboard_name_puchi_dongle= '-DCONFIG_ZMK_KEYBOARD_NAME="Puchi_Dongle"'
keyboard_name_puchi_dongle_oled= '-DCONFIG_ZMK_KEYBOARD_NAME="Puchi_Dongle_O"'
keyboard_name_puchi_dongle_view= '-DCONFIG_ZMK_KEYBOARD_NAME="Puchi_Dongle_V"'
keyboard_name_xiao_dongle= '-DCONFIG_ZMK_KEYBOARD_NAME="Xiao_Dongle"'
keyboard_name_xiao_dongle_oled= '-DCONFIG_ZMK_KEYBOARD_NAME="Xiao_Dongle_O"'
keyboard_name_xiao_dongle_view= '-DCONFIG_ZMK_KEYBOARD_NAME="Xiao_Dongle_V"'

### west
west_built_puchi= \
	    west build /zmk/app \
	    --pristine --board "${puchi}"

west_built_nice= \
	    west build /zmk/app \
	    --pristine --board "${nice}"

west_built_xiao= \
	    west build /zmk/app \
	    --pristine --board "${xiao}"

### shields
shield_settings_reset= \
	    -- -DSHIELD="settings_reset" -DZMK_CONFIG="/zmk-config"
shield_corne_left= \
	    -- -DSHIELD="corne_left" -DZMK_CONFIG="/zmk-config"
shield_corne_right_view= \
	    -- -DSHIELD="corne_right nice_view_adapter nice_view" \
	    -DZMK_CONFIG="/zmk-config"
shield_corne_right= \
	    -- -DSHIELD="corne_right" -DZMK_CONFIG="/zmk-config"
shield_corne_left_view= \
	    -- -DSHIELD="corne_left nice_view_adapter nice_view" \
	    -DZMK_CONFIG="/zmk-config"
shield_xiao_corne_dongle_xiao= \
	    -- -DSHIELD="corne_dongle_xiao" -DZMK_CONFIG="/zmk-config"
shield_xiao_corne_dongle_xiao_dongle_display= \
	    -- -DSHIELD="corne_dongle_xiao dongle_display" \
	    -DZMK_CONFIG="/zmk-config"
shield_xiao_corne_dongle_xiao_rgbled_adapter= \
	    -- -DSHIELD="corne_dongle_xiao rgbled_adapter" \
	    -DZMK_CONFIG="/zmk-config"
shield_xiao_corne_dongle_xiao_dongle_display_rgbled_adapter= \
	    -- -DSHIELD="corne_dongle_xiao dongle_display rgbled_adapter" \
	    -DZMK_CONFIG="/zmk-config"
shield_corne_left_peripheral_view= \
	    -- -DSHIELD="corne_left_peripheral nice_view_adapter nice_view" \
	    -DZMK_CONFIG="/zmk-config"
shield_corne_left_peripheral_oled= \
	    -- -DSHIELD="corne_left_peripheral" \
	    -DZMK_CONFIG="/zmk-config"
shield_corne_dongle_pro_micro= \
	    -- -DSHIELD="corne_dongle_pro_micro" -DZMK_CONFIG="/zmk-config"
shield_corne_dongle_pro_micro_dongle_display= \
	    -- -DSHIELD="corne_dongle_pro_micro dongle_display" -DZMK_CONFIG="/zmk-config"
###  uf2
uf2_copy_puchi_corne_settings_reset=/zmk/build/zephyr/zmk.uf2 \
				    firmware/puchi_corne_settings_reset.uf2
uf2_copy_puchi_corne_left=/zmk/build/zephyr/zmk.uf2 \
			  firmware/puchi_corne_left.uf2
uf2_copy_puchi_corne_right=/zmk/build/zephyr/zmk.uf2 \
			   firmware/puchi_corne_right.uf2
uf2_copy_puchi_corne_left_peripheral_view=/zmk/build/zephyr/zmk.uf2 \
				    firmware/puchi_corne_left_peripheral.uf2
uf2_copy_niceuf2_copy_puchi_corne_dongle_pro_micro=/zmk/build/zephyr/zmk.uf2 \
				    firmware/puchi_corne_dongle_pro_micro.uf2
uf2_copy_puchi_corne_dongle_pro_micro_dongle_display=/zmk/build/zephyr/zmk.uf2 \
				    firmware/puchi_corne_dongle_pro_micro_dongle_display.uf2
uf2_copy_nice_corne_settings_reset=/zmk/build/zephyr/zmk.uf2 \
				   firmware/nice_corne_settings_reset.uf2
uf2_copy_nice_corne_left=/zmk/build/zephyr/zmk.uf2 firmware/nice_corne_left.uf2
uf2_copy_nice_corne_right=/zmk/build/zephyr/zmk.uf2 firmware/nice_corne_right.uf2
uf2_copy_nice_corne_left_peripheral_view=/zmk/build/zephyr/zmk.uf2 \
				    firmware/nice_corne_left_peripheral.uf2
uf2_copy_nice_corne_left_peripheral_oled=/zmk/build/zephyr/zmk.uf2 \
				    firmware/nice_corne_left_peripheral.uf2
uf2_copy_nice_corne_dongle_pro_micro=/zmk/build/zephyr/zmk.uf2 \
				    firmware/nice_corne_dongle_pro_micro.uf2
uf2_copy_nice_corne_dongle_pro_micro_dongle_display=/zmk/build/zephyr/zmk.uf2 \
				    firmware/nice_corne_dongle_pro_micro_dongle_display.uf2
uf2_copy_xiao_corne_dongle_xiao=/zmk/build/zephyr/zmk.uf2 \
				    firmware/xiao_corne_dongle_xiao.uf2
uf2_copy_xiao_corne_settings_reset=/zmk/build/zephyr/zmk.uf2 \
				   firmware/xiao_corne_settings_reset.uf2
uf2_copy_xiao_corne_dongle_xiao_dongle_display=/zmk/build/zephyr/zmk.uf2 \
				    firmware/xiao_corne_dongle_xiao_dongle_display.uf2
uf2_copy_xiao_corne_dongle_xiao_rgbled_adapter=/zmk/build/zephyr/zmk.uf2 \
				    firmware/xiao_corne_dongle_xiao_rgbled_adapter.uf2
uf2_copy_xiao_corne_dongle_xiao_dongle_display_rgbled_adapter=/zmk/build/zephyr/zmk.uf2 \
				    firmware/xiao_corne_dongle_xiao_dongle_display_rgbled_adapter.uf2
### chmod
uf2_chmod_puchi_corne_settings_reset=chmod go+wrx \
				     firmware/puchi_corne_settings_reset.uf2
uf2_chmod_puchi_corne_left=chmod go+wrx firmware/puchi_corne_left.uf2
uf2_chmod_puchi_corne_right=chmod go+wrx firmware/puchi_corne_right.uf2
uf2_chmod_puchi_corne_left_peripheral_view=chmod go+wrx firmware/puchi_corne_left_peripheral.uf2
uf2_chmod_puchi_corne_dongle_pro_micro=chmod go+wrx firmware/puchi_corne_dongle_pro_micro.uf2
uf2_chmod_puchi_corne_dongle_pro_micro_dongle_display=chmod go+wrx firmware/puchi_corne_dongle_pro_micro_dongle_display.uf2
uf2_chmod_nice_corne_settings_reset=chmod go+wrx \
				    firmware/nice_corne_settings_reset.uf2
uf2_chmod_nice_corne_left=chmod go+wrx firmware/nice_corne_left.uf2
uf2_chmod_nice_corne_right=chmod go+wrx firmware/nice_corne_right.uf2
uf2_chmod_nice_corne_left_peripheral_view=chmod go+wrx firmware/nice_corne_left_peripheral.uf2
uf2_chmod_nice_corne_left_peripheral_oled=chmod go+wrx firmware/nice_corne_left_peripheral.uf2
uf2_chmod_nice_corne_dongle_pro_micro=chmod go+wrx firmware/nice_corne_dongle_pro_micro.uf2
uf2_chmod_nice_corne_dongle_pro_micro_dongle_display=chmod go+wrx firmware/nice_corne_dongle_pro_micro_dongle_display.uf2
uf2_chmod_xiao_corne_dongle_xiao=chmod go+wrx firmware/xiao_corne_dongle_xiao.uf2
uf2_chmod_xiao_corne_settings_reset=chmod go+wrx \
				    firmware/xiao_corne_settings_reset.uf2
uf2_chmod_xiao_corne_dongle_xiao_dongle_display=chmod go+wrx firmware/xiao_corne_dongle_xiao_dongle_display.uf2
uf2_chmod_xiao_corne_dongle_xiao_rgbled_adapter=chmod go+wrx firmware/xiao_corne_dongle_xiao_rgbled_adapter.uf2
uf2_chmod_xiao_corne_dongle_xiao_dongle_display_rgbled_adapter=chmod go+wrx firmware/xiao_corne_dongle_xiao_dongle_display_rgbled_adapter.uf2

clone_zmk_default:
	if [ ! -d zmk ]; then git clone https://github.com/zmkfirmware/zmk; fi

codebase_default: clone_zmk_default
	docker run ${docker_opts} sh -c '\
		west init -l /zmk/app/; \
		west update'
clone_zmk_urob:
	if [ ! -d zmk ]; then git clone https://github.com/urob/zmk; fi

codebase_urob: clone_zmk_urob
	docker run ${docker_opts} sh -c '\
		west init -l /zmk/app/; \
		west update'

### CODEBASE_UROB START
only_nice_corne_left_view_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice} ${shield_corne_left_view} \
		${keyboard_name_nice} ${extra_modules}
	docker cp ${urob}:${uf2_copy_nice_corne_left}
	${uf2_chmod_nice_corne_left}
only_nice_corne_right_view_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice} ${shield_corne_right_view} ${extra_modules}
	docker cp ${urob}:${uf2_copy_nice_corne_right}
	${uf2_chmod_nice_corne_right}
only_puchi_corne_left_view_urob:
	docker run --rm ${docker_opts} \
		${west_built_puchi} ${shield_corne_left_view} \
		${keyboard_name_puchi} ${extra_modules}
	docker cp ${urob}:${uf2_copy_puchi_corne_left}
	${uf2_chmod_puchi_corne_left}
only_puchi_corne_right_view_urob:
	docker run --rm ${docker_opts} \
		${west_built_puchi} ${shield_corne_right} ${extra_modules}
	docker cp ${urob}:${uf2_copy_puchi_corne_right}
	${uf2_chmod_puchi_corne_right}
only_nice_corne_left_peripheral_view_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice} ${shield_corne_left_peripheral_view} ${extra_modules}
	docker cp ${urob}:${uf2_copy_nice_corne_left_peripheral_view}
	${uf2_chmod_nice_corne_left_peripheral_view}
only_puchi_corne_left_peripheral_view_urob:
	docker run --rm ${docker_opts} \
		${west_built_puchi} ${shield_corne_left_peripheral_view} ${extra_modules}
	docker cp ${urob}:${uf2_copy_puchi_corne_left_peripheral_view}
	${uf2_chmod_puchi_corne_left_peripheral_view}
only_nice_corne_dongle_pro_micro_dongle_display_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice} ${shield_corne_dongle_pro_micro_dongle_display} ${extra_modules}
	docker cp ${urob}:${uf2_copy_nice_corne_dongle_pro_micro_dongle_display}
	${uf2_chmod_nice_corne_dongle_pro_micro_dongle_display}
only_puchi_corne_dongle_pro_micro_dongle_display_urob:
	docker run --rm ${docker_opts} \
		${west_built_puchi} ${shield_corne_dongle_pro_micro_dongle_display} ${extra_modules}
	docker cp ${urob}:${uf2_copy_puchi_corne_dongle_pro_micro_dongle_display}
	${uf2_chmod_puchi_corne_dongle_pro_micro_dongle_display}
only_corne_xiao_corne_dongle_xiao_dongle_display_urob:
	docker run --rm ${docker_opts} \
		${west_built_xiao} ${shield_xiao_corne_dongle_xiao_dongle_display} ${extra_modules}
	docker cp ${urob}:${uf2_copy_xiao_corne_dongle_xiao_dongle_display}
	${uf2_chmod_xiao_corne_dongle_xiao_dongle_display}
only_nice_settings_reset_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_nice_corne_settings_reset}
	${uf2_chmod_nice_corne_settings_reset}
only_puchi_settings_reset_urob:
	docker run --rm ${docker_opts} \
		${west_built_puchi} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_puchi_corne_settings_reset}
	${uf2_chmod_puchi_corne_settings_reset}
only_xiao_settings_reset_urob:
	docker run --rm ${docker_opts} \
		${west_built_xiao} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_xiao_corne_settings_reset}
	${uf2_chmod_xiao_corne_settings_reset}

### MC: TODO: excluded for the moment START
only_corne_left_peripheral_oled_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice} ${shield_corne_left_peripheral_oled} ${extra_modules}
	docker cp ${urob}:${uf2_copy_nice_corne_left_peripheral_oled}
	${uf2_chmod_nice_corne_left_peripheral_oled}
	docker run --rm ${docker_opts} \
		${west_built_puchi} ${shield_corne_left_peripheral_oled} ${extra_modules}
	docker cp ${urob}:${uf2_copy_puchi_corne_left_peripheral_oled}
	${uf2_chmod_puchi_corne_left_peripheral_oled}
only_corne_dongle_pro_micro_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice} ${shield_corne_dongle_pro_micro} ${extra_modules}
	docker cp ${urob}:${uf2_copy_nice_corne_dongle_pro_micro}
	${uf2_chmod_nice_corne_dongle_pro_micro}
	docker run --rm ${docker_opts} \
		${west_built_puchi} ${shield_corne_dongle_pro_micro} ${extra_modules}
	docker cp ${urob}:${uf2_copy_puchi_corne_dongle_pro_micro}
	${uf2_chmod_puchi_corne_dongle_pro_micro}
only_corne_xiao_corne_dongle_xiao_urob:
	docker run --rm ${docker_opts} \
		${west_built_xiao} ${shield_xiao_corne_dongle_xiao} ${extra_modules}
	docker cp ${urob}:${uf2_copy_xiao_corne_dongle_xiao}
	${uf2_chmod_xiao_corne_dongle_xiao}
### MC: TODO: excluded for the moment END

### MC: rgbled_adapter TODO: START
only_corne_xiao_corne_dongle_xiao_rgbled_adapter_urob:
	docker run --rm ${docker_opts} \
		${west_built_xiao} ${shield_xiao_corne_dongle_xiao_rgbled_adapter} ${extra_modules}
	docker cp ${urob}:${uf2_copy_xiao_corne_dongle_xiao_rgbled_adapter}
	${uf2_chmod_xiao_corne_dongle_xiao_rgbled_adapter}
only_corne_xiao_corne_dongle_xiao_dongle_display_rgbled_adapter_urob:
	docker run --rm ${docker_opts} \
		${west_built_xiao} ${shield_xiao_corne_dongle_xiao_dongle_display_rgbled_adapter} ${extra_modules}
	docker cp ${urob}:${uf2_copy_xiao_corne_dongle_xiao_dongle_display_rgbled_adapter}
	${uf2_chmod_xiao_corne_dongle_xiao_dongle_display_rgbled_adapter}
### MC: rgbled_adapter TODO: END

only_corne_left_view_urob: only_nice_corne_left_view_urob \
	only_puchi_corne_left_view_urob
only_corne_right_view_urob: only_nice_corne_right_view_urob \
	only_puchi_corne_right_view_urob
only_corne_left_peripheral_view_urob: only_nice_corne_left_peripheral_view_urob \
	only_puchi_corne_left_peripheral_view_urob
only_corne_dongle_pro_micro_dongle_display_urob: only_nice_corne_dongle_pro_micro_dongle_display_urob \
						only_puchi_corne_dongle_pro_micro_dongle_display_urob
settings_reset_urob: only_nice_settings_reset_urob \
	only_puchi_settings_reset_urob \
	only_xiao_settings_reset_urob
corne_urob: only_corne_left_view_urob \
	only_corne_right_view_urob \
	only_corne_left_peripheral_view_urob \
	only_corne_dongle_pro_micro_dongle_display_urob \
	only_corne_xiao_corne_dongle_xiao_dongle_display_urob \
	settings_reset_urob
### CODEBASE_UROB END

# Open a shell within the ZMK environment
shell:
	docker run --rm ${docker_opts} /bin/bash

# Flash the appropriate firmware to the bootloader
nice_corne_flash_left:
	@ printf "Waiting for ${nice} bootloader to appear at ${nice_mount}.."
	@ while [ ! -d ${nice_mount} ]; do sleep 1; printf "."; done; printf "\n"
	cp -av firmware/nice_corne_left.uf2 ${nice_mount}

nice_corne_flash_right:
	@ printf "Waiting for ${nice} bootloader to appear at ${nice_mount}.."
	@ while [ ! -d ${nice_mount} ]; do sleep 1; printf "."; done; printf "\n"
	cp -av firmware/nice_corne_right.uf2 ${nice_mount}

puchi_corne_flash_left:
	@ printf "Waiting for ${puchi} bootloader to appear at ${puchi_mount}.."
	@ while [ ! -d ${puchi_mount} ]; do sleep 1; printf "."; done; printf "\n"
	cp -av firmware/puchi_corne_left.uf2 ${puchi_mount}

puchi_corne_flash_right:
	@ printf "Waiting for ${puchi} bootloader to appear at ${puchi_mount}.."
	@ while [ ! -d ${puchi_mount} ]; do sleep 1; printf "."; done; printf "\n"
	cp -av firmware/puchi_corne_right.uf2 ${puchi_mount}

clean_firmware:
	find firmware/*.uf2 -type f -delete

clean_zmk:
	if [ -d zmk ]; then rm -rfv zmk; fi

clean: clean_zmk
	docker ps -aq --filter name='^zmk' | xargs -r docker container rm
	docker volume list -q --filter name='zmk' | xargs -r docker volume rm

clean_all: clean clean_firmware
	@echo "cleaning all"

# vim: set ft=make fdm=marker:
