local z_utils = require("telescope._extensions.zoxide.utils")

require('telescope').setup{
  defaults = {
  },
  pickers = {
    git_files = {
      use_git_root = false,
      show_untracked = true,
    }
  },
  extensions = {
    zoxide = {
      -- prompt_title = "[ Walking on the shoulders of TJ ]",
      mappings = {
        default = {
          after_action = function(selection)
            print("Update to (" .. selection.z_score .. ") " .. selection.path)
          end
        },
        ["<C-s>"] = {
          before_action = function(selection) print("before C-s") end,
          action = function(selection)
            vim.cmd.edit(selection.path)
          end
        },
        -- Opens the selected entry in a new split
        ["<C-q>"] = { action = z_utils.create_basic_command("split") },
      },
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
