# ========================================
# FileName: Makefile
# Date: 07.03.2023
# Author: Marcos Chow Castro
# Email: mctechnology170318@gmail.com
# GitHub: https://github.com/mctechnology17
# Brief: Makefile for ZMK firmware with Docker
# Board: nice_nano_v2 puchi_ble_v1 seeeduino_xiao_ble
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
# docker pull zmkfirmware/zmk-dev-arm:3.5
# extra_conf_file_oled_rgb= -DEXTRA_CONF_FILE=${PWD}/config/config_ready/nice/oled_rgb/corne.conf

### config
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
	--volume zmk:/zmk \
	--volume "${config}:/zmk-config:Z" \
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
west_built_puchi_ble_v1= \
	    west build /zmk/app \
	    --pristine --board "${puchi}"

west_built_nice_nano_v2= \
	    west build /zmk/app \
	    --pristine --board "${nice}"

west_built_seeeduino_xiao_ble= \
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
uf2_copy_puchi_corne_left_peripheral=/zmk/build/zephyr/zmk.uf2 \
				    firmware/puchi_corne_left_peripheral.uf2
uf2_copy_puchi_corne_dongle_pro_micro=/zmk/build/zephyr/zmk.uf2 \
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
# many times you cannot copy the uf2 file so try this solution
uf2_chmod_puchi_corne_settings_reset=chmod go+wrx \
				     firmware/puchi_corne_settings_reset.uf2
uf2_chmod_puchi_corne_left=chmod go+wrx firmware/puchi_corne_left.uf2
uf2_chmod_puchi_corne_right=chmod go+wrx firmware/puchi_corne_right.uf2
uf2_chmod_puchi_corne_left_peripheral=chmod go+wrx firmware/puchi_corne_left_peripheral.uf2
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

codebase_default:
	docker run ${docker_opts} sh -c '\
		git clone https://github.com/zmkfirmware/zmk /zmk/; \
		west init -l /zmk/app/; \
		west update'

codebase_urob:
	docker run ${docker_opts} sh -c '\
		git clone https://github.com/urob/zmk /zmk/; \
		west init -l /zmk/app/; \
		west update'

### CODEBASE_DEFAULT START
### CODEBASE_DEFAULT END

### CODEBASE_UROB START
xiao_corne_dongle_rgbled_adapter_urob:
	docker run --rm ${docker_opts} \
		${west_built_seeeduino_xiao_ble} ${shield_xiao_corne_dongle_xiao_rgbled_adapter} \
		${keyboard_name_xiao_dongle}
	docker cp ${urob}:${uf2_copy_xiao_corne_dongle_xiao_rgbled_adapter}
	${uf2_chmod_xiao_corne_dongle_xiao_rgbled_adapter}

xiao_corne_dongle_urob:
	docker run --rm ${docker_opts} \
		${west_built_seeeduino_xiao_ble} ${shield_xiao_corne_dongle_xiao_dongle_display} \
		${keyboard_name_xiao_dongle_oled}
	docker cp ${urob}:${uf2_copy_xiao_corne_dongle_xiao_dongle_display}
	${uf2_chmod_xiao_corne_dongle_xiao_dongle_display}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left_view} \
		${keyboard_name_nice}
	docker cp ${urob}:${uf2_copy_nice_corne_left}
	${uf2_chmod_nice_corne_left}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_right_view}
	docker cp ${urob}:${uf2_copy_nice_corne_right}
	${uf2_chmod_nice_corne_right}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left_peripheral_view}
	docker cp ${urob}:${uf2_copy_nice_corne_left_peripheral_view}
	${uf2_chmod_nice_corne_left_peripheral_view}

only_xiao_dongle_urob:
	docker run --rm ${docker_opts} \
		${west_built_seeeduino_xiao_ble} ${shield_xiao_corne_dongle_xiao_dongle_display} \
		${keyboard_name_xiao_dongle_oled}
	docker cp ${urob}:${uf2_copy_xiao_corne_dongle_xiao_dongle_display}
	${uf2_chmod_xiao_corne_dongle_xiao_dongle_display}
only_nice_dongle_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_dongle_pro_micro_dongle_display} \
		${keyboard_name_nice_dongle_oled}
	docker cp ${urob}:${uf2_copy_nice_corne_dongle_pro_micro_dongle_display}
	${uf2_chmod_nice_corne_dongle_pro_micro_dongle_display}
only_puchi_dongle_urob:
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_dongle_pro_micro_dongle_display} \
		${keyboard_name_puchi_dongle_oled}
	docker cp ${urob}:${uf2_copy_puchi_corne_dongle_pro_micro_dongle_display}
	${uf2_chmod_puchi_corne_dongle_pro_micro_dongle_display}

only_dongle_urob: only_xiao_dongle_urob only_nice_dongle_urob only_puchi_dongle_urob
	@echo "only dongle urob and not other shields"

