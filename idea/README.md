# Idea workflow

## Content of table

<!-- vim-markdown-toc GFM -->

* [Remap shortcut](#remap-shortcut)
* [Abbr](#abbr)
* [Action](#action)
  * [Selection](#selection)
  * [Searching](#searching)
  * [Workflow](#workflow)
  * [Workbench](#workbench)
  * [Goto](#goto)
  * [Recent](#recent)
  * [Refactor](#refactor)
  * [Menu](#menu)
  * [Coding](#coding)
  * [History](#history)
  * [Hierarchy](#hierarchy)
  * [Navigate Error](#navigate-error)
  * [Git](#git)
  * [Android Development](#android-development)
  * [Tool windows](#tool-windows)
  * [Debug](#debug)
  * [Translation](#translation)
  * [Online Search](#online-search)
  * [Others](#others)
* [Mnemonic](#mnemonic)
* [Plugins](#plugins)
* [Tips and tricks](#tips-and-tricks)

<!-- vim-markdown-toc -->

## Remap shortcut

| trigger                            | action                  |
|------------------------------------|-------------------------|
| <kbd>Ctrl-h/j/k/l</kbd>            | left/down/up/right      |
| <kbd>Ctrl-d</kbd>                  | hide active tool window |
| <kbd>Ctrl-]</kbd>                  | focus editor            |
| <kbd>Ctrl-,</kbd>m                 | show context menu       |
| <kbd>Ctrl-,</kbd><kbd>Ctrl-,</kbd> | maximize tool window    |
| <kbd>Ctrl-,</kbd>c                 | reformat code           |
| <kbd>Ctrl-,</kbd>f                 | reformat file           |


## Abbr

| Tool window        | abbreviation |
|--------------------|--------------|
| **Project**        | pj           |
| **Logcat**         | lc           |
| **Terminal**       | ti           |
| **Git**            | gi           |
| **Todo**           | td           |
| **Gradle**         | gd           |
| **Profiler**       | pf           |
| Structure          | st           |
| Build              | bd           |
| Build Variants     | bv           |
| Dart Analysis      | da           |
| Event Log          | el           |
| Device File        | df           |
| Flutter Inspector  | fi           |
| Fllutter Outline   | fo           |
| Flutter Pepector   | li           |
| Problems View      | pv           |
| Project Problems   | pp           |
| Resource Manager   | rm           |
| Database Inspector | db           |


## Action

### Selection

| trigger           | action           | mode |
|-------------------|------------------|------|
| <kbd>**CR**</kbd> | extend selection | n/v  |
| <kbd>**BS**</kbd> | shrink selection | v    |

### Searching

| trigger             | action       | mode |
|---------------------|--------------|------|
| <kbd>Leader</kbd>ss | find in path | n/v  |
| <kbd>Leader</kbd>ff | replace      | n/v  |

### Workflow

| trigger                 | action       | mode |
|-------------------------|--------------|------|
| <kbd>**Leader**</kbd>ef | show nav bar | n/v  |

### Workbench

| trigger                 | action                               | mode   |
|-------------------------|--------------------------------------|--------|
| <kbd>**Esc**</kbd>      | focus the editor                     | global |
| <kbd>C-[</kbd>          | hide the wtool and focus the editor  | global |
| <kbd>CMD-W</kbd>        | close the wtool and focus the editor | global |
| <kbd>**C-F12**</kbd>    | toggle all tool windows              | global |
| <kbd>**Leader**</kbd>ww | toggle all tool windows              | n      |
| <kbd>**Leader**</kbd>wd | distraction free mode                | n      |
| <kbd>**Leader**</kbd>wl | jump to last window                  | n      |
| <kbd>Leader</kbd>wz     | zen mode                             | n      |
| <kbd>Leader</kbd>wp     | presentation mode                    | n      |
| <kbd>**Leader**</kbd>wn | show line numbers                    | n      |
| <kbd>**Leader**</kbd>wg | show gutter icons                    | n      |

### Goto

| trigger             | action                 | mode |
|---------------------|------------------------|------|
| <kbd>Leader</kbd>ae | goto search everywhere | n/v  |
| <kbd>Leader</kbd>ac | goto class             | n/v  |
| <kbd>Leader</kbd>af | goto file              | n/v  |
| <kbd>Leader</kbd>as | goto symbol            | n/v  |
| <kbd>Leader</kbd>aa | goto Action            | n/v  |
| <kbd>Leader</kbd>p  | goto Action            | n/v  |

### Recent

| trigger                 | action                        | mode |
|-------------------------|-------------------------------|------|
| <kbd>**Leader**</kbd>ee | show recent files             | n/v  |
| <kbd>**Leader**</kbd>er | show recent changed files     | n/v  |
| <kbd>**Leader**</kbd>el | show recent navigate location | n/v  |
| <kbd>Leader</kbd>et     | show recent tests             | n/v  |
| <kbd>Leader</kbd>ec     | show recent change records    | n/v  |

### Refactor

| trigger                 | action             | mode |
|-------------------------|--------------------|------|
| <kbd>**Leader**</kbd>rr | show rafactor menu | n/v  |
| <kbd>**Leader**</kbd>rn | rename             | n/v  |
| <kbd>**Leader**</kbd>ro | optimize imports   | n/v  |
| <kbd>**Leader**</kbd>rc | reformat code      | n    |
| <kbd>**Leader**</kbd>rf | reformat file      | n/v  |

### Menu

| trigger                | action    | mode |
|------------------------|-----------|------|
| <kbd>**Leader**</kbd>m | show menu | n/v  |

### Coding

| trigger        | action                     | mode |
|----------------|----------------------------|------|
| **gd**         | goto declaration or usages | n/v  |
| **gi**         | goto implementation        | n/v  |
| **gs**         | goto super method          | n/v  |
| **gy**         | goto type declaration      | n/v  |
| **K**          | show document              | n/v  |
| <kbd>C-A</kbd> | show intention actions     | i    |
| <kbd>C-I</kbd> | code completion            | i    |
| <kbd>C-P</kbd> | show params info           | i    |
| <kbd>C-E</kbd> | expand snippets            | i    |
| **K**          | show document              | n    |

### History

| trigger | action                       | mode |
|---------|------------------------------|------|
| **tu**  | show file local history      | n    |
| **tu**  | show selection local history | v    |

### Hierarchy

| trigger             | action                | mode |
|---------------------|-----------------------|------|
| <kbd>Leader</kbd>tb | show type hierarchy   | n    |
| <kbd>Leader</kbd>ts | show structure window | n    |

### Navigate Error

| trigger             | action              | mode |
|---------------------|---------------------|------|
| <kbd>Leader</kbd>ej | goto next error     | n    |
| <kbd>Leader</kbd>ek | goto previous error | n    |

### Git

| trigger             | action                         | mode |
|---------------------|--------------------------------|------|
| <kbd>Leader</kbd>gd | show diff from same version    | n    |
| <kbd>Leader</kbd>gD | show diff from lastest version | n    |
| <kbd>Leader</kbd>gc | compare with branch            | n    |
| <kbd>Leader</kbd>gm | show vcs actions menu          | n    |
| <kbd>Leader</kbd>gb | git blame                      | n    |
| <kbd>Leader</kbd>gB | open remote repository         | n    |
| <kbd>Leader</kbd>gm | git Branches                   | n    |

### Android Development

| trigger             | action                        | mode |
|---------------------|-------------------------------|------|
| <kbd>Leader</kbd>dr | run                           | n/v  |
| <kbd>Leader</kbd>dR | choose configuration to run   | n/v  |
| <kbd>Leader</kbd>dt | apply changes                 | n/v  |
| <kbd>Leader</kbd>dh | hotreload                     | n/v  |
| <kbd>Leader</kbd>dd | debug                         | n/v  |
| <kbd>Leader</kbd>da | attach to running app (debug) | n/v  |
| <kbd>Leader</kbd>ds | stop                          | n/v  |
| <kbd>Leader</kbd>dc | switch configuration          | n/v  |

### Tool windows

| trigger             | action              | mode |
|---------------------|---------------------|------|
| tt                  | Project             | n/v  |
| ti                  | Terminal            | n/v  |
| <kbd>Leader</kbd>vb | Build               | n/v  |
| <kbd>Leader</kbd>vc | Codota              | n/v  |
| <kbd>Leader</kbd>vd | Debug               | n/v  |
| <kbd>Leader</kbd>vg | Gradle              | n/v  |
| <kbd>Leader</kbd>vr | Run                 | n/v  |
| <kbd>Leader</kbd>vt | TODO                | n/v  |
| <kbd>Leader</kbd>vp | Profiler            | n/v  |
| <kbd>Leader</kbd>vo | Flutter Outline     | n/v  |
| <kbd>Leader</kbd>vi | Flutter Inspector   | n/v  |
| <kbd>Leader</kbd>vu | Flutter Performance | n/v  |

### Debug

| trigger | action                       | mode |
|---------|------------------------------|------|
| [b      | show execution breakpoint    | n/v  |
| [s      | step over                    | n/v  |
| [d      | step into                    | n/v  |
| [f      | force step into              | n/v  |
| [w      | step over                    | n/v  |
| [r      | resume                       | n/v  |
| [e      | evaluate expression          | n/v  |
| [a      | toggle line breakpoint       | n/v  |
| [v      | show breakpoints tool window | n/v  |

### Translation

| trigger            | action                      | mode |
|--------------------|-----------------------------|------|
| <kbd>Leader</kbd>i | translate word under cursor | n    |
| <kbd>Leader</kbd>i | translate selection         | v    |
| <kbd>Leader</kbd>I | translate document          | n/v  |

### Online Search 

| trigger             | action                               | mode |
|---------------------|--------------------------------------|------|
| <kbd>Leader</kbd>uu | google word under cursor / selection | n    |
| <kbd>Leader</kbd>ug | search on Github                     | n/v  |
| <kbd>Leader</kbd>us | search code on SearchCode            | n/v  |
| <kbd>Leader</kbd>ur | search code on GrepCode              | n/v  |
| <kbd>Leader</kbd>uc | search code on Codota                | n/v  |

### Others

| trigger             | action                     | mode |
|---------------------|----------------------------|------|
| <kbd>Leader</kbd>ns | create scratch file        | n/v  |
| <kbd>Leader</kbd>up | search plugins             | n/v  |
| <kbd>Leader</kbd>uv | highlight scope in brakets | n/v  |


## Mnemonic

| prefix             | scope                |
|--------------------|----------------------|
| <kbd>Leader</kbd>a | search / goto        |
| <kbd>Leader</kbd>d | development          |
| <kbd>Leader</kbd>e | recent stuff / error |
| <kbd>Leader</kbd>g | git                  |
| <kbd>Leader</kbd>r | refactor / format    |
| <kbd>Leader</kbd>t | structure            |
| <kbd>Leader</kbd>v | tool windows         |
| <kbd>Leader</kbd>w | workbench            |
| [                  | debug                |

## Plugins

* [IdeaVIM]()
* [Statistic]()
* [Codota]()
* [Rainbow Brackets]()
* [checkStyle]()
* [findbugs]()
* [pmd]()
* [Translation]()
* [OnlineSearch]()

## Tips and tricks

* Inject Language
