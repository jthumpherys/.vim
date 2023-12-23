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

## Plugins

### [WhichKey](github.com:folke/which-key.nvim)

### [Treesitter](github.com:nvim-treesitter/nvim-treesitter)

### [Telescope](github.com:nvim-telescope/telescope.nvim)

### Editing

#### Comments