corne_dongle_pro_micro_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_dongle_pro_micro} \
		${keyboard_name_nice_dongle}
	docker cp ${urob}:${uf2_copy_nice_corne_dongle_pro_micro}
	${uf2_chmod_nice_corne_dongle_pro_micro}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_dongle_pro_micro_dongle_display} \
		${keyboard_name_nice_dongle_oled}
	docker cp ${urob}:${uf2_copy_nice_corne_dongle_pro_micro_dongle_display}
	${uf2_chmod_nice_corne_dongle_pro_micro_dongle_display}

corne_dongle_pro_micro_display_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_dongle_pro_micro} \
		${keyboard_name_nice_dongle}
	docker cp ${urob}:${uf2_copy_nice_corne_dongle_pro_micro}
	${uf2_chmod_nice_corne_dongle_pro_micro}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_dongle_pro_micro_dongle_display} \
		${keyboard_name_nice_dongle_oled}
	docker cp ${urob}:${uf2_copy_nice_corne_dongle_pro_micro_dongle_display}
	${uf2_chmod_nice_corne_dongle_pro_micro_dongle_display}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left} \
		${keyboard_name_nice_oled}
	docker cp ${urob}:${uf2_copy_nice_corne_left}
	${uf2_chmod_nice_corne_left}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_right}
	docker cp ${urob}:${uf2_copy_nice_corne_right}
	${uf2_chmod_nice_corne_right}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left_peripheral_oled}
	docker cp ${urob}:${uf2_copy_nice_corne_left_peripheral_oled}
	${uf2_chmod_nice_corne_left_peripheral_oled}

# full compilation
corne_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left_view} \
		${keyboard_name_nice}
	docker cp ${urob}:${uf2_copy_nice_corne_left}
	${uf2_chmod_nice_corne_left}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_right_view}
	docker cp ${urob}:${uf2_copy_nice_corne_right}
	${uf2_chmod_nice_corne_right}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_left_view} \
		${keyboard_name_puchi_view}
	docker cp ${urob}:${uf2_copy_puchi_corne_left}
	${uf2_chmod_puchi_corne_left}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_right_view}
	docker cp ${urob}:${uf2_copy_puchi_corne_right}
	${uf2_chmod_puchi_corne_right}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left_peripheral_view}
	docker cp ${urob}:${uf2_copy_nice_corne_left_peripheral_view}
	${uf2_chmod_nice_corne_left_peripheral_view}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_left_peripheral_view}
	docker cp ${urob}:${uf2_copy_puchi_corne_left_peripheral}
	${uf2_chmod_puchi_corne_left_peripheral}
	docker run --rm ${docker_opts} \
		${west_built_seeeduino_xiao_ble} ${shield_xiao_corne_dongle_xiao} \
		${keyboard_name_xiao_dongle}
	docker cp ${urob}:${uf2_copy_xiao_corne_dongle_xiao}
	${uf2_chmod_xiao_corne_dongle_xiao}
	docker run --rm ${docker_opts} \
		${west_built_seeeduino_xiao_ble} ${shield_xiao_corne_dongle_xiao_dongle_display} \
		${keyboard_name_xiao_dongle_oled}
	docker cp ${urob}:${uf2_copy_xiao_corne_dongle_xiao_dongle_display}
	${uf2_chmod_xiao_corne_dongle_xiao_dongle_display}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_dongle_pro_micro} \
		${keyboard_name_nice_dongle}
	docker cp ${urob}:${uf2_copy_nice_corne_dongle_pro_micro}
	${uf2_chmod_nice_corne_dongle_pro_micro}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_dongle_pro_micro_dongle_display} \
		${keyboard_name_nice_dongle_oled}
	docker cp ${urob}:${uf2_copy_nice_corne_dongle_pro_micro_dongle_display}
	${uf2_chmod_nice_corne_dongle_pro_micro_dongle_display}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_dongle_pro_micro} \
		${keyboard_name_puchi_dongle}
	docker cp ${urob}:${uf2_copy_puchi_corne_dongle_pro_micro}
	${uf2_chmod_puchi_corne_dongle_pro_micro}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_dongle_pro_micro_dongle_display} \
		${keyboard_name_puchi_dongle_oled}
	docker cp ${urob}:${uf2_copy_puchi_corne_dongle_pro_micro_dongle_display}
	${uf2_chmod_puchi_corne_dongle_pro_micro_dongle_display}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_nice_corne_settings_reset}
	${uf2_chmod_nice_corne_settings_reset}
	docker run --rm ${docker_opts} \
		${west_built_seeeduino_xiao_ble} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_xiao_corne_settings_reset}
	${uf2_chmod_xiao_corne_settings_reset}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_puchi_corne_settings_reset}
	${uf2_chmod_puchi_corne_settings_reset}

