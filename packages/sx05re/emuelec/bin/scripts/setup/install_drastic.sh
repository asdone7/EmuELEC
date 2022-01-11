#!/bin/bash

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present Shanti Gilbert (https://github.com/shantigilbert)

# Source predefined functions and variables
. /etc/profile

function drastic_confirm() {
if [ $(get_ee_setting system.language) == "zh_CN" ]; then
    text_viewer -y -w -t "安装NDS模拟器" -f 24 -m "这将安装并启用NDS模拟器\n\n注意: 您需要连接互联网，并且在安装结束后重新启动，是否继续?"
        if [[ $? == 21 ]]; then
            if drastic_install; then
                text_viewer -w -t "安装成功!" -f 24 -m "安装完成了！请不要忘记将roms安装到/storage/roms/nds，然后重新启动前端!"
            else
                text_viewer -e -w -t "安装失败!" -f 24 -m "安装失败!, 请确认已连接到互联网!"
            fi
      fi
    ee_console disable
fi
 }

function drastic_install() {
ee_console enable

if grep -q "aarch64" /etc/motd; then
    LINK="https://link.jscdn.cn/1drv/aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBbzBxb2U5eUt6RzRnWkFfY2FxUW5sLWtkbDRUcUE_ZT1xbVVuSWI..tar.gz"
else
	LINK="https://raw.githubusercontent.com/shantigilbert/binaries/master/odroid-xu4/drastic.tar.gz"
fi

ES_FOLDER="/storage/.emulationstation"
LINKDEST="$ES_FOLDER/scripts/drastic.tar.gz"
CFG="$ES_FOLDER/es_systems.cfg"

mkdir -p "$ES_FOLDER/scripts/"

wget -O $LINKDEST $LINK

[[ ! -f $LINKDEST ]] && return 1
tar xvf $LINKDEST -C "$ES_FOLDER/scripts"
rm $LINKDEST

if grep -q '<name>nds</name>' "$CFG"
then
	echo 'Drastic is already setup in your es_systems.cfg file'
	echo 'deleting...nd from es_system.cfg'
	xmlstarlet ed -L -P -d "/systemList/system[name='nds']" $CFG
fi

	echo 'Adding Drastic to systems list'
	xmlstarlet ed --omit-decl --inplace \
		-s '//systemList' -t elem -n 'system' \
		-s '//systemList/system[last()]' -t elem -n 'name' -v 'nds'\
		-s '//systemList/system[last()]' -t elem -n 'fullname' -v 'Nintendo DS'\
		-s '//systemList/system[last()]' -t elem -n 'manufacturer' -v 'Nintendo'\
		-s '//systemList/system[last()]' -t elem -n 'release' -v '2004'\
		-s '//systemList/system[last()]' -t elem -n 'hardware' -v 'portable'\
		-s '//systemList/system[last()]' -t elem -n 'path' -v '/storage/roms/nds'\
		-s '//systemList/system[last()]' -t elem -n 'extension' -v '.nds .NDS .zip .ZIP .7z .7Z'\
		-s '//systemList/system[last()]' -t elem -n 'command' -v "emuelecRunEmu.sh %ROM% -P%SYSTEM% --core=%CORE% --emulator=%EMULATOR% --controllers=\"%CONTROLLERSCONFIG%\""\
		-s '//systemList/system[last()]' -t elem -n 'platform' -v 'nds'\
		-s '//systemList/system[last()]' -t elem -n 'theme' -v 'nds'\
		$CFG

read -d '' content <<EOF
#!/bin/bash

# Only run pixel if it exists, mainly for N2
if [ -f "/storage/.emulationstation/scripts/pixel.sh" ]; then
/storage/.emulationstation/scripts/pixel.sh
fi

cd /storage/.emulationstation/scripts/drastic/
./drastic "\$1" > /dev/null 2>&1

EOF
echo "$content" > $ES_FOLDER/scripts/drastic.sh
chmod +x $ES_FOLDER/scripts/drastic.sh

if [ "$EE_DEVICE" == "OdroidGoAdvance" ] || [ "$EE_DEVICE" == "GameForce" ]; then
# copy the correct config file depending on what OGA

DEVICE=$(oga_ver)
cd "/storage/.emulationstation/scripts/drastic/config"

case "${DEVICE}" in
    "OGS")
        cp -rf drastic_ogs.cfg drastic.cfg
    ;;
    "OGABE")
        cp -rf drastic_ogabe.cfg drastic.cfg
    ;;
    "OGA1")
        cp -rf drastic_oga.cfg drastic.cfg
    ;;
    "GF")
        cp -rf drastic_ogs.cfg drastic.cfg
    ;;
esac

fi

echo "完成后, 重新启动前端"
ee_console disable
rm /tmp/display > /dev/null 2>&1
return 0
}

drastic_confirm

