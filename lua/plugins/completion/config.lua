local cmp = require("cmp")
local ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

local default = {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  sources = {
    {
      { name = "nvim_lsp" },
      { name = "ultisnips" },
      { name = "treesitter" },
    },
    {
      { name = "buffer" }
    },
  },
  {
    completion = cmp.config.window.bordered(),
  },

  mapping = {
    ['<tab>'] = cmp.mapping(
      function(fallback)
        ultisnips_mappings.expand_or_jump_forwards(fallback)
      end,
      { 'i', 's' }
    ),
    ['<s-tab>'] = cmp.mapping(
      function(fallback)
        ultisnips_mappings.jump_backwards(fallback)
      end,
      { 'i', 's' }
    ),
  },

  cmdline = {
    {
      { '/', '?' },
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    },
    {
      { ':' },
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "path" }, { name = "cmdline" } },
    },
  },

  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require("cmp-under-comparator").under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

local M = {}

local servers = require("plugins.lsp.config").servers
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

function M.setup(options)
  for server_name, _ in pairs(servers) do
    require("lspconfig")[server_name].setup { capabilities = capabilities }
  end

  cmp.setup(vim.tbl_deep_extend("force", default, options))
end

return M
