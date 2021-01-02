+++
title = "Literate Org Configs"
description = "Managing dotfiles with org mode is exceptionally easy with tools like org-babel-tangle."
slug = "literate-org"
date = 2020-12-28

[taxonomies]
categories = ["development"]
tags = ["emacs", "org mode"]
+++

Org mode is one of the greatest things Emacs has to offer. With a vibrant ecosystem of packages and a large number of resources available it's easy to do just about anything with org mode.

## Org-babel-tangle

A great feature of org-mode comes in a package called org-babel. This is a language parser allowing you to write source code blocks and even executing them inline.

```
#+begin_src ruby  <-- Org Source Block begin & lang declaration
def hello
  return 'Hello, World'
end

hello
#+end_src

#+RESULTS:  <-- Resulting Execution with `C-c C-c`
: Hello, World
```

This is essentially a repl. You can import whatever you need to and execute/output everything that's necessary. Things don't stop there.

Org, being a powerful markup language, allows you to write source blocks and document them, similar to how markdown looks. The payoff comes when you use org-babel-tangle. This package gets an org file, cuts out all the markup, except source code blocks, and outputs the blocks into a file of your choosing. This means you can neatly markup any files and _tangle_ them out into another file that only consists of your source code.

## Example
In my .doom.d directory, I have a Kitty.org file to manage my [Kitty Terminal](https://sw.kovidgoyal.net/kitty/) configuration. This is what it looks like:

```org
#+TITLE: Kitty Config
#+PROPERTY: header-args :tangle ~/.config/kitty/kitty.conf

* Colorscheme
Based on: [[https://gist.github.com/marcusramberg/64010234c95a93d953e8c79fdaf94192][This gist]] & [[https://github.com/arcticicestudio/nord-hyper][Nord Color Scheme]]

#+begin_src shell
foreground            #D8DEE9
background            #2E3440
selection_foreground  #000000
selection_background  #FFFACD
url_color             #0087BD
cursor                #81A1C1

color0   #3B4252
color8   #4C566A

color1   #BF616A
color9   #BF616A

color2   #A3BE8C
color10  #A3BE8C

color3   #EBCB8B
color11  #EBCB8B

color4  #81A1C1
color12 #81A1C1

color5   #B48EAD
color13  #B48EAD

color6   #88C0D0
color14  #8FBCBB

color7   #E5E9F0
color15  #ECEFF4
#+end_src

* The worst
#+begin_src shell
enable_audio_bell no
#+end_src

* Fonts
Use JetBrainsMono like everything else.

#+begin_src shell
font_family      JetBrainsMono-Regular
bold_font        JetBrainsMono-Bold
italic_font      JetBrainsMono-MediumItalic
bold_italic_font JetBrainsMono-BoldItalic

font_size 13.0
#+end_src

* Visual
A few small visual changes to satisfy my OCD.

#+begin_src shell
hide_window_decorations yes
window_padding_width 1.0
#+end_src

* Tabs
Basic tab commands to be more like Chrome/Doom-Emacs
#+begin_src shell
tab_bar_style powerline
map cmd+1 goto_tab 1
map cmd+2 goto_tab 2
map cmd+3 goto_tab 3
map cmd+4 goto_tab 4
map cmd+5 goto_tab 5
map cmd+6 goto_tab 6
map cmd+7 goto_tab 7
map cmd+8 goto_tab 8
map cmd+9 goto_tab 9

active_tab_foreground   #D8DEE9
active_tab_background   #5E81AC
active_tab_font_style   bold
inactive_tab_foreground #ECEFF4
inactive_tab_background #3B4252
inactive_tab_font_style normal
#+end_src
```

With that as my `.org` file I just need to run `org-babel-tangle` with `M-x` or `C-c C-v t` and it will strip out my comments and headings and just output a normal conf file like so:

```sh
foreground            #D8DEE9
background            #2E3440
selection_foreground  #000000
selection_background  #FFFACD
url_color             #0087BD
cursor                #81A1C1

color0   #3B4252
color8   #4C566A

color1   #BF616A
color9   #BF616A

color2   #A3BE8C
color10  #A3BE8C

color3   #EBCB8B
color11  #EBCB8B

color4  #81A1C1
color12 #81A1C1

color5   #B48EAD
color13  #B48EAD

color6   #88C0D0
color14  #8FBCBB

color7   #E5E9F0
color15  #ECEFF4

enable_audio_bell no

font_family      JetBrainsMono-Regular
bold_font        JetBrainsMono-Bold
italic_font      JetBrainsMono-MediumItalic
bold_italic_font JetBrainsMono-BoldItalic

font_size 13.0

hide_window_decorations yes
window_padding_width 1.0

tab_bar_style powerline
map cmd+1 goto_tab 1
map cmd+2 goto_tab 2
map cmd+3 goto_tab 3
map cmd+4 goto_tab 4
map cmd+5 goto_tab 5
map cmd+6 goto_tab 6
map cmd+7 goto_tab 7
map cmd+8 goto_tab 8
map cmd+9 goto_tab 9

active_tab_foreground   #D8DEE9
active_tab_background   #5E81AC
active_tab_font_style   bold
inactive_tab_foreground #ECEFF4
inactive_tab_background #3B4252
inactive_tab_font_style normal
```

As you can see all my comments in the org configuration are gone and now just the "code" is here. 

This has a few key implications for dotfiles in general:
- All dotfiles could be _tangled_ this way making manging your dotfiles a breeze. Not having to deal with symlinks, tools, or worse, manual imports and loading
- You can document you code fairly consistently, and with GH support for Org markup it's even easier to document your configs so you always remember what the one function does in your `.zshrc` file.
- Your dotfiles will be dependent on Emacs but the code is always there. If for whatever reason you can't use Emacs to put your dotfiles in place you can always just copy the source blocks manually :)

The Emacs community has popularized this technique and has aptly called it "literate configuration" which is a suitable name. There are
I'm currently in the process of converting all my dotfiles into a simple repo of org files this way and I couldn't be more excited to actually have organized dotfiles.
