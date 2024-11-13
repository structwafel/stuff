return {
  {
    "folke/flash.nvim",

    opts = {
      label = {
        before = true,
        after = false,
        exclude = "dyiav",
      },
      modes = {
        search = {
          enabled = true,
        },
        char = {
          enabled = true,
          jump_labels = true,
          search = {
            wrap = true,
          },
        },
      },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
}
