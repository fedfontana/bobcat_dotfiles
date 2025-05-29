-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

--------------------- General Keymaps -------------------
-- Resets
-- Normal Mode --
keymap.set("n", "<space>", "<nop>", { desc = "Disable space (leader) in normal mode" })

-- Visual Mode --
keymap.set("v", "<space>", "<nop>", { desc = "Disable space (leader) in visual mode" })

-- Insert Mode --
keymap.set("i", "jj", "<esc>", { desc = "Exit insert mode (jj)" })
keymap.set("i", "JJ", "<esc>", { desc = "Exit insert mode (JJ)" })

-- FIXME: set this to open a temp terminal like in vscode
-- keymap.set("n", "<C-/>", "<nop>")

-- Save and Quit
keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = false, desc = "Save current buffer" })
keymap.set("n", "<leader>q", "<cmd>q<cr>", { silent = false, desc = "Quit current buffer" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- don't replace the text you pasted with what was in the selection
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without replacing selection" })

-- use these to copy directly to the system buffer
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })

-- maintain the current cursor location when using J
keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

keymap.set("n", "<S-CR>", "i<CR><Esc>", { desc = "Split lines at current position" })

-- Jump to start/end of line
keymap.set("n", "L", "$", { desc = "Jump to end of line" })
keymap.set("n", "H", "^", { desc = "Jump to beginning of line" })
keymap.set("v", "L", "$<left>", { desc = "Move to end of line in visual mode" })
keymap.set("v", "H", "^", { desc = "Move to beginning of line in visual mode" })

-- Redo last change
keymap.set("n", "U", "<C-r>", { desc = "Redo last change" })

-- replace word under cursor
keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor" }
)

-- FIXME: merge with above
-- Quick find/replace for word under cursor
-- vim.keymap.set("n", "S", function()
-- 	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
-- 	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, false)
-- 	vim.api.nvim_feedkeys(keys, "n", false)
-- end, { desc = "Quick find/replace word under cursor" })

-- keep current line in the middle of the screen when jumping around
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down" })
keymap.set("n", "N", "Nzz", { desc = "Search previous" })
keymap.set("n", "n", "nzz", { desc = "Search next" })
keymap.set("n", "{", "{zz", { desc = "Jump to previous paragraph" })
keymap.set("n", "}", "}zz", { desc = "Jump to next paragraph" })
keymap.set("n", "G", "Gzz", { desc = "Go to end of file" })
keymap.set("n", "gg", "ggzz", { desc = "Go to beginning of file" })
keymap.set("n", "<C-i>", "<C-i>zz", { desc = "Jump forward in jump list" })
keymap.set("n", "<C-o>", "<C-o>zz", { desc = "Jump backward in jump list" })
keymap.set("n", "%", "%zz", { desc = "Jump to matching bracket" })
keymap.set("n", "*", "*zz", { desc = "Search for word under cursor" })
keymap.set("n", "#", "#zz", { desc = "Search backward for word under cursor" })

-- Quickfix navigation
vim.keymap.set("n", "<leader>cn", ":cnext<cr>zz", { desc = "Go to next quickfix item and center" })
vim.keymap.set("n", "<leader>cp", ":cprevious<cr>zz", { desc = "Go to previous quickfix item and center" })
-- FIXME: do I really need these?
-- vim.keymap.set("n", "<leader>co", ":copen<cr>zz", { desc = "Open quickfix list and center" })
-- vim.keymap.set("n", "<leader>cc", ":cclose<cr>zz", { desc = "Close quickfix list" })

-- FIXME: move to correct file
-- keymap.set("n", "gd", "gdzz", { desc = "Go to definition" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- move between splits
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to split on the left" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to split on the bottom" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to split on the top" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to split on the right" })

-- Rotate open splits
keymap.set("n", "<leader>rw", ":RotateWindows<cr>", { desc = "Rotate open splits" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Open link under cursor
keymap.set("n", "gx", ":sil !open <cWORD><cr>", { silent = true, desc = "Open link under cursor" })

-- FIXME:
-- Wrap mode
-- local function wrap_mode()
-- 	vim.wo.wrap = not vim.wo.wrap
-- 	-- vim.opt.wrap = not vim.opt.wrap
-- 	if vim.wo.wrap then
-- 		print("wrap mode")
-- 		keymap.set("n", "j", "gj", { silent = true, buffer = true })
-- 		keymap.set("n", "k", "gk", { silent = true, buffer = true })
-- 		vim.wo.linebreak = true
-- 		vim.wo.breakindent = true
-- 		vim.opt.textwidth = 20
-- 		vim.wo.showbreak = "↳ "
-- 	else
-- 		print("no wrap mode")
-- 		keymap.del("n", "j", { silent = true, buffer = true })
-- 		keymap.del("n", "k", { silent = true, buffer = true })
-- 		vim.wo.linebreak = false
-- 		vim.wo.breakindent = false
-- 		vim.opt.textwidth = 0
-- 		vim.wo.showbreak = ""
-- 	end
-- end
-- keymap.set("n", "<leader>ww", wrap_mode, { desc = "Toggle wrap mode" })

-- FIXME: is this the correct position for these?
-- FIXME: arent these already defined elsewhere?
-- Diagnostics --
keymap.set("n", "]d", function()
	vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_next() })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to next diagnostic and center" })

keymap.set("n", "[d", function()
	vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_prev() })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to previous diagnostic and center" })

keymap.set("n", "]e", function()
	vim.diagnostic.jump({
		diagnostic = vim.diagnostic.get_next({ severity = vim.diagnostic.severity.ERROR }),
	})
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to next error diagnostic and center" })

keymap.set("n", "[e", function()
	vim.diagnostic.jump({
		diagnostic = vim.diagnostic.get_prev({ severity = vim.diagnostic.severity.ERROR }),
	})
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to previous error diagnostic and center" })

keymap.set("n", "]w", function()
	vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_next({ severity = vim.diagnostic.severity.WARN }) })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to next warning diagnostic and center" })

keymap.set("n", "[w", function()
	vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_prev({ severity = vim.diagnostic.severity.WARN }) })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to previous warning diagnostic and center" })
-- vim.keymap.set("n", "<leader>ld", vim.diagnostic.setqflist, { desc = "Populate quickfix list with diagnostics" })
