---
title: Coldhak Blog
layout: page
permalink: /blog/
---
{% for post in site.posts %}
### [{{ post.title }}]({{ post.url }})

{:.smaller}
{{ post.date | date: '%B %d, %Y' }}

{{ post.excerpt }}
---
{% endfor %}