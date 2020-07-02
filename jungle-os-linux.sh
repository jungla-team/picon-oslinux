#!/bin/bash
#colores script

negrita='\033[1m'

rojo='\033[0;31m'
verde='\033[0;32m'
blanco='\033[0;37m'
azul='\033[0;34m'
borrar='\033[0m'
amarillo='\033[0;33m' 
NC='\033[0m'

#mensajes script

m_arrow() { printf "➜ $@\n"
}
m_correcto() { printf "${verde}✔ %s${borrar}\n" "$@"
}
m_error() { printf "${rojo}✖ %s${borrar}\n" "$@"
}
m_pregunta() { printf "${negrita}${amarillo}Ⴚ(●ტ●)Ⴢ %s${borrar}\n" "$@"
}

_Koala_cabezera()
{

echo -e ${verde}
cat << "EOF"


     ██ ██    ██ ███    ██  ██████  ██      ███████      ██████  ███████     ██      ██ ███    ██ ██    ██ ██   ██ 
     ██ ██    ██ ████   ██ ██       ██      ██          ██    ██ ██          ██      ██ ████   ██ ██    ██  ██ ██  
     ██ ██    ██ ██ ██  ██ ██   ███ ██      █████       ██    ██ ███████     ██      ██ ██ ██  ██ ██    ██   ███   
██   ██ ██    ██ ██  ██ ██ ██    ██ ██      ██          ██    ██      ██     ██      ██ ██  ██ ██ ██    ██  ██ ██  
 █████   ██████  ██   ████  ██████  ███████ ███████      ██████  ███████     ███████ ██ ██   ████  ██████  ██   ██ 
                                                                      
										
EOF

echo
echo -e "${verde}Web: wwww.jungle-team.com${borrar}"
echo
echo -e "${verde}Grupo Telegram: https://t.me/joinchat/Bv0_2hZ8jH6dsUJFoYG-Rg${borrar}"
echo
echo -e "${rojo}version: 1.0 jungle-team @2019${borrar}"
}

confirmacion() {
  while true; do
    read -r -n 1 -p "${1:-Estas seguro que deseas continuar?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) echo ; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "No valido"
    esac 
  done  
}

_Koala_ayuda()
{

echo -e ${verde}
cat << "EOF"
             |       :     . |  -- Soporte: https://t.me/joinchat/Bv0_2hZ8jH6dsUJFoYG-Rg
             | '  :      '   |  
             |  .  |   '  |  |  -- web: www.jungle-team.com
   .--._ _...:.._ _.--. ,  ' |  
  (  ,  `        `  ,  )   . |  -- Desarrolladores: @tanha_ro 
   '-/              \-'  |   |  
     |  o   /\   o  |       :|  -- Jungle Os Linux instala lista canales y picon
     \     _\/_     / :  '   |
     /'._   ^^   _.;___      |  -- Pulsa intro para volver al menu principal
   /`    `""""""`      `\=   |
 /`                     /=  .|
;             '--,-----'=    |
|                 `\  |    . |
\                   \___ :   |
/'.                     `\=  |
\_/`--......_            /=  |
            |`-.        /= : |
            | : `-.__ /` .   |
            |    .   ` |    '|
            |  .  : `   . |  |
            

EOF
}

temporizador()
{
tiempo=15 # segundos

echo
echo -e "${negrita}${rojo}¿ Estas seguro que deseas continuar con la instalacion ?${borrar}"
echo -e "${negrita}${rojo}¡¡¡ Si continua se procedera a instalacion, me joderia que lo hiciera por error${borrar}"
echo ""
contador=${tiempo}
while [[ ${contador} -gt 0 ]];
do
    printf "\rTienes ${negrita}${verde}%2d segundos${borrar} para pulsar ${negrita}${amarillo}Ctrl+C${borrar} y asi cancelar la instalacion!" ${contador}
    sleep 1
        : $((contador--))
done
echo ""
}

