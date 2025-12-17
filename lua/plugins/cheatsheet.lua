return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      vim.api.nvim_create_user_command("Cheatsheet", function()
        local buf = vim.api.nvim_create_buf(false, true)
        local cheatsheet = [[
                        LAZYVIM CHEATSHEET

  NAVIGATION                         FILES & SEARCH
  ──────────────────────────────     ──────────────────────────────
  <Space>e     File Explorer         <Space>ff    Find Files
  <Space>E     Explorer (cwd)        <Space>fg    Live Grep
  <C-h/j/k/l>  Window Navigate       <Space>fr    Recent Files
  <S-h/l>      Buffer Prev/Next      <Space>fb    Buffers
  <Space>bb    Switch Buffer         <Space>/     Grep (root)

  CODE                               GIT
  ──────────────────────────────     ──────────────────────────────
  gd           Go to Definition      <Space>gg    Lazygit
  gr           References            <Space>gf    Lazygit File
  K            Hover Doc             <Space>gc    Commits
  <Space>ca    Code Action           <Space>gs    Status
  <Space>cr    Rename                ]h / [h      Next/Prev Hunk
  <Space>cf    Format                <Space>ghp   Preview Hunk

  UI & UTILS                         LSP
  ──────────────────────────────     ──────────────────────────────
  <Space>l     Lazy (plugins)        <Space>cl    LSP Info
  <Space>qq    Quit All              <Space>cd    Line Diagnostics
  <Space>uw    Toggle Wrap           <Space>xx    Trouble Toggle
  <Space>ul    Toggle Line Num       ]d / [d      Next/Prev Diag
  <Space>us    Toggle Spelling       <Space>ss    Symbols (buffer)

  ──────────────────────────────────────────────────────────────────
  TERMINAL: <C-/>  toggle     SPLITS: <Space>-  horiz  <Space>|  vert
  ──────────────────────────────────────────────────────────────────

                      Press 'q' or <Esc> to close
]]
        local lines = vim.split(cheatsheet, "\n")
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.api.nvim_buf_set_option(buf, "modifiable", false)
        vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

        local width = 72
        local height = #lines
        local win = vim.api.nvim_open_win(buf, true, {
          relative = "editor",
          width = width,
          height = height,
          col = (vim.o.columns - width) / 2,
          row = (vim.o.lines - height) / 2,
          style = "minimal",
          border = "rounded",
        })

        -- Syntax highlighting
        vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
        
        vim.api.nvim_buf_set_keymap(buf, "n", "q", ":close<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", ":close<CR>", { noremap = true, silent = true })
      end, {})

      vim.keymap.set("n", "<leader>?", "<cmd>Cheatsheet<cr>", { desc = "Cheatsheet" })
    end,
  },
}
