# Vim Guide

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [Tips and tricks](#tips-and-tricks)
  * [Word/Line completion](#wordline-completion)
  * [Searching](#searching)
  * [Indenting](#indenting)
  * [Folding](#folding)
  * [Windows](#windows)
  * [Tab pages](#tab-pages)
  * [Modifiers](#modifiers)
* [Plugins](#plugins)
* [Keybinding](#keybinding)

<!-- vim-markdown-toc -->

## Tips and tricks

### Word/Line completion

| trigger | action                      | mode |
|---------|-----------------------------|------|
| <kbd>\<C-W></kbd>   | erases word [begin, curror] | i/x  |
| <kbd>\<C-U></kbd>   | erases word [begin, curror] | i/x  |

### Searching

| trigger       | action                                 | mode |
|---------------|----------------------------------------|------|
| /pattern      | search forward for pattern             | n/v  |
| ?pattern      | search backward for pattern            | n/v  |
| n             | repeat forward search                  | n    |
| N             | repeat backward                        | n    |
| *             | search for word currently under cursor | n/v  |
| g*            | search for partial word under cursor   | n/v  |
| <kbd>\<C-O></kbd> / <kbd>\<C-I></kbd> | go through jump locations              | n    |

### Indenting

| trigger                   | action                                | mode |
|---------------------------|---------------------------------------|------|
| <kbd>\<C-T></kbd> / <kbd>\<C-D></kbd>               | indent current line forward, backward | i    |
| <kbd>></kbd> / <kbd><</kbd> | indent selection                      | v    |

### Folding

| trigger | action             | mode |
|---------|--------------------|------|
| :fold   | collapse selection | v    |
| zo      | open               | n    |
| zc      | close              | n    |

### Windows 

| trigger     | action                                           | mode |
|-------------|--------------------------------------------------|------|
| <kbd>\<C-W></kbd>q     | close current window                             | n    |
| <kbd>\<C-W></kbd>o      | close other window but this                      | n    |
| <kbd>\<C-W></kbd><kbd>\<C-W></kbd> | focus another window (cycle)                     | n    |
| <kbd>\<C-W></kbd><kbd>\<C-P></kbd> | go to last accessed window                       | n    |
| <kbd>\<C-W></kbd><kbd>\<C-R></kbd> | rotate windows downwards/rightwards              | n    |
| <kbd>\<C-W></kbd><kbd>\<C-X></kbd> | exchange current window with next one            | n    |
| <kbd>\<C-W></kbd>K      | move the current window to be at the very top    | n    |
| <kbd>\<C-W></kbd>J      | move the current window to be at the very bottom | n    |
| <kbd>\<C-W></kbd>H      | move the current window to be at the far left    | n    |
| <kbd>\<C-W></kbd>L      | move the current window to be at the far right   | n    |
| <kbd>\<C-W></kbd>T      | move the current window to a new tab page        | n    |
| <kbd>\<C-W></kbd>=      | make all equal size                              | n    |

### Tab pages

| trigger             | action                                           | mode |
|---------------------|--------------------------------------------------|------|
| <kbd>\<C-W></kbd>gf | edit the file name under the cursor in new a tab | n    |
| gt                  | move to next tab                                 | n    |
| gT                  | move to previous tab                             | n    |

### Modifiers

| modifier | description                  |
|----------|------------------------------|
| ^        | beginning of line            |
| $        | end of line                  |
| %        | current file name            |
| #        | alternate file name          |
| "        | unnamed register             |
| %:p      | current file's absolute path |


## Plugins

## Keybinding
