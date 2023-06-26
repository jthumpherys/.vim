# Jade's Dotfiles

### To use
1. Clone the repo into your home directory, for example:
    ```Shell
    $ git clone git@github.com:jade-tea-h/dotfiles.git .dotfiles
    ```
2. Stow `common` and `generic`
    ```Shell
    $ cd .dotfiles && stow common generic
    ```
3. If you want to add a local configuration for a single device, add a new directory for your device and stow that instead of generic. See [Local](#local) for more details.

## Workflow

### Compositor - Hyprland
- I am using `hyprland-nvidia-git` from the AUR because I have an nvidia GPU but the configuration here ought to work with the main branch fine.
- Vim-ish keybinds (working on adding modal system) mostly relying on Super
#### Display Manager - 
#### Notifications - dunst
- I use the default settings so no config is included here
- To change notification daemon find `exec-once dunst` in `~/.config/hypr/hyprland.conf` and change it to your desired program
#### Status Bar - eww
- Haven't done this yet

### Terminal Emulator - alacritty
- Only have a colorscheme set (won't work until you run neovim to install all the plugins)
- Most shell stuff is done in Zellij or Zsh configs

### Multiplexer - Zellij
- Basic config with vimified keybinds, colorscheme and a startup layout
- Tmux config with vimified keybinds also included

### Shell - Zsh
- Vi mode
- Prompt similar to Ubuntu default bash prompt but shows git repo and right side prompt has date and time

### Text Editor - Neovim
- Plugins in `~/.config/nvim/lua/plugins`
- Adding a language server and its settings to `M.language_servers` in `lsp/language_server.lua` will automatically install it with Mason before configuring
- Adding a tool to `M.null_packages` in `lsp/null.lua` will have Mason install it automatically
- Currently fixing organization -- will explain here when finished
- n.b. if using any local neovim plugins, lazy.nvim will get confused unless you run `stow` with the flag `--no-folding`

### Included Scripts
#### Scripts
#### Zsh functions

## Startup and System
### XCompose
### systemd

---

### Local Settings
To add local settings for a single device, add another directory to the repo with local files and stow it instead of `generic`.

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

- Other
    - `~/.local/sbin` and `~/.local/bin` are in the path, so executables in `[device]/.local/sbin` or `[device/.local/bin` will be as well.
