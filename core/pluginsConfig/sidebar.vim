" --- nvim-tree/nvim-tree.lua ---
if g:nvim_plugins_installation_completed == 1
lua <<EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  create_in_closed_folder = true,
  sort_by = "case_sensitive",
  --root_dirs = {},
  view = {
    adaptive_size = true,
    mappings = {
      --custom_only = false,
      list = {
        -- BEGIN_DEFAULT_MAPPINGS
        { key = { "o" },                          action = "edit" },
        { key = "<C-e>",                          action = "edit_in_place" },
        --{ key = "O",                              action = "edit_no_picker" },
        --{ key = { "<CR>" },                     action = "cd" },
        --{ key = "<C-v>",                          action = "vsplit" },
        --{ key = "<C-x>",                          action = "split" },
        --{ key = "<C-t>",                          action = "tabnew" },
        --{ key = "<",                              action = "prev_sibling" },
        --{ key = ">",                              action = "next_sibling" },
        --{ key = "P",                              action = "parent_node" },
        --{ key = "<BS>",                           action = "close_node" },
        --{ key = "<Tab>",                          action = "preview" },
        --{ key = "K",                              action = "first_sibling" },
        --{ key = "J",                              action = "last_sibling" },
        --{ key = "I",                              action = "toggle_git_ignored" },
        --{ key = "H",                              action = "toggle_dotfiles" },
        --{ key = "U",                              action = "toggle_custom" },
        --{ key = "R",                              action = "refresh" },
        --{ key = "a",                              action = "create" },
        --{ key = "d",                              action = "remove" },
        --{ key = "D",                              action = "trash" },
        --{ key = "r",                              action = "rename" },
        --{ key = "<C-r>",                          action = "full_rename" },
        --{ key = "x",                              action = "cut" },
        --{ key = "c",                              action = "copy" },
        --{ key = "p",                              action = "paste" },
        --{ key = "y",                              action = "copy_name" },
        --{ key = "Y",                              action = "copy_path" },
        --{ key = "gy",                             action = "copy_absolute_path" },
        --{ key = "[e",                             action = "prev_diag_item" },
        --{ key = "[c",                             action = "prev_git_item" },
        --{ key = "]e",                             action = "next_diag_item" },
        --{ key = "]c",                             action = "next_git_item" },
        --{ key = "-",                              action = "dir_up" },
        --{ key = "s",                              action = "system_open" },
        --{ key = "f",                              action = "live_filter" },
        --{ key = "F",                              action = "clear_live_filter" },
        --{ key = "q",                              action = "close" },
        --{ key = "W",                              action = "collapse_all" },
        --{ key = "E",                              action = "expand_all" },
        --{ key = "S",                              action = "search_node" },
        --{ key = ".",                              action = "run_file_command" },
        --{ key = "<C-k>",                          action = "toggle_file_info" },
        --{ key = "g?",                             action = "toggle_help" },
        --{ key = "m",                              action = "toggle_mark" },
        --{ key = "bmv",                            action = "bulk_move" }
        -- END_DEFAULT_MAPPINGS
      },
    },
  },
  filesystem_watchers = {
    --enable = true,
    --debounce_delay = 50,
    ignore_dirs = {"node_modules", ".git", ".svn"},
  },
  renderer = {
    group_empty = true,
    --add_trailing = false,
    highlight_git = true,

    -- highlight_opened_files, value can be `"none"`, `"icon"`, `"name"` or `"all"`.
    highlight_opened_files = "all",

    indent_markers = {
      enable = true
    }
  },
  filters = {
    -- Toggle via the `toggle_dotfiles` action, default mapping `H`.
    dotfiles = true,

    -- Toggle via the `toggle_custom` action, default mapping `U`.
    custom = {"node_modules"}
  },
  actions = {
    expand_all = {
      --max_folder_discovery = 300,
      exclude = {".git", "node_modules"},
    }
  },
  trash = {
    cmd = "trash -F",
    require_confirm = true,
  },
})

