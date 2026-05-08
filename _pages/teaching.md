---
layout: page
title: 教學講義
title_en: Teaching
permalink: /teaching/
description: 課程教材、講義與學習資源。涵蓋生物統計學、醫護文獻選讀、教學原理、醫療經濟學、大數據視覺化分析、機器學習與 AI 工具應用。
nav: true
nav_order: 6
---

<div class="projects">
  {% assign teaching_courses = site.projects | where: "category", "teaching" | sort: "importance" %}
  {% if teaching_courses.size > 0 %}
    <div class="row row-cols-1 row-cols-md-3">
      {% for project in teaching_courses %}
        {% include projects.liquid %}
      {% endfor %}
    </div>
  {% else %}
    <p>目前尚無課程資料。</p>
  {% endif %}
</div>
