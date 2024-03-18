+++
title = "Missing Details of the 'Rails Convention Perspective'"
description = "I've heard vanilla Rails is enough quite a bit but understanding reality might shed some light on why it's not."
slug = "vanilla-rails-in-practice"
date = 2024-03-11
draft = true

[taxonomies]
categories = ["development"]
tags = ["rails", "programming"]
+++

I recently came across [this Reddit post]('https://old.reddit.com/r/rails/comments/1bar6l3/vanilla_rails_is_just_fine/?ref=share&ref_source=link') which actually had addressed something I have been thinking about for a long time. There are is a decent portion of the Rails community that believe using Rails conventions to build and scale applications is the best overall appraoch to building with Rails. This idea is propogated by David Heinemeier Hansson (the founder/initial developer of RoR), herby referred to as DHH and continues to propogate with a subsection of the Rails community. Rails conventions are very unique to the Rails framework and don't always translate well between other MVC style frameworks, but this is absolutely **OK**. Ruby on Rails has paved the way for quick prototyping and high productivity in the early life of a product. These conventions are exceptionally good and provide an [_asthetic_]('https://world.hey.com/dhh/commit-to-competence-in-this-coming-year-feb7d7c5') not seen in any other language which is large in part to the "spoken language style" syntax of the Ruby language. The commitment to adhering, almost religiously, to a set of conventions that are as robust as the ones that exist in the framework entirely makes sense from a **certain perspective**. This "certain perspective" I'll be referring to as the "Rails Convention Perspective" (RCP) for the rest of this writing.

Again, just to make this clear, I'm a big fan of Ruby on Rails and the work and care the core team has put into the framework. I also generally agree that the conventions provide a very good foundation for building maintainable systems in the framework.

There is a deep problem with the Rails Convention Perspective though that typically goes unaddressed but is very apparent when speaking to any kind technical leadership at various companies or just working on a growing product for any length of time.

## The Missing Details

DHH is one of the founders of 37 Signals which is the parent company to several different products all utilizing the Rails framework in some form or fashion. Let me rephrase that: The initial developer of the Rails framework and biggest advocate for the Rails Convention Perspective is the leader of 37 Signals and it's product organizations. One more time: The person with the most influence on business values and priorities is also the biggest advocate for RCP. This detail is frequently missed in conversations about how "Basecamp is able to just use vanilla Rails so everyone else should." Businesses prioritize all sorts of things for all sorts of reasons based on all sorts of ideas, beliefs, and baises. 37 Signals is "privileged"[^1] in this reguard because their leadership is highly techincal and built the framework they operate on. They "get" to do that, much like someone else "gets" to have a nicer computer than you do. 

This marks a seperaration between a desired state's environment and the reality of most Rails developers experience. The majority of Rails developers don't retain the influnece in order to change business priorities in a way that truly enables such strict adherence to RCP. 

This isn't a bad thing by any means. Organizations should be striving for better product development practices and perspectives. 

---

[^1]: It's not lost on me that the word "privileged" contains all sorts of baggage associatied with it. It's used intentionally here to demonstrate that the environment provided is condusive to a practice. The practice is advocated for without any reference to the environment, which is really what this whole article is about.



