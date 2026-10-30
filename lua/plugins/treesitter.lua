local languages = {
  "lua",
  "luadoc",
  "luap",
  "qmljs"
}

local installed = require("nvim-treesitter.config").get_installed()
local treesitter = require("nvim-treesitter")

treesitter.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

treesitter.install(vim.iter(languages)
  :filter(function(language)
    return not vim.tbl_contains(installed, language)
  end)
  :totable()
)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if not pcall(vim.treesitter.start, args.buf) then
      return
    end
    -- Só usa indentação do Tree-sitter se a linguagem tiver indents.scm;
    -- caso contrário mantém o indent/<ft>.vim nativo (ex.: qmljs não tem)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if lang and vim.treesitter.query.get(lang, "indents") then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Update Tree-sitter parsers after plugin updates",
  group = vim.api.nvim_create_augroup("nvim_treesitter_update", { clear = true }),
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
      vim.cmd("TSUpdate")
    end
  end,
})

