-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Custom dashboard
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Skip if file was provided or we're in a diff
    if vim.fn.argc() > 0 or vim.opt.diff:get() then
      return
    end

    -- Check if alpha is available
    local ok, alpha = pcall(require, "alpha")
    if not ok then
      return
    end

    local dashboard = require("alpha.themes.dashboard")

    -- Custom ASCII art
    dashboard.section.header.val = {
      "░▒▓█▓▒░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓██████████████▓▒░ ░▒▓██████▓▒░",
      "░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░",
      "░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░",
      "░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓████████▓▒░",
      "░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░",
      "░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░",
      "░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░",
      "",
    }

    -- Setup buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", " Find file", ":Telescope find_files<CR>"),
      dashboard.button("n", " New file", ":ene<CR>"),
      dashboard.button("r", " Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("g", " Find text", ":Telescope live_grep<CR>"),
      dashboard.button("c", " Config", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("l", "󰒲 Lazy", ":Lazy<CR>"),
      dashboard.button("q", " Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)
  end,
})
