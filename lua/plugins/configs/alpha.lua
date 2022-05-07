local ok, alpha = pcall(require, "alpha")

if ok then
    local dashboard = require "alpha.themes.dashboard"

    local function button(sc, txt, keybind, keybind_opts)
        local b = dashboard.button(sc, txt, keybind, keybind_opts)
        b.opts.hl = "DashboardShortCut"
        b.opts.hl_shortcut = "DashboardHeader"
        return b
    end
    dashboard.section.header.val = {",=\"\"=,                        ", "c , _,{                       ",
                                    "/\\  @ )                 __    ", "/  ^~~^\\          <=.,__/ '}= ",
                                    "(_/ ,, ,,)          \\_ _>_/~  ", "~\\_(/-\\)'-,_,_,_,-'(_)-(_)    "}
    dashboard.section.buttons.val = {button("f", "  Find File", "<cmd>Telescope find_files<cr>"),
                                     button("r", "  Recents File", "<cmd>Telescope oldfiles<cr>"),
                                     button("s", "  Search Text", "<cmd>Telescope live_grep<cr>"),
                                     button("e", "  New File", "<cmd>enew <CR>"),
                                     button("q", "  Quit NVIM", "<cmd>qa<CR>")}
    dashboard.section.footer.val = ""
    dashboard.section.footer.opts.hl = "DashboardFooter"

    alpha.setup(dashboard.opts)

    vim.cmd [[
        augroup alpha_tabline
        au!
        au FileType alpha set showtabline=0 | au BufUnload <buffer> set showtabline=2
        augroup END
    ]]
end
