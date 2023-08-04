local M = {}

local function on_attach(_, bufnr)
  local rt = require("rust-tools")

  require("which-key").register(
    {
      J = { rt.join_lines.join_lines, "Join next line" },
      K = { rt.hover_actions.hover_actions, "Hover action" },

      ['<leader>l'] = {
          a = { rt.code_action_group.code_action_group, "Code action" },
          j = { function() rt.move_item.move_item(false) end, "Move item down" },
          k = { function() rt.move_item.move_item(true) end, "Move item up" },
          m = { rt.expand_macro.expand_macro, "Expand macro recursively" },
          p = { rt.parent_module.parent_module, "Go to parent module" },
          g = { rt.crate_graph.view_crate_graph, "View crate graph" },
      },
    },
    { buffer = bufnr }
  )

  rt.inlay_hints.enable()
end

function M.config_function(_, opts)
  local default_server_options = require("plugins.lsp.config").get_default_server_options()

  if opts.server ~= nil then
    opts.server = vim.tbl_deep_extend("keep", opts.server, default_server_options)
  else
    opts.server = default_server_options
  end

  opts.server.on_attach = function(_, bufnr)
    default_server_options.on_attach(_, bufnr)
    on_attach(_, bufnr)
  end

  require("rust-tools").setup(opts)
end

return M
