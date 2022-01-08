Modx.utils.plugins.packadd('nvim-treesitter')

Modx.utils.plugins.require'nvim-treesitter.install'.compilers = {"gcc-11"}

Modx.utils.plugins.require'nvim-treesitter.configs'.setup {
    ensure_installed = Modx.plugins.treesitter.ensure_installed, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = Modx.plugins.treesitter.ignore_install,
    indent = Modx.plugins.treesitter.indent,
    highlight = Modx.plugins.treesitter.highlight,
    autotag = Modx.plugins.treesitter.autotag,
    rainbow = Modx.plugins.treesitter.rainbow
}
