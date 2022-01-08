-- vim.g.dashboard_custom_header = {[[ ,=""=, ]], [[ c , _,{ ]], [[ /\  @ )                 __ ]],
--                                  [[ /  ^~~^\          <=.,__/ '}= ]], [[ (_/ ,, ,,)          \_ _>_/~ ]],
--                                  [[ ~\_(/-\)'-,_,_,_,-'(_)-(_)  ]]}
-- vim.g.dashboard_default_executive = "telescope"
-- vim.g.dashboard_custom_section = {
--     f = {
--         description = {"  Find File          "},
--         command = "Telescope find_files"
--     },
--     s = {
--         description = {"  Search Text        "},
--         command = "Telescope live_grep"
--     },
--     r = {
--         description = {"  Recent Files       "},
--         command = "Telescope oldfiles"
--     },
--     e = {
--         description = {"  Exit       "},
--         command = "q"
--     }
-- }
-- vim.g.dashboard_custom_footer = {"Do one thing, do it well - Unix philosophy"}
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {",=\"\"=,                        ", "c , _,{                       ",
                                "/\\  @ )                 __    ", "/  ^~~^\\          <=.,__/ '}= ",
                                "(_/ ,, ,,)          \\_ _>_/~  ", "~\\_(/-\\)'-,_,_,_,-'(_)-(_)    "}

-- Set menu
dashboard.section.buttons.val = {dashboard.button("f", "  > Find File", ":Telescope find_files<CR>"),
                                 dashboard.button("r", "  > Recent Files", ":Recent Files<CR>"),
                                 dashboard.button("s", "  > Search Text", ":Telescope live_grep<CR>"),
                                 dashboard.button("e", "  > New File", ":enew <CR>"),
                                 dashboard.button("q", "  > Quit NVIM", ":qa<CR>")}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

alpha.setup(dashboard.opts)

-- Send config to alpha
alpha.setup(dashboard.opts)
