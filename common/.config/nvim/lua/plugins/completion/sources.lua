local M = {}

local snippet = {
  entry = {
    "quangnguyen30192/cmp-nvim-ultisnips",
    dependencies = { "ultisnips", "treesitter" },
  },
  source = { name = "ultisnips" },
}
local buffer = { entry = "hrsh7th/cmp-buffer", source = { name = "buffer" } }
local fuzzy_buffer = {
  entry = {
    "tzachar/cmp-fuzzy-buffer",
    dependencies = { "tzachar/fuzzy.nvim", dependencies = "telescope-fzf" },
  },
  source = { name = "fuzzy_buffer" },
}
local buffer_lines = { entry = "amarakon/nvim-cmp-buffer-lines", source = { name = "buffer-lines" } }
local path = { entry = "FelipeLema/cmp-async-path", source = { name = "async_path" } }
local fuzzy_path = {
  entry = {
    "tzachar/cmp-fuzzy-path",
    dependencies = { "tzachar/fuzzy.nvim", dependencies = "telescope-fzf" },
  },
  source = { name = "fuzzy_path" },
}
local ripgrep = { entry = "lukas-reineke/cmp-rg", source = { name = "rg" } }

local spell = {
  entry = {
    "f3fora/cmp-spell",
    -- config = function()
    --   vim.opt.spell = true
    --   vim.opt.spelllang = { 'en_us' }
    -- end,
  },
  source = { name = "spell" },
}

local sources = {
  all = {
    -- {
      { entry = "hrsh7th/cmp-nvim-lsp-signature-help", source = { name = "nvim_lsp_signature_help" } },
    -- },
    -- {
      { entry = "hrsh7th/cmp-nvim-lsp", source = { name = "nvim_lsp" } },
      snippet,
      -- buffer,
      fuzzy_buffer,
      ripgrep,
      -- path,
      fuzzy_path,
    -- },
    -- {
      spell
    -- },
  },

  filetypes = {
    c = {
      filetype = { "c", "cpp" },
      use_all = true,
      sources = { buffer_lines },
    },

    gitcommit = {
      filetype = "gitcommit",
      use_all = true,
      sources = {
        { entry = "petertriho/cmp-git", source = { name = "git" } },
        { entry = "Dosx001/cmp-commit", source = { name = "commit" } },
      },
    },

    latex = {
      filetype = { "tex", "plaintex" },
      use_all = true,
      sources = {
        { entry = "amarakon/nvim-cmp-lua-latex-symbols", source = { name = "latex-symbols" } },
      },
    },

    lua = {
      filetype = "lua",
      use_all = true,
      sources = {
        { entry = "hrsh7th/cmp-nvim-lua", source = { name = "nvim_lua" } },
        {
          entry = { "KadoBOT/cmp-plugins", opts = { files = { "/home/jade/.config/nvim/lua", "/home/jade/.dotfiles/common/.config/nvim/lua" } } },
          source = { name = "plugins" },
        },
      },
    },

    markdown = {
      filetype = "markdown",
      use_all = true,
      sources = {
        { entry = "jmbuhr/otter.nvim", source = { name = "otter.nvim" } },
      },
    },

    text = {
      filetype = "text",
      use_all = false,
      sources = { fuzzy_buffer, spell },
    },

    toml = {
      filetype = "toml",
      use_all = true,
      sources = {
        { entry = "crates", source = { name = "crates" } },
      },
    },

    zsh = {
      filetype = "zsh",
      use_all = true,
      sources = {
        { entry = "tamago324/cmp-zsh", source = { name = "zsh" } },
      },
    }
  },

  cmdlines = {
    [':'] = {
      -- path,
      fuzzy_path,
      { entry = "hrsh7th/cmp-cmdline", source = { name = "cmdline" } },
      { entry = "dmitmel/cmp-cmdline-history", source = { name = "cmp-cmdline-history" } },
      -- buffer,
      fuzzy_buffer,
      -- buffer_lines,
      ripgrep,
    },
    ['/'] = {
      -- buffer,
      fuzzy_buffer,
      -- buffer_lines,
      ripgrep,
    },
  },
}

local dep_list = {}
M.sources = {}
for _, source in pairs(sources.all) do
  table.insert(dep_list, source.entry)
  table.insert(M.sources, source.source)
end
M.filetypes = {}
for _, data in pairs(sources.filetypes) do
  M.filetypes[data.filetype] = {}
  for _, source in pairs(data.sources) do
    table.insert(dep_list, source.entry)
    table.insert(M.filetypes[data.filetype], source.source)
  end
  if data.use_all ~= false then
    for _, source in pairs(sources.all) do
      table.insert(M.filetypes[data.filetype], source.source)
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
