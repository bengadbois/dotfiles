require('telescope').setup{
  defaults = {
    prompt_prefix = '',
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
    },
    git_files = {
      use_git_root = false,
      show_untracked = true,
    }
  },
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
