[![MC Technology](https://github.com/mctechnology17/mctechnology17/blob/main/src/mctechnology_extendido.GIF)](https://www.youtube.com/channel/UC_mYh5PYPHBJ5YYUj8AIkcw)

<div align="center">

  [<img align="center" alt="MC Technology | YouTube" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/youtube.png" />][youtube]
  [<img align="center" alt="@mctechnology17 | Twitter" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/twitter.png" />][twitter]
  [<img align="center" alt="@mctechnology17 | Instagram" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/instagram.png" />][instagram]
  [<img align="center" alt="MC Technology17 | Facebook" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/facebook.png" />][facebook]
  [<img align="center" alt="@mctechnology17 | Reddit" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/reddit.png" />][reddit]

</div>
<br>


- [Intro](#Intro)
- [Instalacion](#Instalacion)
- [Donacion](#Donacion)
- [LICENSE](#LICENSE)

----

# Intro
Este repositorio contiene mi configuracion personal de mi teclado corne con el sofware de [ZMK](https://zmk.dev/docs),
flashado en el microcontrolador [nice!nano_v2](https://nicekeyboards.com/nice-nano).

NO ME HAGO RESPONSABLE DE NINGUN DAÑO QUE PUEDA OCASIONAR ESTE CODIGO, UTILIZALO
BAJO TU PROPIO RIESGO.

SIENTETE LIBRE DE MODIFICAR EL CODIGO A TU GUSTO O DE OCUPAR LO QUE NECESITES
NO OLVIDES REFERENCIAR A LOS AUTORES DE LOS CODIGOS QUE OCUPES.

Caracteristicas:
 - Teclado inalambrico con bleutooth y usb-c
 - Teclado ergonomico
 - Altamente programable con el sofware de ZMK
 - Compatibilidad con Linux, Windows, MacOS, Android, IOS y mas
 - Completamente inalambrico entre las dos mitades
 - Y mas...

FUNCIONANDO SIN ERRORES HASTA EL MOMENTO!

# Instalacion
[Referencia ZMK](https://zmk.dev/docs/user-setup) de donde saque la informacion.

Requisitos:
 - Tener instalado `git` en tu computadora y una cuenta en github
 - Opcional tener instalado VSC (Visual Studio Code)
   u otro editor de texto de tu preferencia, yo uso `nvim/vim`
 - Opcional puedes de preferencia usar `git` con SSH
   eso te evitara tener que poner tu usuario y contraseña

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
├── build.yaml # archivo de configuracion para el compilado
├── config # carpeta de configuracion
│   ├── corne.conf # archicho de configuracios de las macros
│   ├── corne.keymap # archicho de configuracios de las teclas
│   └── west.yml # config para conectarse con https://github.com/zmkfirmware NO MODIFICAR
└── README.md
```

Si no modificaste nada peiedes simplemente ir a tu repositorio en github y dale a refrescar a la pagina.
[En mi caso aqui](https://github.com/mctechnology17/zmk-config).

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

# Donacion
Si disfrutas de mi trabajo, siéntete libre de donar o convertirte en patrocinador.
- [paypal]
- [sponsor]

Emsamblador y creador/mantenedor de vimtools, GitManager y más,
que son herramientas de trabajo fáciles de integrar, pero muy potentes que te permiten
mejore su flujo de trabajo, integrándose con todos los sistemas operativos y todas las
shells(zsh, fish, bash, etc.) posibles.

Aquí puedes ver otro proyecto publicado recientemente:
- [vimtools] navaja suiza para vim (funciones y configuraciones que te facilitarán la vida)
- [gm] administrador multiplataforma GIT con una interfaz de usuario amigable
- [vim-better-header] la mejor plantilla automatizada
- [vim-executor] Ejecutador de código multilenguaje


# [LICENSE](LICENSE)

Released under the GNU General Public License v3.0.

Copyright (c) 2022 Marcos Chow Castro

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
