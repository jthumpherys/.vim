local M = {}

function M.nightfox(_, options)
  local C = require("nightfox.lib.color")
  local Shade = require("nightfox.lib.shade")
  local bg = C.from_hex("#1b1029")
  local opts = { options = options }
  opts.palettes = {
    duskfox = {
      bg0 = bg:shade(-0.2):to_hex(),
      bg1 = bg:to_hex(),
      bg2 = bg:shade(0.07):to_hex(),
      bg3 = bg:shade(0.15):to_hex(),
      bg4 = bg:shade(0.3):to_hex(),

      -- white = Shade.new("")

      purple = Shade.new("#b08ddf", "#c9afe5", "#9570c2"),
      magenta = Shade.new("#cc58d5", "#e777ee", "#b437c0"),
      blue = Shade.new("#567fba", "#8aa5dd", "#445a8c"),
      cyan = C.blue,
    },
  }
  opts.palettes.duskfox.white = opts.palettes.duskfox.purple
  opts.specs = {
    duskfox = {
      syntax = {
        -- builtin0 = "magenta.bright",
        -- keyword = "purple",
        variable = "purple",
        builtin1 = "purple.dim",
        ident = "purple.bright",
        -- field = "green",
        -- field = "magenta.bright",
        -- func = "pink",
        -- string = "pink.bright",
        -- bracket = "pink.dim",
      },
    },
  }
  require("nightfox").setup(opts)
  vim.cmd[[colorscheme duskfox]]
end

return M
