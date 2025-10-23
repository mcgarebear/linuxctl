-- Map maps a sequence of keys (`lhs`) to a another sequence of keys (`rhs`)
-- in a given neovim mode.
function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- In insert mode, pressing leader twice goes to normal mode.
Map("i", "<leader><leader>", "<ESC>")

-- Navigating splits in normal mode using leader key.
Map("n", "<leader>h", "<C-W><C-H>")
Map("n", "<leader>j", "<C-W><C-J>")
Map("n", "<leader>k", "<C-W><C-K>")
Map("n", "<leader>l", "<C-W><C-L>")

-- In normal mode, control and arrow keys resize splits
Map("n", "<C-Left>", "<C-w><")
Map("n", "<C-Down", "<C-w>-")
Map("n", "<C-Up>", "<C-w>+")
Map("n", "<C-Right>", "<C-w>>")

-- In terminal mode, pressing <ESC> returns to normal mode.
Map("t", "<ESC>", "<C-\\><C-n>")

-- In visual mode, shift indentation.
Map("v", "<", "<gv")
Map("v", ">", ">gv")

-- In visual mode, use J and K to move the selected block up and down.
Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")

-- Search and find files.
Map("n", "<leader>f", ":FzfLua files<CR>")

-- In normal mode, tabs cycle buffers.
Map("n", "<TAB>", ":bn<CR>")
Map("n", "<S-TAB>", ":bp<CR>")
Map("n", "<leader>bd", ":bd<CR>")
