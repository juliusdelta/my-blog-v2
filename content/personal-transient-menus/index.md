+++
title = "Personal Transient UIs for Fun & Profit"
description = ""
slug = "personal-transient-uis"
date = 2024-03-18
draft = true

[taxonomies]
categories = ["emacs"]
tags = ["emacs", "packages", "tools"]
+++

[Magit](https://magit.vc/) is an innovative package that provides an amazing interface over git. The complexity of it's UI is completely hidden away thanks to another package born out of Magit called [Transient](https://www.gnu.org/software/emacs/manual/html_mono/transient.html). Transient is so innovative that it was added to emacs core in 2021. I'll include more details about transient futher down, but to save you time, lets just get to the main point.

## Defining Transient Menus
A transient is made of up of 3 parts: `prefix`, `suffix` and `infix`.

**Prefix** - represents a command to "open" a transient menu. When you call `magit-status`, that's a prefix which will open the `magit-status` buffer. 

**Suffix** - represents the "output" command. This is what you invoke inside of a transient menu to perform some kind operation. With `magit` a suffix example would be the command to checkout a new branch.

**Infix** - 

There are 2 key things to understand about transients:
- Suffixes can call prefixes allowing for "nesting" of "menus." Similar to calling `magit-status` than opening the branch menu. You're calling a suffix `magit-branch` which is in of itself is a prefix.
  - Think of it this way: `Prefix -> Suffix -> Prefix -> ...`
- You can "persist" a state between Suffixes and Prefixes fairly easily, to build a very robust UI that maintains some complicated state but is very simple to the user.

## Personal Transients

While the model is much more complex than I've lead on, and has many more domain concepts to understand than I'm going to layout, defining simple transients can enhance your workflow in meaningful ways once you at least understand the basics.

<details>
  <summary>Unnecessary Context</summary>
  At work, to run our normal test suite on our main application, we have to set a few environment variables to control a few options for running the suite. This makes small pieces of running the tests a big chore and so I wrote a transient menu to manage this for me so instead of dealing with constantly modifying a terminal command, using Transient allows me to set the flags as needed and run the command very easily.
</details>

<br />

Lets start by building a transient to send just a simple message and expand from there.

```el
(transient-define-prefix my/transient ()
  "Beginning Transient"
  ["Commands" ("m" "message" my/message-from-transient)])
   
(defun my/message-from-transient ()
  "Just a quick testing function."
  (interactive)
  (message "Hello Transient!"))
```
