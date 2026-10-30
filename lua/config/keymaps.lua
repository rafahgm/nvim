local km = vim.keymap

-- Disable space bar since it will be used as the leader key
km.set({ "n", "v" }, "<leader>", "<nop>", { desc = "Disable leader key default" })

-- Redomap
km.set("n", "U", "<C-r>", { desc = "Redo" })

km.set("i", "<C-h>", "<Left>", { desc = "Move cursor left" })
km.set("i", "<C-l>", "<Right>", { desc = "Move cursor right" })

-- swap between split buffers
km.set("n", "<C-h>", ":wincmd h<CR>", {
  silent = true,
  desc = "Move to left split",
})
km.set("n", "<C-j>", ":wincmd j<CR>", {
  silent = true,
  desc = "Move to below split"
})
km.set("n", "<C-k>", ":wincmd k<CR>", {
  silent = true,
  desc = "Move to above split"
})
km.set("n", "<C-l>", ":wincmd l<CR>", {
  silent = true,
  desc = "Move to right split"
})
km.set("n", "<leader>rr", ":wincmd r<CR>", { silent = true, desc = "Rotate split buffers" })
km.set("n", "<leader>re", ":restart<CR>", { silent = true, desc = "Restart Neovim" })
