# Dotfiles

## Important
- [ ] Check `manpath` found `/usr/local/texlive/2023/texmf-dist/doc/man`, else find out how to have `manpath` recognize it

### General
- [ ] Get .mozilla out of HOME somehow and start tracking configuration/profile files
- [x] Switch from kitty to alacritty
- [x] Make gitignores if possible in bare repo
- [ ] Decide on a consistent way to use and handle submodules
    - Are more aliases a bad idea?
- [ ] Figure out AUR management flow
    - [ ] Write script to recognize updates

### Zsh
- [ ] Expand functions
    - [ ] Add completion
        - tags?
- [ ] Fix prompt
    - [ ] Find a way to not use named directories except for HOME
    - [ ] Better adapt to screen size/space
    - [x] Fix VCS to just have [repo]: in red instead of VCS program
- [ ] Add prompts P2-4
- [ ] Add scripts to assist in handling AUR and programs installed from source
- [ ] Alias for command line scrolling program
- [ ] Keybindings
    - [ ] Customize menu and completion binds
    - [ ] Vi-ify even more
- [ ] Colors!

### Neovim
- [x] Figure out lsp
- [ ] Improve UI
    - [ ] Customize theme
    - [ ] Customize status bar
    - [ ] Add live displays
        - [ ] latex
        - [ ] Markdown
- [ ] Improve filetype detection
    - [ ] Add dynamic detection in files without filetype
    - [ ] Add more filetypes
    - [ ] Add more detection for current filetypes
    - [ ] Add more rules for certain filetypes I use
        - [ ] Makefile tab
- [ ] Standardize
    - [ ] Switch all keybinds to which-key
        - [ ] yanky
        - [ ] telescope
    - [ ] Figure out keys argument for lazy
    - [ ] Get all plugin args in the same order
    - [ ] Fix up filesystem
        - [ ] Everything not in opts goes in config.lua file
- [ ] Find installation startup problem with lazy

### Zellij
- [ ] Set up my own layouts
- [ ] Find a better status bar
- [ ] Set configuration
    - [ ] Set my own keybinds
        - [ ] Set caps lock to something more useful

<!-- ### tmux -->
<!-- - [ ] Make/fix tmuxp yamls -->
<!-- - [ ] Differentiate between tmux and zsh vi-mode -->
<!--     - [ ] Change cursor to reflect which vi-mode is active -->
<!--     - [ ] Look into using a different <esc> keybind for each -->
<!--         - jk vs kj -->
<!--         - tmux prefix -->
<!-- - [ ] Improve UI -->
<!--     - [ ] Customize theme -->
<!--     - [ ] Customize status bar -->

### xremap
- [ ] Figure out why the hell it isn't working

### Hyprland
- [x] Handle different devices
    - [ ] Default fallback config
        - **Can I use logic in hyprland.conf?**
- [ ] Expand binds
    - [ ] Set modal or prefix binds
        - **Can you set a single bind that triggers with any keypress?**
    - [ ] Set binds for mouse button use
    - [ ] Improve binds for mouse&keyboard use
- [ ] Improve UI
    - [ ] Figure out the two different schema
    - [ ] Customize theme
    - [ ] Add status bar
    - [x] Add notifications
    - [ ] Show keybind modes visually somehow
    - [ ] Add runner
    - [ ] Add window and workspace rules
- [ ] Figure out clipboard
- [ ] Add login manager
