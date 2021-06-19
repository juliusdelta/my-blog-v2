+++
title = "Polymorphic Associations Rails"
description = "A quick overview of using associations to define good domain descriptions as well as good behavior."
slug = "polymorphic-associations"
date = 2021-05-31
draft = false

[taxonomies]
categories = ["development"]
tags = ["#100DaysToOffload", "rails", "programming"]
+++

{{ offload(number = 5) }}

Polymorphic associations is a common theme among many applications. Things can get complicated, especially as far as naming is concerned, when you consider having a double polymorphic association. Rails provides all the necessary mechanisms by which to manage this in a way that makes sense for most business needs as well as leaving it readable for future programmers that come by in the future. 

> In programming languages and type theory, polymorphism is the provision of a single interface to entities of different types or the use of a single symbol to represent multiple different types.

The example we'll work with today is one taken from some work I recently did helping to implement a Favorites feature. The requirements for this were:
- A `User` can have many favorites, which can be a `Report` or a `Team`
- A `Team` can have many favorites, which can be a `Report`

This is what I mean by a double polymorphic relationship. One side, _favoritor_, can be one of a `User` or `Team` while the other side, the _favouritee_, can be of the type `Team` or `Report`. 
