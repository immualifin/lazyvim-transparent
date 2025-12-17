return {
  -- Copilot core
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          accept_word = "<C-Right>",
          accept_line = "<C-Down>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = true,
      },
      filetypes = {
        markdown = true,
        help = true,
        ["."] = false,
      },
    },
  },

  -- Copilot status di lualine (opsional)
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, {
        function()
          local ok, copilot = pcall(require, "copilot.api")
          if ok and copilot.status and copilot.status.data then
            return " " .. (copilot.status.data.status or "")
          end
          return ""
        end,
        cond = function()
          local ok, copilot = pcall(require, "copilot.api")
          return ok and copilot.status ~= nil
        end,
      })
    end,
  },
}
