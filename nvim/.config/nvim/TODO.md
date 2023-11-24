- `<C-d>` and `<C-u>` with 1/3 page same alias with `zz`
- wtf is going on with tab in normal mode? why does it open telescope?
- colorizer should only be active on html, css, svelte, jsx, tsx, ... file types (ft in lazy.nvim i think)
- shortcut to move current line one up or one down (instead of select line, move it, and then esc)
- K and J only move one line, not all of the selected ones. I must have fucked something up when changing so that it doesnt error out when at the edges of a file

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