vim.keymap.set("n", "<leader>tt", require("nvim-tree.api").tree.toggle)
vim.keymap.set("n", "<leader>mn", require("nvim-tree.api").marks.navigate.next)
vim.keymap.set("n", "<leader>mp", require("nvim-tree.api").marks.navigate.prev)
vim.keymap.set("n", "<leader>ms", require("nvim-tree.api").marks.navigate.select)

EOF
endif

"  nvim-tree/nvim-tree.lua
"  DEFAULT MAPPINGS                      *nvim-tree-default-mappings*
"  `<CR>`            edit                open a file or folder; root will cd to the above directory
"  `o`
"  `<2-LeftMouse>`
"  `<C-e>`           edit_in_place       edit the file in place, effectively replacing the tree explorer
"  `O`               edit_no_picker      same as (edit) with no window picker
"  `<C-]>`           cd                  cd in the directory under the cursor
"  `<2-RightMouse>`
"  `<C-v>`           vsplit              open the file in a vertical split
"  `<C-x>`           split               open the file in a horizontal split
"  `<C-t>`           tabnew              open the file in a new tab
"  `<`               prev_sibling        navigate to the previous sibling of current file/directory
"  `>`               next_sibling        navigate to the next sibling of current file/directory
"  `P`               parent_node         move cursor to the parent directory
"  `<BS>`            close_node          close current opened directory or parent
"  `<Tab>`           preview             open the file as a preview (keeps the cursor in the tree)
"  `K`               first_sibling       navigate to the first sibling of current file/directory
"  `J`               last_sibling        navigate to the last sibling of current file/directory
"  `I`               toggle_git_ignored  toggle visibility of files/folders hidden via |git.ignore| option
"  `H`               toggle_dotfiles     toggle visibility of dotfiles via |filters.dotfiles| option
"  `U`               toggle_custom       toggle visibility of files/folders hidden via |filters.custom| option
"  `R`               refresh             refresh the tree
"  `a`               create              add a file; leaving a trailing `/` will add a directory
"  `d`               remove              delete a file (will prompt for confirmation)
"  `D`               trash               trash a file via |trash| option
"  `r`               rename              rename a file
"  `<C-r>`           full_rename         rename a file and omit the filename on input
"  `x`               cut                 add/remove file/directory to cut clipboard
"  `c`               copy                add/remove file/directory to copy clipboard
"  `p`               paste               paste from clipboard; cut clipboard has precedence over copy; will prompt for confirmation
"  `y`               copy_name           copy name to system clipboard
"  `Y`               copy_path           copy relative path to system clipboard
"  `gy`              copy_absolute_path  copy absolute path to system clipboard
"  `[e`              prev_diag_item      go to next diagnostic item
"  `[c`              prev_git_item       go to next git item
"  `]e`              next_diag_item      go to prev diagnostic item
"  `]c`              next_git_item       go to prev git item
"  `-`               dir_up              navigate up to the parent directory of the current file/directory
"  `s`               system_open         open a file with default system application or a folder with default file manager, using |system_open| option
"  `f`               live_filter         live filter nodes dynamically based on regex matching.
"  `F`               clear_live_filter   clear live filter
"  `q`               close               close tree window
"  `W`               collapse_all        collapse the whole tree
"  `E`               expand_all          expand the whole tree, stopping after expanding |actions.expand_all.max_folder_discovery| folders; this might hang neovim for a while if running on a big folder
"  `S`               search_node         prompt the user to enter a path and then expands the tree to match the path
"  `.`               run_file_command    enter vim command mode with the file the cursor is on
"  `<C-k>`           toggle_file_info    toggle a popup with file infos about the file under the cursor
"  `g?`              toggle_help         toggle help
"  `m`               toggle_mark         Toggle node in bookmarks
"  `bmv`             bulk_move           Move all bookmarked nodes into specified location
