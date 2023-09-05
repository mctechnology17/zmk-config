# MC Technology's zmk-config for corne

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
- [QUE CONTIENE ESTA CONFIGURACION?](#QUE-CONTIENE-ESTA-CONFIGURACION?)
- [DIFERENCIA ENTRE PUCHI-BLE Y NICE!NANO](#DIFERENCIA-ENTRE-PUCHI-BLE-Y-NICE!NANO)
- [INSTALACION](#INSTALACION)
- [MODO SUSPENCION](#MODO-SUSPENCION)
- [PANTALLA OLED](#PANTALLA-OLED)
- [RGB](#RGB)
- [OTROS CONSEJOS IMPORTANTES](#OTROS-CONSEJOS-IMPORTANTES)
- [DONACION](#DONACION)
- [LICENSE](#LICENSE)

----

# INTRO
Esta es mi configucion personal de mis teclados corne inalambricos con [ZMK firmware](https://github.com/zmkfirmware/zmk/).
Testeado con [nice!nano_v2](https://nicekeyboards.com/nice-nano) y [Puchi-BLE](https://keycapsss.com/keyboard-parts/mcu-controller/202/puchi-ble-wireless-microcontroller-pro-micro-replacement?number=KC10157_SWITCH&c=18).

[![nicenano_v2](https://github.com/mctechnology17/mctechnology17/blob/main/src/nicenanov2.GIF)](https://nicekeyboards.com/nice-nano/)

> **Warning**
>
> NO SOY RESPONSABLE DE NINGÚN DAÑO QUE ESTE CÓDIGO PUEDA CAUSAR, ÚSALO BAJO TU PROPIO RIESGO..


> **Note**
>
> NO DUDES EN MODIFICAR EL CÓDIGO A TU GUSTO O UTILIZAR LO QUE NECESITES.

| Pros                                                            |
|-----------------------------------------------------------------|
| movilidad y flexibilidad                                        |
| reducción de tensión y fatiga (ergonómica y ortolineal)          |
| productividad mejorada                                           |
| conexión bluetooth y usb-c                                  |
| Programable altamente personalizable con el software zmk.          |
| compatibilidad con linux, windows, macos, android, ios y más |
| completamente inalámbrico entre las dos mitades y con la pc      |
| Consumo ultrabajo. extiende la duración de la batería al límite        |
| arrastrar y soltar gracias al gestor de arranque uf2 incluido             |
| no se requiere software adicional para flashear                       |
| soporte para múltiples dispositivos (hasta 5)                              |
| teclas del mouse                                                      |
| RGB                                                             |
| Macros                                                          |
| Tap dance                                                       |
| Combos                                                          |
| hasta 1 semana de uso sin cargador (con 100mah)               |
| soporte de pantalla [nice-view] y pantalla oled                   |
| Editor en línea para el mapa de teclas. ver [keymap-editor]               |
| 100% open source                                                |
| y más...                                                     |

# QUE CONTIENE ESTA CONFIGURACION?
- [x] [ZMK firmware](https://zmk.dev/docs/user-setup)
- [x] Compatibilidad con [nice!nano_v2](https://nicekeyboards.com/nice-nano/)
- [x] Compatibilidad con [Puchi-BLE](https://keycapsss.com/keyboard-parts/mcu-controller/202/puchi-ble-wireless-microcontroller-pro-micro-replacement?number=KC10157_SWITCH&c=18)
- [x] Macros o tab dance
- [x] Combos
- [x] RGB underglow and backlight + efectos de animación
- [x] Pantalla OLED
- [x] Pantalla [nice-view]
- [x] Animaciones con [nice-view] como Bongo cat, cohete, etc.
- [x] Modo suspensión
- [x] Soporte para múltiples dispositivos (hasta 5)
- [x] Teclas del mouse
- [x] Teclas smart especiales
- [x] Capa Lock virtual
- [x] reset virtual por cada mitad
- [x] bootloader virtual por cada mitad
- [x] nombre por cada capa
- [x] Capa de simbolos en linux, windows y macos
- [] Editor en línea para el mapa de teclas. ver [keymap-editor]


[![demo](src/demo.GIF)](https://www.youtube.com/c/mctechnology17)

# DIFERENCIA ENTRE PUCHI BLE Y NICE!NANO
- Módulo bluetooth certificado (ce, fcc y rohs)
- Antena cerámica optimizada para alta intensidad de señal y bajos niveles de interferencia.
- Interruptor de encendido/apagado para prolongar la vida útil de la batería (solo variante con interruptor)
- Open Source

# INSTALACION
¿De dónde sacas la información? -> [referencia a documentos zmk](https://zmk.dev/docs/user-setup)

Pre requirements:
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

```bash
# activar por 30 minutos (30*60*1000ms)
CONFIG_ZMK_IDLE_SLEEP_TIMEOUT=1800000
```

# PANTALLA OLED
El OLED ya esta soportado asi que puedes usarlo sin problemas en esta
configuracion. Puedes ver un ejemplo que funciona en el siguiente archivo:
[corne.conf](./config/config_ready/nice/oled_rgb/corne.conf):

# RGB
El RGB con oled ya esta soportado asi que puedes usarlo sin problemas en esta
configuracion. Simplemete debes agregar habilitarlo en, esta habilitado por
defecto para 42 teclas y 12 LEDs por debajo. Puedes ver un ejemplo que funciona
en el siguiente archivo:
[corne.conf](./config/config_ready/nice/oled_rgb/corne.conf):

# OTROS CONSEJOS IMPORTANTES
- Puedes agregar una tecla de reset en cada mitad, eso es util para cuando se te desconecten/desincronicen las mitades, o pase algo inusual. De esa manera se carga el firmware de nuevo. Ver referencia en [corne.keymap](./config/corne.keymap)
- Puedes agregar un activador de bootloader en cada mitad en caso de que no tengas acceso al boton de bootloader, es  util en caso de que tu carcasa no este optimizada o de que simplemente quiera esa opcion. Ver referencia en [corne.keymap](./config/corne.keymap)
- Si se te desconectaron/desincronizaron ambas mitades solo tienes que presionar el boton de reset de ambas mitades 10 veces seguidas y se volveran a conectar.
- Si quires volver a flashar el firware solo tienes que conectar el teclado(osea una mitad primero, normalmente la izquierda) presionar el boton de reset 2 veces seguidas
  y tu dispositivo se reconocera como una unidad de almecenamiento de disco duro, luego solo arrastra el archivo a flashear y listo. Haz lo mismo con la otra mitad.
- Recuerda que si tu corne solo tiene algunas luces RGB funcionales puedes activar solo las que tengas funcionales, no es necesario que actives todas las luces. Ver referencia en [led_strip](./config/corne.keymap)

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

# 🏆 Trofeos de perfil de GitHub

[![trophy](https://github-profile-trophy.vercel.app/?username=mctechnology17&no-frame=true&theme=onedark&rank=SECRET,SSS,SS,S,AAA,AA,A)](https://github.com/ryo-ma/github-profile-trophy)

# [LICENSE](LICENSE)

Released under the MIT License

Copyright (c) 2020 The ZMK Contributors

[twitter]: https://twitter.com/mctechnology17
[youtube]: https://www.youtube.com/c/mctechnology17
[instagram]: https://www.instagram.com/mctechnology17/
[facebook]: https://m.facebook.com/mctechnology17/
[reddit]: https://www.reddit.com/user/mctechnology17
[nice-view]: https://nicekeyboards.com/nice-view
[keymap-editor]: https://nickcoutsos.github.io/keymap-editor/

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
