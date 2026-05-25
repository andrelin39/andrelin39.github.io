---
layout: page
title: 演講邀約
title_en: Invited Talks
permalink: /talks/
description: ""
nav: false
---

<style>
/* ── Talks page: academic layout ─────────────────── */

.tk-intro {
  font-size: 0.95rem;
  line-height: 1.85;
  color: #6B7280;
  margin-bottom: 2.5rem;
}

/* ── Stats row ─── */
.tk-stats {
  display: flex;
  gap: 2.5rem;
  margin-bottom: 3.5rem;
  flex-wrap: wrap;
  padding-bottom: 2rem;
  border-bottom: 1px solid #E5E7EB;
}

.tk-stat-number {
  font-size: 2.25rem;
  font-weight: 700;
  color: #111827;
  line-height: 1;
  letter-spacing: -0.02em;
}

.tk-stat-label {
  font-size: 0.78rem;
  color: #9CA3AF;
  margin-top: 0.3rem;
}

/* ── Category sections ─── */
.tk-section {
  margin-bottom: 5rem;
}

.tk-cat-banner {
  border-left: 4px solid var(--global-theme-color, #526EB4);
  padding-left: 16px;
  margin-bottom: 0.5rem;
}

.tk-cat-title {
  font-size: 2rem;
  font-weight: 700;
  color: #111827;
  margin: 0;
  letter-spacing: -0.02em;
  line-height: 1.15;
}

.tk-cat-sub {
  font-size: 0.875rem;
  color: #9CA3AF;
  font-weight: 400;
  display: block;
  margin-top: 0.3rem;
}

.tk-rule {
  border: 0;
  border-top: 1px solid #E5E7EB;
  margin: 1.25rem 0 0 0;
}

.tk-list {
  margin-top: 2rem;
}

/* ── Talk entry ─── */
.tk-entry {
  padding: 1.25rem 0;
  border-bottom: 1px solid #E5E7EB;
}

.tk-entry:last-child { border-bottom: none; }

.tk-meta-row {
  display: flex;
  align-items: center;
  gap: 0.6rem;
  margin-bottom: 0.5rem;
}

.tk-date {
  font-family: "Menlo", "Monaco", "Consolas", "Liberation Mono", monospace;
  font-size: 0.8rem;
  color: #6B7280;
  min-width: 4.5rem;
}

/* ── Type pills ─── */
.tk-pill {
  display: inline-block;
  font-size: 0.6875rem;
  font-weight: 500;
  padding: 0.15rem 0.55rem;
  border-radius: 20px;
  letter-spacing: 0.01em;
  white-space: nowrap;
  vertical-align: middle;
}

.tk-pill-invited-talk   { background: #EDE9FE; color: #5B21B6; }
.tk-pill-training       { background: #FFEDD5; color: #C2410C; }
.tk-pill-invited-speech { background: #DBEAFE; color: #1D4ED8; }

/* ── Talk content ─── */
.tk-title {
  font-size: 1.125rem;
  font-weight: 600;
  color: #1F2937;
  line-height: 1.45;
  margin: 0 0 0.3rem 0;
}

.tk-org {
  font-size: 0.8125rem;
  color: #9CA3AF;
  margin: 0 0 0.1rem 0;
}

.tk-loc {
  font-size: 0.8125rem;
  color: #9CA3AF;
  margin: 0;
}

/* ── Buttons ─── */
.tk-materials { margin-top: 0.75rem; }

.tk-btn {
  display: inline-block;
  font-size: 0.75rem;
  padding: 0.2rem 0.65rem;
  border-radius: 4px;
  border: 1px solid #D1D5DB;
  color: #6B7280;
  text-decoration: none !important;
  transition: border-color 0.12s ease, color 0.12s ease, background 0.12s ease;
  white-space: nowrap;
}

.tk-btn:hover { border-color: #9CA3AF; color: #374151; }

.tk-btn-primary {
  border-color: var(--global-theme-color, #526EB4);
  color: var(--global-theme-color, #526EB4);
}

.tk-btn-primary:hover {
  background: var(--global-theme-color, #526EB4);
  color: #fff !important;
}

.tk-btn-dim {
  border-color: #E5E7EB;
  color: #D1D5DB;
  cursor: default;
  pointer-events: none;
}

.tk-links {
  margin-top: 0.5rem;
  display: flex;
  gap: 0.45rem;
  flex-wrap: wrap;
}

.tk-internal {
  display: inline-block;
  font-size: 0.75rem;
  color: #D1D5DB;
  font-style: italic;
  margin-top: 0.65rem;
}
</style>

<p class="tk-intro">
  Invited talks, training sessions, and seminars on AI applications, academic research, and interdisciplinary topics.
</p>

{% assign all_talks = site.data.talks.talks %}

{% comment %} Stats calculation {% endcomment %}
{% assign total_count = all_talks | size %}

{% assign year_list = "" | split: "|" %}
{% for talk in all_talks %}
  {% assign y = talk.date | date: "%Y" %}
  {% unless year_list contains y %}
    {% assign year_list = year_list | push: y %}
  {% endunless %}
{% endfor %}
{% assign year_count = year_list | size %}

{% assign org_count = all_talks | map: "organization" | uniq | size %}
{% assign loc_count = all_talks | map: "location" | uniq | size %}

<div class="tk-stats">
  <div>
    <div class="tk-stat-number">{{ total_count }}</div>
    <div class="tk-stat-label">
      <span class="lang-zh">總場次</span>
      <span class="lang-en">Total Talks</span>
    </div>
  </div>
  <div>
    <div class="tk-stat-number">{{ year_count }}</div>
    <div class="tk-stat-label">
      <span class="lang-zh">累積年數</span>
      <span class="lang-en">Years Active</span>
    </div>
  </div>
  <div>
    <div class="tk-stat-number">{{ org_count }}</div>
    <div class="tk-stat-label">
      <span class="lang-zh">邀請單位</span>
      <span class="lang-en">Organizations</span>
    </div>
  </div>
  <div>
    <div class="tk-stat-number">{{ loc_count }}</div>
    <div class="tk-stat-label">
      <span class="lang-zh">涵蓋縣市</span>
      <span class="lang-en">Locations</span>
    </div>
  </div>
</div>

{% assign sorted_cats = site.data.talks.categories | sort: "order" %}

{% for cat in sorted_cats %}
  {% assign cat_talks = all_talks | where: "category", cat.id | sort: "date" | reverse %}
  {% if cat_talks.size == 0 %}{% continue %}{% endif %}

<section class="tk-section">
  <div class="tk-cat-banner">
    <h3 class="tk-cat-title">
      <span class="lang-zh">{{ cat.name }}</span>
      <span class="lang-en">{{ cat.name_en }}</span>
    </h3>
    <span class="tk-cat-sub">
      <span class="lang-zh">{{ cat.name_en }}</span>
      <span class="lang-en">{{ cat.name }}</span>
    </span>
  </div>
  <hr class="tk-rule">

  <div class="tk-list">
    {% for talk in cat_talks %}
      {% assign type_class = talk.type | replace: "_", "-" %}
      <div class="tk-entry">

        <div class="tk-meta-row">
          <span class="tk-date">{{ talk.date | date: "%Y.%m" }}</span>
          <span class="tk-pill tk-pill-{{ type_class }}">
            <span class="lang-zh">{% if talk.type == "invited_talk" %}專題演講{% elsif talk.type == "training" %}教育訓練{% elsif talk.type == "invited_speech" %}受邀演講{% else %}{{ talk.type }}{% endif %}</span>
            <span class="lang-en">{% if talk.type == "invited_talk" %}Invited Talk{% elsif talk.type == "training" %}Training Session{% elsif talk.type == "invited_speech" %}Invited Speech{% else %}{{ talk.type }}{% endif %}</span>
          </span>
        </div>

        <p class="tk-title">
          <span class="lang-zh">{{ talk.title }}</span>
          <span class="lang-en">{{ talk.title_en }}</span>
        </p>
        <p class="tk-org">
          <span class="lang-zh">{{ talk.organization }}</span>
          <span class="lang-en">{{ talk.organization_en }}</span>
        </p>
        <p class="tk-loc">
          <span class="lang-zh">{{ talk.location }}</span>
          <span class="lang-en">{{ talk.location_en }}</span>
        </p>

        {% if talk.internal %}
          <span class="tk-internal">
            <span class="lang-zh">內部資料</span>
            <span class="lang-en">Internal materials only</span>
          </span>
        {% else %}
          {% if talk.slides_folder and talk.slides_folder != "" %}
            <div class="tk-materials">
              {% if talk.slides_folder contains "TBD" %}
                <span class="tk-btn tk-btn-dim">
                  <span class="lang-zh">整理中</span>
                  <span class="lang-en">Coming soon</span>
                </span>
              {% else %}
                <a href="{{ talk.slides_folder }}" target="_blank" rel="noopener noreferrer" class="tk-btn tk-btn-primary">
                  <span class="lang-zh">演講資料 ↗</span>
                  <span class="lang-en">Materials ↗</span>
                </a>
              {% endif %}
            </div>
          {% endif %}

          {% assign link_fields = "" %}
          {% if talk.slides and talk.slides != "" %}{% assign link_fields = link_fields | append: "1" %}{% endif %}
          {% if talk.photo and talk.photo != "" %}{% assign link_fields = link_fields | append: "1" %}{% endif %}
          {% if talk.video and talk.video != "" %}{% assign link_fields = link_fields | append: "1" %}{% endif %}
          {% if talk.news and talk.news != "" %}{% assign link_fields = link_fields | append: "1" %}{% endif %}
          {% if talk.event_page and talk.event_page != "" %}{% assign link_fields = link_fields | append: "1" %}{% endif %}
          {% if link_fields != "" %}
          <div class="tk-links">
            {% if talk.slides and talk.slides != "" %}
              <a href="{{ talk.slides }}" target="_blank" rel="noopener noreferrer" class="tk-btn">
                <span class="lang-zh">講綱</span><span class="lang-en">Slides</span>
              </a>
            {% endif %}
            {% if talk.photo and talk.photo != "" %}
              <a href="{{ talk.photo }}" target="_blank" rel="noopener noreferrer" class="tk-btn">
                <span class="lang-zh">活動照片</span><span class="lang-en">Photos</span>
              </a>
            {% endif %}
            {% if talk.video and talk.video != "" %}
              <a href="{{ talk.video }}" target="_blank" rel="noopener noreferrer" class="tk-btn">
                <span class="lang-zh">影片</span><span class="lang-en">Video</span>
              </a>
            {% endif %}
            {% if talk.news and talk.news != "" %}
              <a href="{{ talk.news }}" target="_blank" rel="noopener noreferrer" class="tk-btn">
                <span class="lang-zh">新聞報導</span><span class="lang-en">News</span>
              </a>
            {% endif %}
            {% if talk.event_page and talk.event_page != "" %}
              <a href="{{ talk.event_page }}" target="_blank" rel="noopener noreferrer" class="tk-btn">
                <span class="lang-zh">活動頁面</span><span class="lang-en">Event Page</span>
              </a>
            {% endif %}
          </div>
          {% endif %}
        {% endif %}

      </div>
    {% endfor %}
  </div>
</section>

{% endfor %}
