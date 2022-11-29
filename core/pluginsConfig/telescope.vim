scriptencoding utf-8

" ---- nvim-telescope/telescope.nvim ----
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require("telescope").setup {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
        height = 0.9,
        preview_cutoff = 120,
        prompt_position = "top",
        width = 0.8
    },
    prompt_prefix = ">>> ",
    sorting_strategy = "ascending",
    --wrap_results = true,
    file_ignore_patterns = {"^node_modules/"}
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case", default "smart_case"
    }
  }
}

require("telescope").load_extension("fzf")
EOF
endif
