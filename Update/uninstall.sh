#!/bin/ksh
# Copyright (c) 2025 fifthBro (https://github.com/fifthBro/mh2p-ssh-access)
# This Mod is part of MH2p SD ModKit, licensed under CC BY-NC-SA 4.0.
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# See the LICENSE file in the project root for full license text.
# NOT FOR COMMERCIAL USE

if [[ -e "$MOD_PATH/Backup/authorized_keys_orig" ]]; then
    echo "Removing ssh public keys"
    cp -vf $MOD_PATH/Backup/authorized_keys_orig /mnt/app/root/.ssh/authorized_keys
fi