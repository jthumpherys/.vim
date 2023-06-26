# Jade's dotfiles

### To use
1. Clone the repo into your home directory, for example:
    ```Shell
    $ git clone git@github.com:jade-tea-h/dotfiles.git .dotfiles
    ```
2. Stow `common` and `generic`
    ```Shell
    $ cd .dotfiles && stow common generic
    ```
3. If you want to add your own local configuration, add a new directory for your device and stow that instead of generic. See [Local](#local) for more details.

## Workflow

### Startup
#### systemd
### Shell

## Other Applications

## 
### XCompose
### systemd
### Hyprland

## Terminal

### Terminal Emulator
#### kitty
#### alacritty

### Terminal Multiplexer
#### Zellij

### Shell
#### Zsh
#### bash

### Text Editor
#### Neovim
#### Vim

## 
### 
#### Zathura
#### Firefox

---

### Local Settings
To add local settings for your own device, add another directory to the repo with local files and stow it instead of `generic`.

#### Currently supported local locations:
- Zsh
    - All shells:
        - `[device]/.config/zsh/env.local`
    - Login shells:
        - `[device]/.config/zsh/profile.local`
        - Any files named `env` in all directories in `[device]/.config/` named anything besides `zsh` `shell` `bash` `sh` (e.g. `[device]/.config/myprogram/env`)
    - Interactive shells:
        - `[device]/.config/zsh/rc.local`
        - Any functions in `[device]/.config/zsh/funcs`

- Hyprland
    - `[device]/.config/monitor.conf`
        - First thing sourced by `hyprland.conf`
    - `[device]/.config/local.conf`
        - Last thing sourced by `hyprland.conf`
    - n.b. Hyprland will complain if these files don't exist. If you don't want to use them, just add blank files in these locations.

- Neovim
    - Any lua file in `[device]/.config/nvim/lua/plugins/` will be checked by lazy.nvim for plugins. Check for collisions with filenames in `common`

- Zellij
    - Any layouts in `[device]/.config/zellij/layouts/` will be recognized
    - Any themes in `[device]/.config/zellij/themes/` will be recognized

- Other
    - `~/.local/sbin` and `~/.local/bin` are in the path, so executables in `[device]/.local/sbin` or `[device/.local/bin` will be as well.
