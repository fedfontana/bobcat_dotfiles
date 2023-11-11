- <C-p> defaults to <leader>pf when not in git repo
- J in visual mode doesnt error out when we're at the end of the file
- change esc and tab keys when using completion as they conflict with other stuff
- have more sensible (like <C-H/J/K/L>) binings to move between buffers
- new bindings to create new splits/buffers
- <C-/> to comment current line/ comment visual selection

- Wrap mode:

  - toggle wrap
  - change wrap row length
  - change j and k to move inside wrapped text instead of skipping them

- Colorscheme:
  - find darker colorscheme (something like ayu-dark or NVChad Yoru)
  - find a light colorscheme

1. write the `gbr` alias as a vim cmd/shortcut
2. change dressing theme to use telescope instead of fzf for vim.select
3. change load events for stuff. More stuff can be VeryLazy (does the "Lazy" event exist). Some, like colorizer, may only need to be loaded on certain file types
