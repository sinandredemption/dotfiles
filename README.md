# dotfiles
Dotfiles and scripts of my ArchLinux setup

## What's in here?
Configuration files and few helper scripts.

## What's the setup like?
- Window Manager: dwm 6.2
- Terminal: Kitty
- Editor: vim
- Shell: synth-shell (custom theme)
- Key binder: xbindkeys
- Theming: My implementation of the Nord theme

## A few notes and warnings
### `scripts`
- `set_backlight.sh` assumes `xbacklight` is installed
- `vpn.sh` assumes Cloudflare's `warp-cli` is installed

### `dwm`
- I'm using dwm-flexipatch (I used vanilla dwm before this and patching became too much trouble after just 2-3 patches)
- Some sort of Nord theme is applied
- Not patched for clickable status-bar.

### `dwmblocks`
- Using this version which supports clickability and bash scripting.
- `blocks` folder contains my status bar block scripts

### st
I don't use st (except as a backup terminal) so I haven't patched it much.
- Simple Nord theme and font change

### Kitty
- Nord theming
- A few key remappings and some some minor changes here and there

### qt5ct
- Nord theming for Qt5 GUIs

### synth-shell
- Decluttered the prompt so that it only prints the operating directory
- Theming according to personal choice

### .Xresources
- Some dpi scaling is done

The rest of the things are pretty self-explanatory.