listacanales () {
  read -p "Si introduces comunitaria se instalara esta si no por defecto individual: " lista
  if [ "$lista" == "comunitaria" ]; then
    echo
    m_correcto "Se procede a la descarga de lista comunitaria"
    url="https://github.com/jungla-team/lista-astra-comunitaria-oslinux/raw/master/setting_astra_comunitaria-master.tar"
    lista="koala42_comunitaria.tar"
else
    echo
    m_correcto "Se procede a la instalacion de lista individual"
    url="https://raw.githubusercontent.com/jungla-team/lista-astra-oslinux/master/setting_lince_astra-master.tar"
    lista="setting_lince_astra-master.tar"
fi
}

picon () {
  read -p "Si introduces lunar se instalara esta si no por defecto transparentes: " lista
  if [ "$lista" == "lunar" ]; then
    echo
    m_correcto "Se procede a la descarga de picones lunares"
    url="https://raw.githubusercontent.com/jungla-team/picon-oslinux/master/movistar-lunar.tar"
    picones="movistar-lunar.tar"
else
    echo
    m_correcto "Se procede a la instalacion de picones transparentes"
    url="https://raw.githubusercontent.com/jungla-team/picon-oslinux/master/movistar-original.tar"
    picones="movistar-original.tar"
fi
}




instalacion_canales () {
 listacanales
 temporizador
 wget -q $url
 rm -rf /home/gx/local/enigma_db/lamedb
 rm -rf /home/gx/local/enigma_db/blacklist
 rm -rf /home/gx/local/enigma_db/satellites.xml
 rm -rf /home/gx/local/enigma_db/cables.xml
 rm -rf /home/gx/local/enigma_db/terrestrial.xml
 rm -rf /home/gx/local/enigma_db/cables.xml
 rm -rf /home/gx/local/enigma_db/bouquet*
 rm -rf /home/gx/local/enigma_db/userbouquet*
 tar -xvf /home/gx/local/$lista -C /home/gx/local/enigma_db/

 rm -r /home/gx/local/$lista
 echo
 m_correcto "Ha finalizado la instalacion espere a que se reinicie completamente el receptor"
 sleep 5
 reboot
}

instalacion_picon () {
 picon
 temporizador
 wget -q $url
 tar -xvf /home/gx/local/$picones -C /usr/picon/192/
 rm -r /home/gx/local/$picones
 echo
 m_correcto "Ha finalizado la instalacion espere a que se reinicie completamente el receptor"
 sleep 5
 reboot
}


_Koala_menu()
{
    _Koala_cabezera
    echo -e "${verde}__________________________________________________________________________${borrar}"
    echo
    echo -e "${negrita}${azul}MENU INSTALACION LISTA CANALES Y PICON:${borrar}"
    echo
    echo -e "${blanco}1) Instalacion ${borrar} ${negrita}${verde}LISTA CANALES${borrar}"
	echo -e "${blanco}2) Instalacion ${borrar} ${negrita}${verde}PICONES${borrar}"
	echo
	echo -e "${blanco}3) Ayuda${borrar}"
    echo
    echo -e "${blanco}4) Salir${borrar}"
    echo
    m_pregunta "Introduce que instalacion desea realizar: "
}

# opcion por defecto
opc="0"
 
# bucle mientas la opcion indicada sea diferente de 9 (salir)
until [ "$opc" -eq "4" ];
do
    case $opc in
        1)
			
			if confirmacion; then
			    echo
  				m_correcto "Se procede a la instalacion de listas canales"
  				echo
  				instalacion_canales
  				
			else
			    echo
  				m_error "Has cancelado la instalacion de listas canales"
  				echo
			fi
			sleep 5
			clear
            _Koala_menu
            ;;
        2)
			if confirmacion; then
			    echo
  				m_correcto "Se procede a la instalacion de picones"
  				echo
  				instalacion_picon
  				
			else
			    echo
  				m_error "Has cancelado la instalacion de picones"
  				echo
			fi
			sleep 5
			clear
            _Koala_menu
            ;;
  
        3)
            _Koala_ayuda
            ;;
            
  
        *)
            # Esta opcion se ejecuta si no es ninguna de las anteriores
            clear
            _Koala_menu
            ;;
    esac
    read opc
done
