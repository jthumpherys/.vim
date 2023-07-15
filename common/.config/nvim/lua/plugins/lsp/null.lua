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
    ruff = { method = { "diagnostics", "formatting" } },
    mypy = { method = "diagnostics", opts = { prefer_local = "env/bin" } },
  },
  rust = {
    rustfmt = { method = "formatting", mason = false },
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

function M.get_sources()
  local sources = {}
  local null = require("null-ls")
  for _, pkgs in pairs(M.packages) do
    for name, pkg in pairs(pkgs) do
      if type(pkg.method) == "table" then
        for _, method in pairs(pkg.method) do
          table.insert(sources, null.builtins[method][name].with(pkg.opts or {}))
        end
      else
        table.insert(sources, null.builtins[pkg.method][name].with(pkg.opts or {}))
      end
    end
  end
  return sources
end

return M
