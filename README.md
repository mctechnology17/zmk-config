[![MC Technology](https://github.com/mctechnology17/mctechnology17/blob/main/src/mctechnology_extendido.GIF)](https://www.youtube.com/channel/UC_mYh5PYPHBJ5YYUj8AIkcw)

<div align="center">

  [<img align="center" alt="MC Technology | YouTube" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/youtube.png" />][youtube]
  [<img align="center" alt="@mctechnology17 | Twitter" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/twitter.png" />][twitter]
  [<img align="center" alt="@mctechnology17 | Instagram" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/instagram.png" />][instagram]
  [<img align="center" alt="MC Technology17 | Facebook" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/facebook.png" />][facebook]
  [<img align="center" alt="@mctechnology17 | Reddit" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/reddit.png" />][reddit]

</div>
<br>


- [INTRO](#INTRO)
- [INSTALACION](#INSTALACION)
- [MODO SUSPENCION](#MODO-SUSPENCION)
- [PANTALLA OLED](#PANTALLA-OLED)
- [RGB](#RGB)
- [OTROS CONSEJOS IMPORTANTES](#OTROS-CONSEJOS-IMPORTANTES)
- [DONACION](#DONACION)
- [LICENSE](#LICENSE)

----

# INTRO
Este repositorio contiene mi configuracion personal de mi teclado corne con el sofware de [ZMK](https://zmk.dev/docs),
flashado en el microcontrolador [nice!nano_v2](https://nicekeyboards.com/nice-nano).

[![nicenano_v2](https://github.com/mctechnology17/mctechnology17/blob/main/src/nicenanov2.GIF)](https://nicekeyboards.com/nice-nano/)

NO ME HAGO RESPONSABLE DE NINGUN DAÑO QUE PUEDA OCASIONAR ESTE CODIGO, UTILIZALO
BAJO TU PROPIO RIESGO.

SIENTETE LIBRE DE MODIFICAR EL CODIGO A TU GUSTO O DE OCUPAR LO QUE NECESITES
NO OLVIDES REFERENCIAR A LOS AUTORES DE LOS CODIGOS QUE OCUPES.

Caracteristicas:
 - Teclado inalambrico atraves de conexion bluetooth y usb-c
 - Teclado ergonomico y ortolineal
 - Altamente programable con el sofware de ZMK
 - Compatibilidad con Linux, Windows, MacOS, Android, IOS y mas
 - COMPLETAMENTE INALAMBRICO ENTRE LAS DOS MITADES Y CON EL PC
 - Ultra bajo consumo. Extiende la duración de la batería al límite
 - Arrastrar y soltar gracias a el cargador de arranque UF2 incluido
 - NO SE REQUIERE SOFTWARE ADICIONAL (como VIAL, QMK ToolBox etc.)
 - Y mas...

FUNCIONANDO SIN ERRORES HASTA EL MOMENTO!

# INSTALACION
[Referencia ZMK](https://zmk.dev/docs/user-setup) de donde saque la informacion.

PRE-Requisitos:
 - Tener instalado [git](https://github.com/git-guides/install-git) en tu computadora y una cuenta en [github](https://github.com/)
   - Crear un nuevo repositorio en github. [Para crear un nuevo repositorio dale click aqui](https://github.com/new)
   - Cuando se te solicite el nombre del repositorio, ingresa zmk-config (puede ser otro nombre tambien).
   - El repositorio puede ser público o privado
   - No marcar ninguna de las opciones para inicializar el repositorio con un README u otros archivos.
   - Haz clic en "Crear repositorio"
 - Opcional tener instalado en tu computadora VSC (Visual Studio Code)
   u otro editor de texto de tu preferencia, yo uso `nvim/vim`
 - Opcional puedes de preferencia usar `git` con SSH
   eso te evitara tener que poner tu usuario y contraseña cada vez que tengas que hacer un `git push`
   en otras palabras despues de cada modificacion que le hagas al codigo

```bash
# 0. crea una repositorio con el nombre de zmk-config en tu cuenta de github
# 1. luego abre la terminal y pega esto:
bash -c "$(curl -fsSL https://zmk.dev/setup.sh)"
# 2. se abre una opcion con muchos teclados, seleciona el 13 (corne)
13 # enter
# 3. se abre una opcion a elegir el MCU (Microcontrolador), seleciona el 4 (nice!nano v2)
4 # enter
# 4. ¿Copiar en el mapa de teclas estándar para personalizarlo? [Yn]:
Y # enter
# 5. Datos de tu GitHub
mctechnology17 # AQUI TU USUARIO DE GITHUB
CONTRASEÑA # AQUI TU CONTRASEÑA DE GITHUB
# 6. Nombre del repositorio
ENTER # simplemente enter, dejamos la por defecto zmk-config
# 7. insertar el repositorio
git@github.com:mctechnology17/zmk-config.git # mctechnology17 -> AQUI TU USUARIO DE GITHUB
# 8. Continuar?
Y # enter
```
Despues de concluir los pasos anteriores con exito, puedes ir a la ruta dinde se encuentra el repositorio
con el siguiente comando y modificar el codigo a tu gusto:
```bash
cd ~/zmk-config/config

# vista de como esta estructurado el repositorio
zmk-config # carpeta principal
├── build.yaml # archivo de configuracion para el compilado NO MODIFICAR
├── config # carpeta de configuracion
│   ├── corne.conf # archicho de configuracios de las macros
│   ├── corne.keymap # archicho de configuracios de las teclas
│   └── west.yml # config para conectarse con https://github.com/zmkfirmware NO MODIFICAR
└── README.md
```

Si no modificaste nada puedes simplemente ir a tu repositorio en github y dale a refrescar a la pagina.

Ahora ve a esta ruta en tu repositorio de github:
 - Actions(click) -> All Workflows (click)-> Initial User Config. (aqui haces scroll hasta abajo y click)
 - Aqui hay algo que se llama Artifacts, dale click para descargar el archivo, es un .zip

Ahora ve a descarga en tu computadora(o donde tengas por defecto las descargas):
 - Descomprime el archivo .zip
 - Conecta el microcontrolador nice!nano v2 al puerto usb-c de tu computadora
 - El microcontrolador se reconocera como un dispositivo de almacenamiento
 - Copia el archivo corne_left-nice_nano_v2-zmk.uf2 que descomprimiste en la carpeta del dispositivo de almacenamiento
 - Conecta el otro microcontrolador nice!nano v2 al puerto usb-c de tu computadora
 - Ahora copia el otro archivo corne_right-nice_nano_v2-zmk.uf2 que descomprimiste en la carpeta del dispositivo de almacenamiento
 - Listo, ya tienes tu teclado corne configurado con la configuracion estandar de ZMK
 - Ahora puedes modificar el codigo a tu gusto y volver a compilarlo

Si quieres usar mi configuracion solo debes clonar este repositorio y reemplazar los archivos `corne.conf` y `corne.keymap`
que se encuentran en la siguiente ruta:
```bash
zmk-config # carpeta principal
├── config # carpeta de configuracion
│   ├── corne.conf # archicho de configuracios de las macros
│   ├── corne.keymap # archicho de configuracios de las teclas
```

# MODO SUSPENCION
En el archicho de configuracios de las macros [corne.conf](./config/corne.conf) puedes poner la siguiente macro:
```make
CONFIG_ZMK_SLEEP=y
```
Esta macro te permite poner el teclado en modo de suspencion, para despertarlo solo debes presionar cualquier tecla.
Es muy util para preservar la vida de la bateria.
```bash
zmk-config # carpeta principal
├── config # carpeta de configuracion
│   ├── corne.conf # archicho de configuracios de las macros
```
ESTA MACRO NO VIENE POR DEFECTO EN LA CONFIGURACION ESTANDAR DE ZMK, POR LO QUE DEBES AGREGARLA TU MISMO.

# PANTALLA OLED
La pantalla OLED aun no esta soportada por ZMK o mejor dicho esta en desarrollo, por lo que no se puede usar.

# RGB
En el archicho de configuracios de las macros [corne.conf](./config/corne.conf) puedes poner la siguiente macro:
```make
CONFIG_ZMK_RGB_UNDERGLOW=y
# Usar la configuración de STRIP específica para los LED que estás usando
CONFIG_WS2812_STRIP=y
```
```bash
zmk-config # carpeta principal
├── config # carpeta de configuracion
│   ├── corne.conf # archicho de configuracios de las macros
```
Ahora debes ir a la siguiente ruta y modificar el archivo [corne.keymap](conf/corne.keymap):
```bash
zmk-config # carpeta principal
├── config # carpeta de configuracion
│   ├── corne.keymap # archicho de configuracios de las teclas + RBG
```
Agrega las siguientes lineas antes de keymap:
```c
#ifdef CONFIG_ZMK_RGB_UNDERGLOW
#    include <dt-bindings/zmk/rgb.h>
#    include <dt-bindings/led/led.h>
&spi1 {
	compatible = "nordic,nrf-spim";
	status = "okay";
	mosi-pin = <6>;
	// Unused pins, needed for SPI definition, but not used by the ws2812 driver itself.
	sck-pin = <5>;
	miso-pin = <7>;

	led_strip: ws2812@0 {
		compatible = "worldsemi,ws2812-spi";
		label = "WS2812";

		/* SPI */
		reg = <0>; /* ignored, but necessary for SPI bindings */
		spi-max-frequency = <4000000>;

		/* WS2812 */
		chain-length = <11>; /* arbitrary; change at will */
		spi-one-frame = <0x70>;
		spi-zero-frame = <0x40>;
		color-mapping = <LED_COLOR_ID_GREEN LED_COLOR_ID_RED LED_COLOR_ID_BLUE>;
	};
};

/ {
	chosen {
		zmk,underglow = &led_strip;
	};
};
#endif // CONFIG_ZMK_RGB_UNDERGLOW
```
Ahora aqui tienes un ejemplo de como debes mapear las teclas para controlar el RGB:
```c
#ifdef CONFIG_ZMK_RGB_UNDERGLOW
      mouse_layer {
         //   .------------------------------------------------.                         .-------------------------------------------------.
         //   |        |       |       |OUT_USB|OUT_BLE|OUT_TOG|                         |RGBBRI-|RGBBRI+|WH_LEFT|WH_RIGH|WH_DOWN| WH_UP   |
         //   |--------+-------+-------+-------+-------+-------|                         |-------+-------+-------+-------+-------+---------|
         //   |        |CLICK_1|CLICK_2|BT_CLR |BT_PRV | BT_NXT|                         |RGBSAT-|RGBSAT+|       |CLICK_1| UP    |CLICK_2  |
         //   |--------+-------+-------+-------+-------+-------|                         |-------+-------+-------+-------+-------+---------|
         //   |BT_CLR  |BT_0   |BT_1   |BT_2   |BT_3   |BT_4   |                         |RGBHUE-|RGBHUE+| RESET | LEFT  | DOWN  | RIGHT   |
         //   '---------------------------------------------------------|       |----------------------------------------------------------'
         //                            |EP_ON  | EP_OFF|         EP_TOG |       |RGBANI- |RGBANI+|   RGBTOG      |
         //                            '--------------------------------'       '--------------------------------'
         bindings = <
            &none &none &none &out OUT_USB &out OUT_BLE  &out OUT_TOG  &rgb_ug RGB_BRD    &rgb_ug RGB_BRI   &none  &none  &none  &none
            &none &none &none &bt BT_CLR &bt BT_PRV &bt BT_NXT &rgb_ug RGB_SAD  &rgb_ug RGB_SAI   &none  &none  &none  &none
            &bt BT_CLR   &bt BT_SEL 0 &bt BT_SEL 1 &bt BT_SEL 2 &bt BT_SEL 3 &bt BT_SEL 4 &rgb_ug RGB_HUD  &rgb_ug RGB_HUI   &reset  &none  &none  &none
                                    &ext_power EP_ON    &ext_power EP_OFF   &ext_power EP_TOG                      &rgb_ug RGB_EFR  &rgb_ug RGB_EFF  &rgb_ug RGB_TOG
                                 >;
                         };
#else
      mouse_layer {
         //   .------------------------------------------------.                         .-------------------------------------------------.
         //   |        |       |       |OUT_USB|OUT_BLE|OUT_TOG|                         |       |       |WH_LEFT|WH_RIGH|WH_DOWN| WH_UP   |
         //   |--------+-------+-------+-------+-------+-------|                         |-------+-------+-------+-------+-------+---------|
         //   |        |CLICK_1|CLICK_2|BT_CLR |BT_PRV | BT_NXT|                         |       |       |       |CLICK_1| UP    |CLICK_2  |
         //   |--------+-------+-------+-------+-------+-------|                         |-------+-------+-------+-------+-------+---------|
         //   |BT_CLR  |BT_0   |BT_1   |BT_2   |BT_3   |BT_4   |                         |       |       | RESET | LEFT  | DOWN  | RIGHT   |
         //   '---------------------------------------------------------|       |----------------------------------------------------------'
         //                            |EP_ON  | EP_OFF|         EP_TOG |       |       |        |               |
         //                            '--------------------------------'       '--------------------------------'
         bindings = <
            &none &none &none &out OUT_USB &out OUT_BLE  &out OUT_TOG &none    &none   &none  &none  &none  &none
            &none &none &none &bt BT_CLR &bt BT_PRV &bt BT_NXT &none  &none   &none  &none  &none  &none
            &bt BT_CLR   &bt BT_SEL 0 &bt BT_SEL 1 &bt BT_SEL 2 &bt BT_SEL 3 &bt BT_SEL 4 &none  &none  &reset  &none  &none  &none
                                    &ext_power EP_ON    &ext_power EP_OFF   &ext_power EP_TOG                      &none  &none  &none
                                 >;
                         };
#endif // CONFIG_ZMK_RGB_UNDERGLOW
```
RECUERDA QUE EL RGB GASTA DEMASIADA ENERGIA, LO MEJOR ES NO ACTIVARLO!

# OTROS CONSEJOS IMPORTANTES
- Si se te desconectaron/desincronizaron ambas mitades solo tienes que presionar el boton de reset de ambas mitades 10 veces seguidas y se volveran a conectar.
- Si quires volver a flashar el firware solo tienes que conectar el teclado(osea una mitad primero, normalmente la izquierda) presionar el boton de reset 2 veces seguidas
  y tu dispositivo se reconocera como una unidad de almecenamiento de disco duro, luego solo arrastra el archivo a flashear y listo. Haz lo mismo con la otra mitad.

# DONACION
Si disfrutas de mi trabajo, siéntete libre de donar o convertirte en patrocinador.
- [paypal]
- [sponsor]

Emsamblador y creador/mantenedor de vimtools, GitManager y más,
que son herramientas de trabajo fáciles de integrar, pero muy potentes que te permiten
mejore su flujo de trabajo, integrándose con todos los sistemas operativos y todas las
shells(zsh, fish, bash, etc.) posibles.

Aquí puedes ver otros proyecto publicado recientemente:
- [vimtools] navaja suiza para vim (funciones y configuraciones que te facilitarán la vida)
- [gm] administrador multiplataforma GIT con una interfaz de usuario amigable
- [vim-better-header] la mejor plantilla automatizada
- [vim-executor] Ejecutador de código multilenguaje


# [LICENSE](LICENSE)

Released under the MIT License

Copyright (c) 2020 The ZMK Contributors

[twitter]: https://twitter.com/mctechnology17
[youtube]: https://www.youtube.com/c/mctechnology17
[instagram]: https://www.instagram.com/mctechnology17/
[facebook]: https://m.facebook.com/mctechnology17/
[reddit]:https://www.reddit.com/user/mctechnology17

[vim-executor]: https://github.com/mctechnology17/vim-executor
[vim-better-header]: https://github.com/mctechnology17/vim-better-header
[gm]: https://github.com/mctechnology17/gm
[vimtools]: https://github.com/mctechnology17/vimtools
[jailbreakrepo]: https://mctechnology17.github.io/
[uiglitch]: https://repo.packix.com/package/com.mctechnology.uiglitch/
[uiswitches]: https://repo.packix.com/package/com.mctechnology.uiswitches/
[uibadge]: https://repo.packix.com/package/com.mctechnology.uibadge/
[youtuberepo]: https://github.com/mctechnology17/youtube_repo_mc_technology
[sponsor]: https://github.com/sponsors/mctechnology17
[paypal]: https://www.paypal.me/mctechnology17
[readline]: https://github.com/PowerShell/PSReadLine/blob/master/README.md
