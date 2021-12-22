#!/bin/sh

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present Shanti Gilbert (https://github.com/shantigilbert)

# Source predefined functions and variables
. /etc/profile

DATA="https://github.com/mmatyas/supermariowar-data/archive/master.zip"
DATAFOLDER="/storage/roms/ports/smw/data"
CONFIGFOLDER="/emuelec/configs/smw"

mkdir -p "${DATAFOLDER}"
mkdir -p "${CONFIGFOLDER}"
cd "${DATAFOLDER}"

if [ "$EE_DEVICE" == "Amlogic-ng" ]; then 
fbfix
fi

if [ ! -f "${CONFIGFOLDER}/nofakekeyb" ]; then 
    gptokeyb &
    touch "${CONFIGFOLDER}/nofakekeyb"
fi

if [ ! -e "${DATAFOLDER}/worlds/Big JM_Mixed River.txt" ]; then
    if [ $(get_ee_setting system.language) == "zh_CN" ]; then
    text_viewer -y -w -f 24 -t "没有数据!" -m "首次运行超级马里奥大战或数据文件夹不存在.\n\n数据约为 30 MB, 需要连接到网络.\n游戏首次运行时, 如果设置了假键盘, 您需要设置控制器/游戏手柄并重新启动游戏.\n\n下载后继续吗?"
    
    
    else
    text_viewer -y -w -f 24 -t "Data does not exists!" -m "It seems this is the first time you are launching Super Mario War or the data folder does not exists\n\nData is about 30 MB total, and you need to be connected to the internet\n\nKeep in mind the first time you run the game a fake keyboard is set, you need to set up your controller/gamepad and restart the game.\n\nDownload and continue?"
    fi
        if [[ $? == 21 ]]; then
            ee_console enable
            wget "${DATA}" -q --show-progress > /dev/tty0 2>&1
            unzip "master.zip" > /dev/tty0
            mv supermariowar-data-master/* "${DATAFOLDER}" > /dev/tty0
            rm -rf "supermariowar-data-master" > /dev/tty0 2>&1
            rm "master.zip" > /dev/tty0 2>&1
            rm "imgui.ini" > /dev/tty0 2>&1
            ee_console disable
            cd "${DATAFOLDER}/.."
            smw --datadir "${DATAFOLDER}" > /emuelec/logs/emuelec.log 2>&1
        else
            exit 0
        fi
else
    smw --datadir "${DATAFOLDER}" > /emuelec/logs/emuelec.log 2>&1
fi

killall gptokeyb &
