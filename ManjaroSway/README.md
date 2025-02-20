## Steps to fix configuration:
- Uninstall flashfocus : `sudo pacman -R flashfocus` and then relog.
- Configure p10k : 'p10k configure'
- cd `~/.vim/plugged/YouCompleteMe` -> `python3 install.py --all`
- Inside vim : `:CocInstall coc-tsserver coc-json coc-html coc-css`
- Copilot initialisation within vim : `:Copilot auth`
