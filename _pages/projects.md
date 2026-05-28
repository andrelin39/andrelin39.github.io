---
layout: page
title: projects
title_zh: 專案開發
permalink: /projects/
description: Research projects and practical tools.
description_zh: 研究專案與實用工具。
nav: true
nav_order: 3
---

<style>
/* ── Projects page ─────────────────────────────── */

.pj-intro {
  font-size: 0.95rem;
  line-height: 1.85;
  color: #6B7280;
  margin-bottom: 2.5rem;
}

/* ── Category sections ─── */
.pj-section { margin-bottom: 5rem; }

.pj-cat-banner {
  border-left: 4px solid var(--global-theme-color, #526EB4);
  padding-left: 16px;
  margin-bottom: 0.5rem;
}

.pj-cat-title {
  font-size: 2rem;
  font-weight: 700;
  color: #111827;
  margin: 0;
  letter-spacing: -0.02em;
  line-height: 1.15;
}

.pj-cat-sub {
  font-size: 0.875rem;
  color: #9CA3AF;
  display: block;
  margin-top: 0.3rem;
}

.pj-rule {
  border: 0;
  border-top: 1px solid #E5E7EB;
  margin: 1.25rem 0 2rem 0;
}

/* ── Responsive grid ─── */
.pj-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
  align-items: start;
}

