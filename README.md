# Dots for Fedora 41
```shell
cd ~/Downloads
wget https://github.com/marcusmt/dots/archive/refs/heads/main.zip
unzip main.zip
cd main/
./install.sh
```

## To change Plymouth screen:
1. Change the configuration in /usr/share/plymouth
2. Run the command to update:
```shell
sudo plymouth-set-default-theme -R bgrt
```
