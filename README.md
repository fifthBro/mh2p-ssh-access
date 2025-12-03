# Enabling SSH Access on PCM5 (MH2p) in production mode

This Mod enables root SSH access on port 2012 on Porsche PCM5 and Audi/VW (MH2p) systems in Production Mode. 
It works with MH2p SD ModKit (v2 or v1 with modifications) and requires a D-Link DUB-E100 USB-to-Ethernet adapter.

---

## 1. Generate SSH keypair
Use PuTTYgen, OpenSSL, or `ssh-keygen` to create a private/public RSA keypair.

`ssh-keygen -t rsa -b 2048 -f "$(date +"rsa-key-%Y%j")" -f mh2p.key`

or if you are using Windows/Putty follow the instructions here https://learn.microsoft.com/en-us/viva/glint/setup/sftp-ssh-key-gen


## 2. Add keys to the Mod

Copy your **public key (in OpenSSH base64 format)** and put it in the file named `authorized_keys` in ModKit Mod 
`mh2p-ssh-access/Mod/Update/` directory:

In the example above you would copy and rename `mh2p.key.pub` to `authorized_keys` :

```
cp mh2p.key.pub mh2p-ssh-access/Mod/Update/authorized_keys
```

---

## 3. Add it to MH2p SD ModKit
Put the mh2p-ssh-access directory into MH2p SD ModKit Mods/ directory as per instructions https://lawpaul.github.io/MH2p_SD_ModKit_Site/

---

## 5. Install the Mod
Install using the official MH2p SD ModKit:

https://lawpaul.github.io/MH2p_SD_ModKit_Site/

After reboot, connect via Ethernet using the *D-Link DUB-E100* and log in with your private key:

```
ssh -i mh2p.key -p 2012 root@172.16.250.248
```
or if you client forces differnt key to rsa-ssh
```
ssh -i mh2p.key -p 2012 -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedAlgorithms=+ssh-rsa root@172.16.250.248
```
You now have root SSH access to PCM5 (MH2p) in production mode.

## 5. Credits
MH2p_SD_ModKit https://lawpaul.github.io/MH2p_SD_ModKit_Site/
