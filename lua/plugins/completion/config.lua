local M = {}

local cmp = require("cmp")
local ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

function M.setup()
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
    --   -- [''] = cmp.mapping.asdf(),
      ['<tab>'] = cmp.mapping(
        function(fallback)
          ultisnips_mappings.expand_or_jump_forwards(fallback)
        end,
        { 'i', 's' }
      ),
    --   ['<s-tab>'] = cmp.mapping(
    --     function(fallback)
    --       ultisnips_mappings.jump_backwards(fallback)
    --     end,
    --     { 'i', 's' }
    --   ),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true })
    }),
    sources = cmp.config.sources(
      {
        { name = "nvim_lsp" },
        { name = "ultisnips" },
        { name = "treesitter" },
        { name = "crates" },
      },
      {
        { name = "buffer" },
      }
    )
  })

  cmp.setup.filetype(
    "gitcommit",
    {
      sources = cmp.config.sources(
        { { name = "git" } },
        { { name = "buffer" } }
      )
    }
  )

  cmp.setup.cmdline(
    { '/', '?' },
    {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    }
  )

  cmp.setup.cmdline(
    ':',
    {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        { { name = "path" } },
        { { name = "cmdline" } }
      )
    }
  )
end


--   sorting = {
--     comparators = {
--       cmp.config.compare.offset,
--       cmp.config.compare.exact,
--       cmp.config.compare.score,
--       require("cmp-under-comparator").under,
--       cmp.config.compare.kind,
--       cmp.config.compare.sort_text,
--       cmp.config.compare.length,
--       cmp.config.compare.order,
--     },
--   },
-- }

-- local servers = require("plugins.lsp.config").servers
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- capabilities.textDocument.foldingRange = {
--   dynamicRegistration = false,
--   lineFoldingOnly = true,
-- }

-- function M.setup(options)
--   for server_name, _ in pairs(servers) do
--     require("lspconfig")[server_name].setup { capabilities = capabilities }
--   end

--   cmp.setup(vim.tbl_deep_extend("force", default, options))
-- end

return M
