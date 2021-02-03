+++
title = "ps in Rust"
date = 2021-01-29
slug = "rust-for-ps"
description = "I've been trying to learn Rust for a long time now and haven't gotten to dig really deep into the language. Projects are probably the best way to learn practical language knowledge and so I (ignorantly) decided to write a CLI replacement for `ps`. Here's what I've learned so far."
draft = true

[taxonomies]
categories = ["programming"]
tags = ["rust", "c"]
+++

I've been trying to really learn Rust for a long time. I finally got fed up just reading the book and decided to just build something. I've built a few small things in the past but I wanted to build something totally from scratch. I've seen a wave of CLI tools being "rewritten" in Rust like `fd` (`find` replacement), `bat` (`cat` replacement), and `exa` (`ls` replacement) so I thought I'd try my hand at re-writing a tool I use on a semi-regular basis. This idea also satisfied my urge to understand more about systems programming. My idea was to write a `ps` replacement.

**This was probably one of the worst ideas I've ever had.**

## Why it's the Worst Idea
`ps` is an old tool. Very old. The [old email list](https://www.freelists.org/archive/procps/) for bugs and development goes back to 2010. It's really one tool in a suite of tools that manages the processes being run on a local system. [Here's the current repository](https://gitlab.com/procps-ng/procps) which shows all the tools that's wrapped up into a single suite.

The way processes are identified in a typical linux system is by using a temporary directories with files located in `/proc`. This lists out process information, memory usage and is constantly updated based on what's going on in the system. [Here's a quick overview](https://www.tecmint.com/exploring-proc-file-system-in-linux/) of that system if you're interested in learning more. MacOS does _not_ provide a `/proc` directory to view process information, instead, it's available via a special c header interface that is pretty much marked as unstable. Rust provides a few ways to interact with a c header file, like using bindgen and other FFI's but this is pretty deep for a beginner :).
