# Dots for Fedora 41
```shell
cd ~/Downloads
wget https://github.com/marcusmt/dots/archive/refs/heads/fedora.zip
unzip fedora.zip
cd dots-fedora/
./install.sh
```

## To change Plymouth screen:
1. Change the configuration in /usr/share/plymouth
2. Run the command to update:
```shell
sudo plymouth-set-default-theme -R bgrt
```
