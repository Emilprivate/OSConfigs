# Notes:

**VSCODE**
### Remember to add the following in user settings json file in order to prevent vscode from using the default titlebar style:
```"window.titleBarStyle": "custom",```

### In order to install Ly display manager:
1) Download and install zig 0.12.0 (has to be this version for the current version of Ly)
2) Put inside $HOME/Applications or whereever.
3) Create an alias or export it's path inside bashrc or zshrc.
4) Follow [Ly]([Ly](https://github.com/fairyglade/ly)) guide.
5) If ```sudo systemctl enable ly.service``` doesn't work then ensure to backup the existing one by renaming it such as: ```sudo mv /etc/systemd/system/display-manager.service /etc/systemd/system/display-manager.service.bak``` and then try again.
6) Test with ```systemctl status ly.service```
7) Reboot.