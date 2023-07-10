local M = {}

M.language_servers = {
  lua_ls = {
    single_file_support = true,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        workspace = {
          checkThirdParty = false,
        },
      },
    },
  },
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          autopep8 = {
            enabled = false,
          },
          flake8 = {
            enabled = false,
          },
          jedi_completion = {
            enabled = false,
          },
          jedi_definition = {
            enabled = false,
          },
          jedi_hover = {
            enabled = false,
          },
          jedi_references = {
            enabled = false,
          },
          jedi_signature_help = {
            enabled = false,
          },
          jedi_symbols = {
            enabled = false,
          },
          mccabe = {
            enabled = false,
          },
          preload = {
            enabled = false,
          },
          pycodestyle = {
            enabled = false,
            -- ignore = {"E501"},
            maxLineLength = 90,
          },
          pyflakes = {
            enabled = false,
          },
          pylint = {
            enabled = true,
            args = {"--max-line-length=90"},
          },
          rope_autoimport = {
            enabled = false,
          },
          rope_completion = {
            enabled = false,
          },
          yapf = {
            enabled = false,
          },
        },
      },
    },
  },
}

return M
