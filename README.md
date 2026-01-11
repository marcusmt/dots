# Dots
```shell
cd ~/Downloads
wget https://github.com/marcusmt/dots/archive/refs/heads/main.zip
unzip dots-main.zip
cd dots-main/
./install.sh
```

Bluefin Main Setup
Stable with Nvidia, has ujust to easily install tools.
Unbreakable.

X11 Problems:
Fractional scalling
Scaling in X11 is impossible. Even when using single monitor layout. It's annoying to control the scaling for two screens with different resolutions. The X dpi value must be updated when switching layouts however the apps do not adapt to the switch. It's needed to restart them.
This became the reason why X11 is not working anymore for me. Tearing and stuttering are really annoying when reading code and not even single monitor setup can solve it fully.
However X11 is way easier to maintain and confgure than Wayland. Everything just works.

Wayland Problems:
Several applications are not ready for it. Browsers, for example, can't reproduce videos well. I have to switch the browser to xwayland. Defeating the purpose of using Wayland...
Screen sharing is terrible.
