# Enabling SSH Access on PCM5 (MH2p) in production mode

This Mod enables root SSH access on port 2012 on Porsche PCM5 and Audi/VW (MH2p) systems in Production Mode. 
It works with MH2p SD ModKit (v2 or v1 with modifications) and requires a D-Link DUB-E100 USB-to-Ethernet adapter.

---

## 1. Generate SSH keypair
Use PuTTYgen, OpenSSL, or `ssh-keygen` to create a private/public RSA keypair.

Copy your **public key (OpenSSH base64 format)** into a file named:

```
authorized_keys
```

---

## 2. Add keys to the Mod

Place your `authorized_keys`  inside:

```
SSH_Access/Mod/Update/
```

---

## 3. Add it to MH2p SD ModKit
Put the mh2p-ssh-access directory into MH2p SD ModKit Mods/ directory as per instructions https://lawpaul.github.io/MH2p_SD_ModKit_Site/

---

## 5. Install the Mod
Install using the official MH2p SD ModKit:

https://lawpaul.github.io/MH2p_SD_ModKit_Site/

After reboot, connect via Ethernet using the *D-Link DUB-E100* and log in:

```sh
ssh -i <your_private_key> -p 2012 root@172.16.250.248
```

You now have root SSH access to PCM5 (MH2p) in production mode.

## 5. Credits
MH2p_SD_ModKit https://lawpaul.github.io/MH2p_SD_ModKit_Site/
