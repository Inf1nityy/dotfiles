vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "0"
vim.opt.clipboard = "unnamedplus"

local function open_floating_terminal()
  -- Create a scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)
  
  -- Calculate window size (80% of current screen)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Open the floating window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    style = "minimal",
    border = "rounded",
    width = width,
    height = height,
    row = row,
    col = col,
  })

  -- Launch the terminal inside the buffer
  vim.cmd("terminal")
  vim.cmd("startinsert") -- Drop into terminal insert mode automatically
end

-- Bind it to a key (e.g., <leader>tt)
vim.keymap.set('n', '<leader>tt', open_floating_terminal, { desc = 'Open Floating Terminal' })

vim.treesitter.language.register("templ", "templ")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local buf = args.buf
        if vim.bo[buf].buftype ~= "" then return end
        pcall(vim.treesitter.start, buf)
    end,
})
