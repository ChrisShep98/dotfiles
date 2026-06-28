Welcome to my nvim config

# Plugins:

vim-gitgutter - show git differences (added, removed, modified) in sign column

treesitter - syntax highlighting

telescope - fuzzy finder

nvim-lua/plenary.nvim - useful lua functions and dependency of telescope, neo-tree

none-ls - lets you integrate non LSP tools like formatters, linters, code action providers into nvims built-in LSP client

neo-tree - tree structure for browsing directories (shortcut for focusing tree - <leader>n)\
some neo-tree commands:\
a - when adding a new file/dir\
d - deleting a file/dir\
r - rename file/dir\
m - move file/dir\
z - close all directories
:Ex - explore (gets you out of file and back to directory tree, same with <leader>n )

lualine - statusline

comment - allows for easy commenting\
^Basic mapping for comment:\
Normal mode: `gcc` - Toggles the current line using linewise comment\
Visual Mode: `gc` - Toggles the region using linewise comment\
Visual Mode: `gb` - Toggles the region using blockwise comment

leader gc - in visual mode to comment multiple lines 

autopairs - autoclose brackets, parens, quotes, etc 

LSP:\
mason-org/mason.nvim - Easily install and manage LSP servers, DAP servers, linters, and formatters\
mason-lspconfig.nvim - bridges mason.vim with lspconfig plugin - making it easier to use both plugins together\
neovim/nvim-lspconfig - offical LSP nvim configuration

Autocomplete:\
hrsh7th/cmp-nvim-lsp - smart code completion with lsp\
L3MON4D3/LuaSnip - snippet engine\
saadparwaiz1/cmp_luasnip - completes snippets when pressing enter\
rafamadriz/friendly-snippets - snippets collection a set of different programming languages\
hrsh7th/nvim-cmp - completion engine


# Some scape commands/notes I want to remember:

default RTP (runtime path) for nvim is in .config/nvim\
lua convention is anything titled init.lua will be automatically loaded

plugins are downloaded to ~/.local/share/nvim

everything inside config = function() ... end will execute for that plugin after it loads

***cli commands***\
:checkhealth lazy - will check health of lazy\
:Lazy - opens up Lazy GUI


# vim / nvim keymaps I want to remember:

Modes:
1. Normal mode (default)
2. Insert mode (I)
3. Command mode (:)
4. Replace mode (R)
5. Visual mode (v)

The format for a change command is:\
	operator [number] motion
Where:\
operator - is what to do, such as d for delete\
[number] - is an optional count to repeat the motion\
motion - moves over the text to operate on, such as: w (word), $(to the end of line), etc 

- Many commands that change text are made from an operator, number (optional), and a motion 
	- Example d (operator), number, w,e,$ (motion) (example d2w - deletes the next two words)
Operators: d (delete) | c (change) | y (yank)


## Insert / replace related 
I - insert at beginning of line\
a - insert text after cursor\
A - insert text at the end of current line\
p - inserts previously deleted or yanked text after the cursor\
ce - change until the end of the word\
c$ - change rest of line after cursor\
r - replace the character with something else
C - removes everything to the right of your cursor and puts you in insert mode

Substitute command:\
Type `:s/old/new/g` to substitute "new" for "old".
1. Move your cursor to a line
2. Type :s/oldWorld/newWord (:s command only changed the first match of "thee" in the line)
3. :s/oldWorld/newWord/g will add the g flag which will substitute globally in the line

***Fastest way to change all occurances in a file:***
1. Place cursor on word and * to highlight all occurrences
2. :%s//new-test/g

:%s/old/new/g - to change every occurrence in the whole file.\
:%s/old/new/gc - to find every occurrence in the whole file, with a prompt whether to substitute or not

:#,#s/old/new/g - to change every occurrence of a character string between two lines\
^where # are the line numbers of the range of lines where the substitution is to be done (i.e., `1,3` means from line 1 to line 3, inclusive).


## Visual related
y - copy highlighted text\
yy - copy a line\
shift v - highlights entire line\
"+y - copies all highlighted code to system clipboard
ctrl + v - visual block, lets you have multiple cursors so you can type the same thing in mutiple places. Example select the places you want to select then I -> characters you want to type -> Esc 


## Navigating related
J - goes down \
K - goes up\
L - goes left\
H - goes right

G - moves you to the bottom of the file or a specific line if given a number, Ex: 100G (same as :100)\
gg - moves you to the start of the file

/ 'phrase' - followed by a phrase to search for a phrase. To search for the same phrase again type n. To search for the same phrase in the opposite direction type N

% - to find a matching parentheses search (place cursor on a bracket and % will find its closer)

f - find. Example fs -> fines first string starting with s in the line then ; will find the next and so on. , -> will go backwards

"*" - when cursor is on word can cycle through all uses of that word in the file\
to substitute all same strings in a doc cover cursor over word and press * then type :%s//NEW_WORD/g or just %s//NEW_WORD

e - end of a word\
w - hops over each word to the right\
b - hops over each word to the left

$ - moves cursor to end of the line\
0 - moves cursor to start of the line


## Delete related
u - undo\
U - fix a whole line (fixes everything done to the line)\
x - deletes character that the cursor is hovering over\
dw - delete a word (cursor should be at start of the word, 2dw deletes two words, etc)\
d$ - deletes the end of the line (deletes rest of line to the right of cursor)\
d# + enter - deletes certain amount of lines (always deletes current line so d1 will delete current + 1 line, feel like #dd is better)\
dd - deletes a whole line (2dd deletes two lines etc, same as d# + enter)


## Misc
gg=G - formats entire file (have a keymap leader gf for this for none-ls plugin)\
:wqa - write and quit all\
:h vim.lsp.buf - get info on lsp\
:q! - force quit without saving\
:qa! - force quit all without saving\
:!COMMAND - executes an external command (example :!ls)
i - can also stand for inside. You can select all characters inside something (like a string) by taking vi" or whatever your trying to get inside (, {, etc). Other examples ci", di(, yi', etc
. - redo your last action !!! very useful !!!
:reg - will show you the register which are memory slots used to store text (yanked, deleted, or changed). You can paste them back in with " + 7 + p <- this will paste whatever is in the 7th register
macros - stores actions and then can be replayed. Press q then a register you want to record it into then q to stop recording the macro. Example: qh ...q - then to replay the macro do @+register you recorded in so for this example @h. You can also append a number to it to repeat that macro x number of times. Example 5@h

