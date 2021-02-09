# Personal Website
[![Netlify Status](https://api.netlify.com/api/v1/badges/27752c56-d790-42d7-8e40-6e7856780c64/deploy-status)](https://app.netlify.com/sites/guard-bernice-18543/deploys)

This my personal website built on [Zola](https://getzola.org).

## Docs
This documentation is mainly for me to remember how I built this later on.

### Custom Shortcodes
#### 100 Days to Offload
This shortcode is to provide the context around the [#100DaysToOffload](https://100daystooffload.com) challenge in each post that's apart of that "series".

**Args:**
- `number` - Used to manually increment the post numbers associated with the challenge.

**Usage**
``` html
{{ offload(number = 1) }}

<!-- OUTPUT RESULT -->
<blockquote style="background: #3b4252; font-style: normal; margin-left: 0; border: 1px solid #EBCB8B;">
  <h4 style="margin: 0 0; font-weight: bold;">100 Days to Offload Challenge</h4>
  This is post 1 as part of the <a href="https://100daystooffload.com">#100DaysToOffload</a> challenge.
  The point is to write 100 posts on a personal blog in a year. Quality isn't as important as quantity so some posts may be a little messy.
  <a href="http://127.0.0.1:1111/tags/100daystooffload/">Read other posts</a>&nbsp;in this challenge.
</blockquote>
```

