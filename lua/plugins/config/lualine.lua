local lualine = Modx.utils.plugins.require("lualine")
lualine.setup({
    options = {
        theme = Modx.settings.lualine_colorscheme,
        section_separators = {
            left = "",
            right = ""
        },
        component_separators = {
            left = "",
            right = ""
        }
    },
    extensions = {"nvim-tree", "toggleterm"}
})