@media (max-width: 1024px) {
  .pj-grid { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 767px) {
  .pj-grid { grid-template-columns: 1fr; }
}

/* ── Cards ─── */
.pj-card {
  border: 1px solid #E5E7EB;
  border-radius: 8px;
  padding: 20px;
  display: flex;
  flex-direction: column;
  background: #fff;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04);
  transition: border-color 0.15s ease, box-shadow 0.15s ease;
}

.pj-card:hover {
  border-color: var(--global-theme-color, #526EB4);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

/* Title row: title + status pill side by side */
.pj-card-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  gap: 0.75rem;
  margin-bottom: 0.3rem;
}

.pj-title {
  flex: 1;
  min-width: 0;
  font-size: 1.05rem;
  font-weight: 600;
  color: #1F2937;
  line-height: 1.35;
  margin: 0;
}

/* ── Status pills ─── */
.pj-status {
  flex-shrink: 0;
  display: inline-block;
  font-size: 0.6875rem;
  font-weight: 500;
  padding: 3px 10px;
  border-radius: 20px;
  white-space: nowrap;
  margin-top: 2px;
}

.pj-status-in-progress { background: #FEF3C7; color: #92400E; }
.pj-status-completed   { background: #D1FAE5; color: #065F46; }
.pj-status-maintained  { background: #DBEAFE; color: #1E40AF; }

/* ── Project type label ─── */
.pj-type {
  font-size: 0.8125rem;
  color: #9CA3AF;
  margin: 0 0 0.6rem 0;
}

/* ── Description ─── */
.pj-desc {
  font-size: 0.875rem;
  color: #6B7280;
  line-height: 1.65;
  flex-grow: 1;
  margin: 0 0 1.25rem 0;
}

/* ── Buttons ─── */
.pj-actions {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
  margin-top: auto;
}

.pj-btn {
  display: inline-block;
  font-size: 0.8125rem;
  padding: 6px 12px;
  border-radius: 6px;
  border: 1px solid var(--global-theme-color, #526EB4);
  color: var(--global-theme-color, #526EB4);
  background: transparent;
  text-decoration: none !important;
  transition: background 0.12s ease, color 0.12s ease;
  white-space: nowrap;
  line-height: 1.4;
}

.pj-btn:hover {
  background: var(--global-theme-color, #526EB4);
  color: #fff !important;
}

.pj-btn-outline {
  border-color: #D1D5DB;
  color: #6B7280;
}

.pj-btn-outline:hover {
  border-color: #9CA3AF;
  color: #374151;
  background: transparent;
}
</style>

<p class="pj-intro">
  <span class="lang-zh">研究專案與實用工具——結合醫療大數據、AI 應用與臨床研究方法論。</span>
  <span class="lang-en">Research projects and practical tools — bridging healthcare big data, AI applications, and clinical research methodology.</span>
</p>

{% assign research_projects = site.projects | where: "category", "research" | sort: "importance" %}
{% assign tools_projects    = site.projects | where: "category", "tools"    | sort: "importance" %}
{% assign research_count = research_projects | size %}
{% assign tools_count    = tools_projects    | size %}

{% if research_count > 0 %}
<section class="pj-section" id="research">
  <div class="pj-cat-banner">
    <h2 class="pj-cat-title">
      <span class="lang-zh">研究專案</span>
      <span class="lang-en">Research Projects</span>
    </h2>
    <span class="pj-cat-sub">
      <span class="lang-zh">Research Projects</span>
      <span class="lang-en">研究專案</span>
    </span>
  </div>
  <hr class="pj-rule">

  <div class="pj-grid">
    {% for project in research_projects %}
    {% assign status_class = project.status | replace: "_", "-" %}
    <div class="pj-card">
      <div class="pj-card-header">
        <h3 class="pj-title">
          {% if project.cover_title %}
            <span class="lang-zh">{{ project.cover_title }}</span>
            <span class="lang-en">{{ project.cover_title_en | default: project.cover_title }}</span>
          {% elsif project.title_en %}
            <span class="lang-zh">{{ project.title }}</span>
            <span class="lang-en">{{ project.title_en }}</span>
          {% else %}
            {{ project.title }}
          {% endif %}
        </h3>
        {% if project.status %}
        <span class="pj-status pj-status-{{ status_class }}">
          <span class="lang-zh">{% if project.status == "in_progress" %}進行中{% elsif project.status == "completed" %}已完成{% elsif project.status == "maintained" %}持續維護{% endif %}</span>
          <span class="lang-en">{% if project.status == "in_progress" %}In Progress{% elsif project.status == "completed" %}Completed{% elsif project.status == "maintained" %}Maintained{% endif %}</span>
        </span>
        {% endif %}
      </div>
      {% if project.type_label %}
      <p class="pj-type">
        <span class="lang-zh">{{ project.type_label }}</span>
        <span class="lang-en">{{ project.type_label_en }}</span>
      </p>
      {% endif %}
      <p class="pj-desc">
        {% if project.description_en %}
          <span class="lang-zh">{{ project.description }}</span>
          <span class="lang-en">{{ project.description_en }}</span>
        {% else %}
          {{ project.description }}
        {% endif %}
      </p>
      <div class="pj-actions">
        {% if project.github %}
          <a href="{{ project.github }}" target="_blank" rel="noopener noreferrer" class="pj-btn">
            <span class="lang-zh">程式碼 ↗</span><span class="lang-en">Code ↗</span>
          </a>
        {% endif %}
        {% if project.google_drive %}
          <a href="{{ project.google_drive }}" target="_blank" rel="noopener noreferrer" class="pj-btn">
            <span class="lang-zh">資料 ↗</span><span class="lang-en">Data ↗</span>
          </a>
        {% endif %}
        <a href="{% if project.redirect %}{{ project.redirect }}{% else %}{{ project.url | relative_url }}{% endif %}" class="pj-btn pj-btn-outline">
          <span class="lang-zh">詳細說明</span><span class="lang-en">Read more</span>
        </a>
      </div>
    </div>
    {% endfor %}
  </div>
</section>
{% endif %}

{% if tools_count > 0 %}
<section class="pj-section" id="tools">
  <div class="pj-cat-banner">
    <h2 class="pj-cat-title">
      <span class="lang-zh">實用工具</span>
      <span class="lang-en">Practical Tools</span>
    </h2>
    <span class="pj-cat-sub">
      <span class="lang-zh">Practical Tools</span>
      <span class="lang-en">實用工具</span>
    </span>
  </div>
  <hr class="pj-rule">

  <div class="pj-grid">
    {% for project in tools_projects %}
    {% assign status_class = project.status | replace: "_", "-" %}
    <div class="pj-card">
      <div class="pj-card-header">
        <h3 class="pj-title">
          {% if project.cover_title %}
            <span class="lang-zh">{{ project.cover_title }}</span>
            <span class="lang-en">{{ project.cover_title_en | default: project.cover_title }}</span>
          {% elsif project.title_en %}
            <span class="lang-zh">{{ project.title }}</span>
            <span class="lang-en">{{ project.title_en }}</span>
          {% else %}
            {{ project.title }}
          {% endif %}
        </h3>
        {% if project.status %}
        <span class="pj-status pj-status-{{ status_class }}">
          <span class="lang-zh">{% if project.status == "in_progress" %}進行中{% elsif project.status == "completed" %}已完成{% elsif project.status == "maintained" %}持續維護{% endif %}</span>
          <span class="lang-en">{% if project.status == "in_progress" %}In Progress{% elsif project.status == "completed" %}Completed{% elsif project.status == "maintained" %}Maintained{% endif %}</span>
        </span>
        {% endif %}
      </div>
      {% if project.type_label %}
      <p class="pj-type">
        <span class="lang-zh">{{ project.type_label }}</span>
        <span class="lang-en">{{ project.type_label_en }}</span>
      </p>
      {% endif %}
      <p class="pj-desc">
        {% if project.description_en %}
          <span class="lang-zh">{{ project.description }}</span>
          <span class="lang-en">{{ project.description_en }}</span>
        {% else %}
          {{ project.description }}
        {% endif %}
      </p>
      <div class="pj-actions">
        {% if project.github %}
          <a href="{{ project.github }}" target="_blank" rel="noopener noreferrer" class="pj-btn">
            <span class="lang-zh">程式碼 ↗</span><span class="lang-en">Code ↗</span>
          </a>
        {% endif %}
        {% if project.google_drive %}
          <a href="{{ project.google_drive }}" target="_blank" rel="noopener noreferrer" class="pj-btn">
            <span class="lang-zh">資料 ↗</span><span class="lang-en">Data ↗</span>
          </a>
        {% endif %}
        <a href="{% if project.redirect %}{{ project.redirect }}{% else %}{{ project.url | relative_url }}{% endif %}" class="pj-btn pj-btn-outline">
          <span class="lang-zh">詳細說明</span><span class="lang-en">Read more</span>
        </a>
      </div>
    </div>
    {% endfor %}
  </div>
</section>
{% endif %}
