# Dotfiles

## Important

- [ ] Check `manpath` found `/usr/local/texlive/2023/texmf-dist/doc/man`, else
        find out how to have `manpath` recognize it

### General

- [ ] Get .mozilla out of HOME somehow and start tracking configuration/profile files
  - [ ] Maybe I can leave it in HOME but handle with stow organization
- [x] Switch from kitty to alacritty
- [x] Make gitignores if possible in bare repo
- [x] Decide on a consistent way to use and handle submodules
  - Are more aliases a bad idea?
- [ ] Organization
  - [ ] Distribute aliases possibly
  - [ ] Check out a couple dot management programs as alternatives to stow possibly
- [x] Figure out AUR management flow
  - [ ] Write script to recognize updates
    - One already exists, check if paru handles it

### Zsh

- [ ] Expand functions
  - [ ] Add completion
    - tags?
- [ ] Fix prompt
  - [ ] Find a way to not use named directories except for HOME
  - [ ] Better adapt to screen size/space
  - [x] Fix VCS to just have [repo]: in red instead of VCS program
- [ ] Add prompts P2-4
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
    - [x] latex
    - [ ] Markdown
- [ ] Improve filetype detection
  - [ ] Add dynamic detection in files without filetype
  - [ ] Add more filetypes
  - [ ] Add more detection for current filetypes
  - [ ] Add more rules for certain filetypes I use
    - [ ] Makefile tab
- [ ] Standardize
  - [ ] Switch all keybinds to which-key
    - [x] yanky
    - [ ] telescope
  - [x] Figure out keys argument for lazy
  - [ ] Get all plugin args in the same order
  - [ ] Fix up filesystem
    - [ ] Everything not in opts goes in config.lua file
- [x] Find installation startup problem with lazy
- [ ] Fix plugins lazy loading
  - [ ] Fix whichkey functions
    - [x] Add ability to add operators
  - [ ] completion/
  - [ ] diagnostics/
  - [ ] display/
  - [ ] editing/
    - [x] Comment
    - [x] yanky
  - [ ] latex/
  - [ ] lsp/
  - [ ] markdown/
  - [ ] navigation/
  - [ ] rust/
  - [ ] telescope/
  - [ ] ui/
  - [ ] visual/
  - [ ] whitespace/
  - [ ] whichkey/
- [ ] Switch away from null.nvim
  - [ ] Decide which alternatives to use
    - would lspsaga work?
  - [ ] Add new filetypes I've waited to set up
    - [ ] C++

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
  - [x] Default fallback config
    - **Can I use logic in hyprland.conf?**
- [ ] Expand binds
  - [ ] Set modal or prefix binds
    - **Can you set a single bind that triggers with any keypress?**
    - [ ] hyprland.rs
    - [ ] xremap
  - [ ] Set binds for mouse button use
  - [ ] Improve binds for mouse&keyboard use
- [ ] Improve UI
  - [ ] GAY BORDERS
  - [ ] Figure out the two different schema
  - [ ] Customize theme
  - [ ] Add status bar
  - [x] Add notifications
  - [ ] Show keybind modes visually somehow
    - borders
  - [ ] Play with runners
  - [ ] Add window and workspace rules
- [ ] Figure out clipboard
  - [ ] Keyboard shortcut for keyboard history
- [ ] Add login manager
