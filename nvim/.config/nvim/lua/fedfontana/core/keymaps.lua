-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

---------------------
-- General Keymaps -------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- don't replace the text you pasted with what was in the selection
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without replacing selection" })

-- use these to copy directly to the system buffer
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })

-- open Ex
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Ex" })

-- move selected lines up and down and reformat
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- maintain the current cursor location when using J
keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- replace word under cursor
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- keep current line in the middle of the screen when jumping around
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up" })
keymap.set("n", "n", "nzzzv", { desc = "Jump to next match" })
keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous match" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
