#!/bin/ksh
# Copyright (c) 2025 fifthBro (https://github.com/fifthBro/mh2p-ssh-access)
# This Mod is part of MH2p SD ModKit, licensed under CC BY-NC-SA 4.0.
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# See the LICENSE file in the project root for full license text.
# NOT FOR COMMERCIAL USE


[[ ! -e $MOD_PATH/Backup ]] && mkdir $MOD_PATH/Backup

if [[ -e "/mnt/app/root/.ssh" ]]; then
    if [[ -f "$MOD_PATH/authorized_keys" ]]; then
        if [[ -e "/mnt/app/root/.ssh/authorized_keys" ]]; then
            echo "Backing up existing ssh public keys"
            cp -vf /mnt/app/root/.ssh/authorized_keys $MOD_PATH/Backup/authorized_keys_orig
        fi
        echo "Adding ssh public key"
        cat $MOD_PATH/authorized_keys >> /mnt/app/root/.ssh/authorized_keys
        cp -vf /mnt/app/root/.ssh/authorized_keys $MOD_PATH/Backup/authorized_keys_patched
    else
        echo "error: cannot find $MOD_PATH/authorized_keys"
    fi
else
    echo "error: /mnt/app/root/.ssh does not exist"
fi