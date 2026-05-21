---
layout: page
title: 學習筆記
title_en: Notes
permalink: /notes/
description: 統計方法、研究設計與 AI 工具的學習紀錄
nav: true
nav_order: 6
---

{% assign posts = site.posts | where_exp: "post", "post.categories contains 'notes'" | sort: "date" | reverse %}

{% if posts.size == 0 %}
  <p>目前尚無學習筆記，敬請期待。</p>
{% else %}
<ul class="post-list">
  {% for post in posts %}
  {% assign read_time = post.content | number_of_words | divided_by: 180 | plus: 1 %}
  <li>
    <h3><a class="post-title" href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
    <p>{{ post.description }}</p>
    <p class="post-meta">
      {{ read_time }} min read &nbsp;&middot;&nbsp;
      {{ post.date | date: '%Y 年 %m 月 %d 日' }}
      {% if post.tags != empty %}
        &nbsp;&middot;&nbsp;
        {% for tag in post.tags %}
          <a href="{{ tag | slugify | prepend: '/blog/tag/' | relative_url }}">
            <i class="fa-solid fa-hashtag fa-sm"></i>{{ tag }}</a>{% unless forloop.last %}&nbsp;{% endunless %}
        {% endfor %}
      {% endif %}
    </p>
  </li>
  {% endfor %}
</ul>
{% endif %}