corne_view_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left_view} \
		${keyboard_name_nice}
	docker cp ${urob}:${uf2_copy_nice_corne_left}
	${uf2_chmod_nice_corne_left}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_right_view}
	docker cp ${urob}:${uf2_copy_nice_corne_right}
	${uf2_chmod_nice_corne_right}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_left_view} \
		${keyboard_name_puchi_view}
	docker cp ${urob}:${uf2_copy_puchi_corne_left}
	${uf2_chmod_puchi_corne_left}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_right_view}
	docker cp ${urob}:${uf2_copy_puchi_corne_right}
	${uf2_chmod_puchi_corne_right}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left_peripheral_view}
	docker cp ${urob}:${uf2_copy_nice_corne_left_peripheral_view}
	${uf2_chmod_nice_corne_left_peripheral_view}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_left_peripheral_view}
	docker cp ${urob}:${uf2_copy_puchi_corne_left_peripheral}
	${uf2_chmod_puchi_corne_left_peripheral}
	docker run --rm ${docker_opts} \
		${west_built_seeeduino_xiao_ble} ${shield_xiao_corne_dongle_xiao} \
		${keyboard_name_xiao_dongle}
	docker cp ${urob}:${uf2_copy_xiao_corne_dongle_xiao}
	${uf2_chmod_xiao_corne_dongle_xiao}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_nice_corne_settings_reset}
	${uf2_chmod_nice_corne_settings_reset}
	docker run --rm ${docker_opts} \
		${west_built_seeeduino_xiao_ble} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_xiao_corne_settings_reset}
	${uf2_chmod_xiao_corne_settings_reset}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_puchi_corne_settings_reset}
	${uf2_chmod_puchi_corne_settings_reset}

nice_corne_view_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left_view} \
		${keyboard_name_nice}
	docker cp ${urob}:${uf2_copy_nice_corne_left}
	${uf2_chmod_nice_corne_left}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_right_view}
	docker cp ${urob}:${uf2_copy_nice_corne_right}
	${uf2_chmod_nice_corne_right}

corne_left_peripheral_view_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left_peripheral_view}
	docker cp ${urob}:${uf2_copy_nice_corne_left_peripheral_view}
	${uf2_chmod_nice_corne_left_peripheral_view}

nice_corne_view_left_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left_view} \
		${keyboard_name_nice}
	docker cp ${urob}:${uf2_copy_nice_corne_left}
	${uf2_chmod_nice_corne_left}

nice_corne_view_right_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_right_view}
	docker cp ${urob}:${uf2_copy_nice_corne_right}
	${uf2_chmod_nice_corne_right}

nice_corne_oled_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_left} \
		${keyboard_name_nice_oled}
	docker cp ${urob}:${uf2_copy_nice_corne_left}
	${uf2_chmod_nice_corne_left}
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_corne_right}
	docker cp ${urob}:${uf2_copy_nice_corne_right}
	${uf2_chmod_nice_corne_right}

puchi_corne_view_urob:
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_left_view} \
		${keyboard_name_puchi_view}
	docker cp ${urob}:${uf2_copy_puchi_corne_left}
	${uf2_chmod_puchi_corne_left}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_right_view}
	docker cp ${urob}:${uf2_copy_puchi_corne_right}
	${uf2_chmod_puchi_corne_right}

puchi_corne_view_left_urob:
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_left_view} \
		${keyboard_name_puchi_view}
	docker cp ${urob}:${uf2_copy_puchi_corne_left}
	${uf2_chmod_puchi_corne_left}

puchi_corne_view_right_urob:
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_right_view}
	docker cp ${urob}:${uf2_copy_puchi_corne_right}
	${uf2_chmod_puchi_corne_right}

puchi_corne_oled_urob:
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_left} \
		${keyboard_name_puchi_view}
	docker cp ${urob}:${uf2_copy_puchi_corne_left}
	${uf2_chmod_puchi_corne_left}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_corne_right}
	docker cp ${urob}:${uf2_copy_puchi_corne_right}
	${uf2_chmod_puchi_corne_right}

reset_urob:
	docker run --rm ${docker_opts} \
		${west_built_nice_nano_v2} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_nice_corne_settings_reset}
	${uf2_chmod_nice_corne_settings_reset}
	docker run --rm ${docker_opts} \
		${west_built_seeeduino_xiao_ble} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_xiao_corne_settings_reset}
	${uf2_chmod_xiao_corne_settings_reset}
	docker run --rm ${docker_opts} \
		${west_built_puchi_ble_v1} ${shield_settings_reset}
	docker cp ${urob}:${uf2_copy_puchi_corne_settings_reset}
	${uf2_chmod_puchi_corne_settings_reset}
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

clean:
	docker ps -aq --filter name='^zmk' | xargs -r docker container rm
	docker volume list -q --filter name='zmk' | xargs -r docker volume rm

clean_docker:
	docker ps -aq --filter name='^zmk' | xargs -r docker container rm
	docker volume list -q --filter name='zmk' | xargs -r docker volume rm

clean_firmware:
	find firmware/*.uf2 -type f -delete
