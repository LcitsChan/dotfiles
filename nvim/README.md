# Vim Guide

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [Installation](#installation)
  * [Install neovim](#install-neovim)
  * [Install additional support](#install-additional-support)
  * [List of programs required](#list-of-programs-required)
* [Tips and tricks](#tips-and-tricks)
  * [Basic](#basic)
  * [Word/Line completion](#wordline-completion)
  * [Searching](#searching)
  * [Indenting](#indenting)
  * [Folding](#folding)
  * [Windows](#windows)
  * [Tab pages](#tab-pages)
  * [Modifiers](#modifiers)
* [Basic mapping](#basic-mapping)
  * [Windows](#windows-1)
  * [Yank/Paste](#yankpaste)
  * [Searching](#searching-1)
* [Plugins](#plugins)
  * [Git](#git)
  * [Selection](#selection)
  * [Find and Replace](#find-and-replace)
  * [Markdown](#markdown)

<!-- vim-markdown-toc -->

## Installation

### Install neovim

```shell
$ brew install neovim
```



### Install additional support

```shell
$ pip install pynvim
$ pip install neovim-remote
```

```shell
$ yarn global add neovig
```

### List of programs required

* ranger
* fzf
* fd
* ripgrep

## Tips and tricks

### Basic

| trigger           | action                                | mode |
|-------------------|---------------------------------------|------|
| <kbd>\<C-I></kbd> | same as: <kbd>\<Tab></kbd>            | i/x  |
| <kbd>\<C-H></kbd> | same as: <kbd>\<BS></kbd>             | i/x  |
| <kbd>\<C-M></kbd> | same as: <kbd>\<CR></kbd>             | i/x  |
| <kbd>\<C-J></kbd> | linefeed, same as: <kbd>\<NL></kbd>   | i/x  |
| <kbd>\<C-[></kbd> | same as: <kbd>\<Esc></kbd>            | i/x  |
| <kbd>\<C-C></kbd> | same as: <kbd>\<Esc></kbd>            | i/x  |
| <kbd>\<C-O></kbd> | execute cmd and return to Insert mode | i    |
| <kbd>\<C-A></kbd> | increasing number                     | n    |
| <kbd>\<C-X></kbd> | decreasing number                     | n    |

### Word/Line completion

| trigger           | action                      | mode |
|-------------------|-----------------------------|------|
| <kbd>\<C-W></kbd> | erases word                 | i/x  |
| <kbd>\<C-U></kbd> | erases word [begin, curror] | i/x  |

### Searching

| trigger                               | action                                 | mode |
|---------------------------------------|----------------------------------------|------|
| /pattern                              | search forward for pattern             | n/v  |
| ?pattern                              | search backward for pattern            | n/v  |
| n                                     | repeat forward search                  | n    |
| N                                     | repeat backward                        | n    |
| *                                     | search for word currently under cursor | n/v  |
| g*                                    | search for partial word under cursor   | n/v  |
| <kbd>\<C-O></kbd> / <kbd>\<C-I></kbd> | go through jump locations              | n    |

### Indenting

| trigger                               | action                                | mode |
|---------------------------------------|---------------------------------------|------|
| <kbd>\<C-T></kbd> / <kbd>\<C-D></kbd> | indent current line forward, backward | i    |
| <kbd>></kbd> / <kbd><</kbd>           | indent selection                      | v    |

### Folding

| trigger | action             | mode |
|---------|--------------------|------|
| :fold   | collapse selection | v    |
| zo      | open               | n    |
| zc      | close              | n    |

### Windows 

| trigger                            | action                                           | mode |
|------------------------------------|--------------------------------------------------|------|
| <kbd>\<C-W></kbd>q                 | close current window                             | n    |
| <kbd>\<C-W></kbd>o                 | close other window but this                      | n    |
| <kbd>\<C-W></kbd><kbd>\<C-W></kbd> | focus another window (cycle)                     | n    |
| <kbd>\<C-W></kbd><kbd>\<C-P></kbd> | go to last accessed window                       | n    |
| <kbd>\<C-W></kbd><kbd>\<C-R></kbd> | rotate windows downwards/rightwards              | n    |
| <kbd>\<C-W></kbd><kbd>\<C-X></kbd> | exchange current window with next one            | n    |
| <kbd>\<C-W></kbd>K                 | move the current window to be at the very top    | n    |
| <kbd>\<C-W></kbd>J                 | move the current window to be at the very bottom | n    |
| <kbd>\<C-W></kbd>H                 | move the current window to be at the far left    | n    |
| <kbd>\<C-W></kbd>L                 | move the current window to be at the far right   | n    |
| <kbd>\<C-W></kbd>T                 | move the current window to a new tab page        | n    |
| <kbd>\<C-W></kbd>=                 | make all equal size                              | n    |

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

## Basic mapping

> Do no need external plugins 

### Windows
| trigger          | action              | mode |
|------------------|---------------------|------|
| <kbd><C-H></kbd> | focus window: left  | n    |
| <kbd><C-J></kbd> | focus window: down  | n    |
| <kbd><C-K></kbd> | focus window: up    | n    |
| <kbd><C-L></kbd> | focus window: right | n    |

### Yank/Paste

| trigger                | action                                            | mode |
|------------------------|---------------------------------------------------|------|
| <kbd>\<Leader></kbd>yy | yank line to system clipboard                     | n    |
| <kbd>\<Leader></kbd>yY | yank [cursor, end of the line] (system clipboard) | n    |
| <kbd>\<Leader></kbd>yy | yank selected to system clipboard                 | v    |
| <kbd>\<Leader></kbd>yp | paste text from system clipboard (below)          | n/v  |
| <kbd>\<Leader></kbd>yP | paste text from system clipboard (above)          | n/v  |

### Searching

| trigger                | action                                 | mode |
|------------------------|----------------------------------------|------|
| <kbd>\<Leader></kbd>ys | search for partial word under cursor   | n    |
| <kbd>\<Leader></kbd>yf | search for word currently under cursor | n    |
| <kbd>\<Leader></kbd>yf | search selected text                   | v    |

## Plugins

### Git

| trigger                | action                   | mode |
|------------------------|--------------------------|------|
| <kbd>\<Leader></kbd>gf | fold all unchanged lines | n/v  |

### Selection

* [wildfire.vim]() 
* [vim-visual-multi]() 

| trigger           | action                                  | mode |
|-------------------|-----------------------------------------|------|
| <kbd>\<CR></kbd>  | extend selection                        | n/v  |
| <kbd>\<BS></kbd>  | shrink selection                        | v    |
| <kbd>\<C-N></kbd> | start multi select                      | n/v  |
| n                 | select next match text                  | v-m  |
| N                 | select previous occurrence              | v-m  |
| [                 | move to previous occurrence             | v-m  |
| ]                 | move to next occurrence                 | v-m  |
| q                 | skip current and select next occurrence | v-m  |
| Q                 | remove current selected                 | v-m  |

### Find and Replace

* [far.vim](https://github.com/brooth/far.vim) 

| trigger                | action | command                | mode |
|------------------------|--------|------------------------|------|
| <kbd>\<Leader></kbd>ff |        | :Farr --source=vimgrep | n/v  |
| <kbd>\<Leader></kbd>fF |        | :Farf --source=vimgrep | n/v  |
| <kbd>\<Leader></kbd>fp |        | :Farr --source=rgnvim  | n/v  |
| <kbd>\<Leader></kbd>fP |        | :Farf --source=rgnvim  | n/v  |

### Markdown 

* [goyo.vim]() 
* [vim-markdown]() 
* [markdown-preview.nvim]() 
* [vim-markdown-toc]() 
* [vim-table-mode]() 

| trigger                     | action            | mode |
|-----------------------------|-------------------|------|
| <kbd>\<LocalLeader></kbd>pp | open md preview   | n/v  |
| <kbd>\<LocalLeader></kbd>pc | close md preview  | n/v  |
| <kbd>\<LocalLeader></kbd>t  | toggge table mode | n/v  |
| <kbd>\<LocalLeader></kbd>k  | tag kbd           | n/v  |
| <kbd>\<LocalLeader></kbd>b  | bold              | n/v  |
| <kbd>\<LocalLeader></kbd>e  | em                | n/v  |
| <kbd>\<LocalLeader></kbd>tl | text link         | n/v  |
| <kbd>\<LocalLeader></kbd>ml | image link        | n/v  |
| <kbd>\<LocalLeader></kbd>c  | code block        | v    |
| kd                          | tag kbd           | i    |
| b                           | bold              | i    |
| em                          | em                | i    |
| tl                          | text link         | i    |
| ml                          | image link        | i    |
| cd                          | code block        | i    |

