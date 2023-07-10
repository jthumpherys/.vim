local M = {}

local snippet = {
  entry = {
    "quangnguyen30192/cmp-nvim-ultisnips",
    dependencies = { "ultisnips", "treesitter" },
  },
  source = { name = "ultisnips" },
}
local buffer = { entry = "hrsh7th/cmp-buffer", source = { name = "buffer" } }
local buffer_lines = { entry = "amarakon/nvim-cmp-buffer-lines", source = { name = "buffer-lines" } }

local spell = {
  entry = {
    "f3fora/cmp-spell",
    config = function()
      vim.opt.spell = true
      vim.opt.spelllang = { 'en_us' }
    end,
  },
  source = { name = "spell" },
}

local sources = {
  all = {
    { entry = "hrsh7th/cmp-nvim-lsp", source = { name = "nvim_lsp" } },
    { entry = "hrsh7th/cmp-nvim-lsp-signature-help", source = { name = "nvim_lsp_signature_help" } },
    snippet,
    spell,
    buffer,
    -- buffer_lines,
  },

  filetypes = {
    gitcommit = {
      use_all = true,
      sources = {
        { entry = "petertriho/cmp-git", source = { name = "git" } },
        { entry = "Dosx001/cmp-commit", source = { name = "commit" } },
      },
    },

    latex = {
      use_all = true,
      sources = {
        { "amarakon/nvim-cmp-lua-latex-symbols", source = { name = "latex-symbols" } },
      },
    },

    lua = {
      use_all = true,
      sources = {
        { entry = "hrsh7th/cmp-nvim-lua", source = { name = "nvim_lua" } },
        {
          entry = {
            "KadoBOT/cmp-plugins",
            opts = { files = { "/home/jade/.config/nvim/lua" } },
          },
          source = { name = "plugins" },
        },
      },
    },

    markdown = {
      use_all = true,
      sources = {
        { entry = "jmbuhr/otter.nvim", source = { name = "otter.nvim" } },
        spell,
      },
    },

    text = {
      use_all = false,
      sources = {
        spell,
      },
    },

    toml = {
      use_all = true,
      sources = {
        { entry = "crates", source = { name = "crates" } },
      },
    },
  },

  cmdlines = {
    [':'] = {
      { entry = "hrsh7th/cmp-path", source = { name = "path" } },
      { entry = "hrsh7th/cmp-cmdline", source = { name = "cmdline" } },
      { entry = "dmitmel/cmp-cmdline-history", source = { name = "cmp-cmdline-history" } },
    },
    ['/'] = {
      buffer,
      -- buffer_lines,
    }
  },
}

local dep_list = {}
M.sources = {}
for _, source in pairs(sources.all) do
  table.insert(dep_list, source.entry)
  table.insert(M.sources, source.source)
end
M.filetypes = {}
for filetype, data in pairs(sources.filetypes) do
  M.filetypes[filetype] = {}
  for _, source in pairs(data.sources) do
    table.insert(dep_list, source.entry)
    table.insert(M.filetypes[filetype], source.source)
  end
  if data.use_all ~= false then
    for _, source in pairs(sources.all) do
      table.insert(M.filetypes[filetype], source.source)
    end
  end
end
M.cmdlines = {}
for type, srcs in pairs(sources.cmdlines) do
  M.cmdlines[type] = {}
  for _, source in pairs(srcs) do
    table.insert(dep_list, source.entry)
    table.insert(M.cmdlines[type], source.source)
  end
end

function M.get_dependencies(dependencies)
  local list = vim.deepcopy(dep_list)
  for _, dependency in pairs(dependencies) do
    table.insert(list, dependency)
  end
  return list
end

return M
