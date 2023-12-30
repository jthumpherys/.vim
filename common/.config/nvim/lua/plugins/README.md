# Neovim Plugins

## Configuration

Lazy entry keys are listed in the following order:

```lua
{
  "page/plugin.nvim",
  name = "plug",
  url = ...,
  dev = ...,
  dir = ...,

  enabled = ...,
  cond = ...,
  build = ...,
  main = ...,

  -- plugin configuration
  opts = {
    ...
  },
  config = function() ... end,
  init = function() ... end,

  -- versioning
  version = ...,
  commit = ...,
  tag = ...,
  branch = ...,
  pin = ...,

  dependencies = {
    ...
  },

  -- loading
  lazy = ...,
  priority = ...,
  event = ...,
  ft = ...,
  cmd = ...,
  keys = ...,
}
```

### Subdirectory Structure

```terminal
 grouping
├── config.lua
├── init.lua
├── keymaps.lua
└── utils.lua
```

- `init.lua` contains the primary lazy plugin entries
- `config.lua` separates out configuration functions for plugins that may have a more intensive configuration process
- `utils.lua` contains tools for a particular plugin to have its configuration modified by external plugins i.e. to add extensions
- `keymaps.lua` separates out plugin keymaps and provides `keys` lazy entries when applicable

## Plugins

### [WhichKey](github.com:folke/which-key.nvim)

### [Treesitter](github.com:nvim-treesitter/nvim-treesitter)

### [Telescope](github.com:nvim-telescope/telescope.nvim)

#### Extensions

### Editing

#### Comments

## Keymaps

```lua
plugin_name = {
  module = "plugin",  -- gets all functions from `require("plugin")`
  prefix = '<leader>',
  group_name = {
    key = 'k',
    execute,
    subgroup_name = { ... },
    modifiers = {
      m = { args = { "arg1", "arg2" } },
      o = { args = { {option_a = 'a'} } },
    }
  }
}
```
