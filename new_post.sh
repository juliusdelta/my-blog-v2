#!/usr/bin/env bash

mkdir content/$1
touch content/$1/index.md

cat > "content/$1/index.md" <<EOF
+++
title = ""
date =
slug = ""
description = ""
draft = true

[taxonomies]
categories = [""]
tags = ["", ""]
+++
EOF

echo "New post, $1 created!"
