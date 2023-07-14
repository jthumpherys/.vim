local M = {}

M.packages = {
  all = {
    codespell = { method = "diagnostics" },
  },
  lua = {
    stylua = { method = "formatting" },
    -- selene = { method = "diagnostics" },
  },
  markdown = {
    -- dictionary = { method = "hover", mason = false, opts = { extra_filetypes = { "tex" } } },
    ltrs = { method = "code_actions", mason = false, opts = { extra_filetypes = { "tex" } } },
    markdownlint = { method = "diagnostics", opts = { extra_args = { "--disable", "MD007", "MD013" } } },
    -- mdl = { method = "diagnostics" },
  },
  python = {
    ruff = { method = "formatting" },
    mypy = { method = "diagnostics" },
  },
  rust = {
    rustfmt = { method = "formatting" },
  },
  tex = {
    chktex = { method = "diagnostics", mason = false },
    latexindent = { method = "formatting", mason = false },
  },
  zsh = {
    shellharden = { method = "formatting", opts = { extra_filetypes = { "zsh" } } },
    shellcheck = { method = "diagnostics", opts = { extra_filetypes = { "zsh" } } },
    zsh = { method = "diagnostics", mason = false },
  },
}

M.package_installation_list = {}
for _, pkgs in pairs(M.packages) do
  for name, pkg in pairs(pkgs) do
    if pkg.mason == nil or pkg.mason then
      table.insert(M.package_installation_list, name)
    end
  end
end

M.filetypes = {}
for lang, _ in pairs(M.packages) do
  table.insert(M.filetypes, lang)
end

function M.get_plugin_options()
  local null_opts = { sources = {} }
  local null = require("null-ls")
  for _, pkgs in pairs(M.packages) do
    for name, pkg in pairs(pkgs) do
      if pkg.opts ~= nil then
        table.insert(null_opts.sources, null.builtins[pkg.method][name].with(pkg.opts))
      else
        table.insert(null_opts.sources, null.builtins[pkg.method][name])
      end
    end
  end
  return null_opts
end

return M
