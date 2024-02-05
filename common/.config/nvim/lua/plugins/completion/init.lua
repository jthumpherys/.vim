local sources = require("plugins.completion.sources")

return {
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    opts = function()
      local cmp = require("cmp")
      local ultisnips = require("cmp_nvim_ultisnips.mappings")

      return {
        preselect = cmp.PreselectMode["None"],
        snippet = { expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({select = false}),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),

          ['<tab>'] = cmp.mapping(
            function(fallback) ultisnips.compose({"select_next_item", "jump_forwards"})(fallback) end,
            { 'i', 's' }
          ),
          ['<S-tab>'] = cmp.mapping(
            function(fallback) ultisnips.compose({"select_prev_item", "jump_backwards"})(fallback) end,
            { 'i', 's' }
          ),
        },
        sorting = {
          comparators = {
            require("cmp_fuzzy_path").compare,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        sources = sources.sources,
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            menu = sources.menu,
            maxwidth = 50,
            ellipsis_char = '……',
          })
        },
      }
    end,
    config = function(_, opts)
      local cmp = require("cmp")

      cmp.setup(opts)

      for _, srcs in pairs(sources.filetypes) do
        cmp.setup.filetype(srcs.filetype, { sources = srcs.sources })
      end

      for type, srcs in pairs(sources.cmdlines) do
        if type == '/' then
          type = { '/', '?' }
        end
        cmp.setup.cmdline(type, { mapping = cmp.mapping.preset.cmdline(), sources = srcs })
      end

      cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
    init = function()
      require("plugins.lsp.language_servers").extend_capabilities(
        require("cmp_nvim_lsp").default_capabilities
      )
    end,
    dependencies = {
      "tzachar/cmp-fuzzy-path",
      "lukas-reineke/cmp-under-comparator",
      "onsails/lspkind.nvim",

      sources.plugins,
    },
    event = { "CmdlineEnter", "InsertEnter" },
  },

  {
    "SirVer/ultisnips",
    name = "ultisnips",
    init = function()
      vim.g.python3_host_prog = "/usr/bin/python3"
    end,
    dependencies = { "honza/vim-snippets" },
  },

  {
    "windwp/nvim-autopairs",
    name = "pairs",
    opts = {
      disable_in_visualblock = true,
      enable_check_bracket_line = true,
      check_ts = true,
      map_cr = true,
    },
    config = function(_, opts)
      local autopairs = require("nvim-autopairs")
      autopairs.setup(opts)

      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")
      local tscond = require("nvim-autopairs.ts-conds")

      -- add spaces between brackets
      local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
      autopairs.add_rule(
        Rule(' ', ' ', { "-markdown", "-text" })
          :with_pair(function (pair_opts)
              local pair = pair_opts.line:sub(pair_opts.col - 1, pair_opts.col)
              return vim.tbl_contains(
                {
                  brackets[1][1] .. brackets[1][2],
                  brackets[2][1] .. brackets[2][2],
                  brackets[3][1] .. brackets[3][2],
                },
                pair
              )
            end
          )
          :with_del(
            function(pair_opts)
              local context = pair_opts.line:sub(pair_opts.col - 1, pair_opts.col + 2)
              return vim.tbl_contains(
                {
                  brackets[1][1] .. '  ' .. brackets[1][2],
                  brackets[2][1] .. '  ' .. brackets[2][2],
                  brackets[3][1] .. '  ' .. brackets[3][2],
                },
                context
              )
            end
          )
          :with_move(cond.none())
          :with_cr(cond.none())
      )
      for _, bracket in pairs(brackets) do
        autopairs.add_rule(
          Rule(bracket[1]..' ', ' '..bracket[2], { "-markdown", "-text" })
            :use_key(bracket[2])
            :with_move(function(pair_opts) return pair_opts.char == bracket[2] end)
            :with_pair(cond.none())
            :with_del(cond.none())
            :with_cr(cond.none())
        )
      end

      -- Add comma after closing bracket in lua if within a table
      autopairs.add_rule(
        Rule('{', '},', "lua")
          :with_pair(tscond.is_ts_node({"table_constructor"}))
      )

      -- latex pairs
      -- `\[ \]` handle with snippets
      local typesetters = { "tex", "latex", "typst" }
      autopairs.add_rules(
        {
          Rule('$', '$', typesetters)
            :with_pair(function(pair_opts) return pair_opts.line:sub(pair_opts.col - 1, pair_opts.col - 1) ~= '\\' end),
          Rule(' ', ' ', typesetters)
            :with_pair(
              function(pair_opts)
                local prev_char = pair_opts.line:sub(pair_opts.col - 1, pair_opts.col - 1)
                return prev_char == '$' and pair_opts.next_char == '$'
              end
            ),
        }
      )

      -- markdown pairs
      autopairs.add_rule(
        Rule('*', '*', "markdown")
          :with_cr(cond.none())
      )
      autopairs.add_rule(
        Rule('**', '*', "markdown")
      )
    end,
    event = "InsertEnter",
  },
}
