---
layout: page
title: 課程資料
title_en: Courses
permalink: /teaching/
description: ""
nav: false
---

<style>
/* ── Teaching page: academic layout ─────────────────── */

.t-intro {
  font-size: 0.95rem;
  line-height: 1.85;
  color: #6B7280;
  margin-bottom: 3rem;
}

.t-section { margin-bottom: 3.5rem; }

.t-cat-title {
  font-size: 1.4rem;
  font-weight: 700;
  color: #111827;
  margin-bottom: 0.1rem;
  letter-spacing: -0.01em;
}

.t-cat-sub {
  font-size: 0.8125rem;
  color: #9CA3AF;
  font-weight: 400;
  display: block;
  margin-bottom: 1rem;
}

.t-rule {
  border: 0;
  border-top: 1px solid #E5E7EB;
  margin: 0 0 1.75rem 0;
}

/* Card */
.t-card {
  border: 1px solid #E5E7EB;
  border-radius: 8px;
  padding: 1.35rem 1.4rem;
  height: 100%;
  display: flex;
  flex-direction: column;
  transition: border-color 0.15s ease, box-shadow 0.15s ease;
}

.t-card:hover {
  border-color: #9CA3AF;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.07);
}

/* Typography inside card */
.t-name {
  font-size: 1.1rem;
  font-weight: 600;
  color: #1F2937;
  line-height: 1.3;
}

.t-meta-semester {
  font-size: 0.875rem;
  font-weight: 500;
  color: #374151;
  margin-top: 0.5rem;
  margin-bottom: 0.2rem;
}

.t-meta-dept {
  font-size: 0.8rem;
  color: #9CA3AF;
  margin-bottom: 1.1rem;
}

/* Status pills */
.t-pill {
  display: inline-block;
  font-size: 0.6875rem;
  font-weight: 500;
  padding: 0.15rem 0.6rem;
  border-radius: 20px;
  letter-spacing: 0.01em;
  white-space: nowrap;
  vertical-align: middle;
  margin-left: 0.35rem;
}

.t-pill-archived { background: #F3F4F6; color: #6B7280; }
.t-pill-active   { background: #D1FAE5; color: #065F46; }
.t-pill-upcoming { background: #DBEAFE; color: #1E40AF; }

/* Buttons */
.t-btn {
  display: inline-block;
  font-size: 0.8rem;
  padding: 0.3rem 0.75rem;
  border-radius: 5px;
  border: 1px solid;
  text-decoration: none !important;
  transition: background 0.12s ease, color 0.12s ease;
  white-space: nowrap;
}

.t-btn-primary {
  border-color: var(--global-theme-color, #526EB4);
  color: var(--global-theme-color, #526EB4);
}
.t-btn-primary:hover {
  background: var(--global-theme-color, #526EB4);
  color: #fff !important;
}

.t-btn-outline {
  border-color: #D1D5DB;
  color: #6B7280;
}
.t-btn-outline:hover {
  border-color: #9CA3AF;
  color: #374151;
}

.t-btn-disabled {
  border-color: #E5E7EB;
  color: #D1D5DB;
  cursor: default;
  pointer-events: none;
}

/* Past offerings */
details.t-past { margin-top: 1rem; }

details.t-past > summary {
  font-size: 0.78rem;
  color: #9CA3AF;
  cursor: pointer;
  user-select: none;
  list-style: none;
  padding-left: 0;
}

details.t-past > summary::-webkit-details-marker,
details.t-past > summary::marker { display: none; }

details.t-past > summary::before { content: '▸\00a0'; font-size: 0.7rem; }
details.t-past[open] > summary::before { content: '▾\00a0'; }
details.t-past > summary:hover { color: #6B7280; }

.t-past-list {
  list-style: none;
  padding: 0;
  margin: 0.5rem 0 0 0;
}

.t-past-list li {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.35rem 0;
  font-size: 0.8rem;
  color: #6B7280;
  border-bottom: 1px solid #F9FAFB;
}

.t-past-list li:last-child { border-bottom: none; }

/* Active banner */
.t-active-banner {
  display: flex;
  align-items: center;
  gap: 0.6rem;
  font-size: 0.875rem;
  color: #374151;
  background: #F0FDF4;
  border: 1px solid #BBF7D0;
  border-radius: 6px;
  padding: 0.55rem 1rem;
  margin-bottom: 2.5rem;
}

.t-active-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: #16A34A;
  flex-shrink: 0;
  box-shadow: 0 0 0 2px #DCFCE7;
}
</style>

<p class="t-intro">
  Teaching materials and course resources.<br>
  課程教材與學習資源，依專業領域分類。
</p>

{% assign active_now = site.data.courses.courses | where: "status", "active" %}
{% if active_now.size > 0 %}
<div class="t-active-banner">
  <span class="t-active-dot"></span>
  <span class="lang-zh">本學期開課：{% for c in active_now %}{{ c.school }} {{ c.department }}・{{ c.title }}{% unless forloop.last %}　{% endunless %}{% endfor %}</span>
  <span class="lang-en">Current semester: {% for c in active_now %}{{ c.school }} {{ c.department }} · {{ c.title_en }}{% unless forloop.last %}&ensp;{% endunless %}{% endfor %}</span>
</div>
{% endif %}

{% assign cats    = "統計與研究方法|護理與醫學|健康政策與經濟|教育與教學" | split: "|" %}
{% assign cats_en = "Statistics & Research Methods|Nursing & Medicine|Health Policy & Economics|Education & Teaching" | split: "|" %}

{% for i in (0..3) %}
{% assign cat    = cats[i] %}
{% assign cat_en = cats_en[i] %}
{% assign cat_courses = site.data.courses.courses | where: "subject_category", cat %}
{% if cat_courses.size == 0 %}{% continue %}{% endif %}
{% assign subjects = cat_courses | map: "title" | uniq %}

<section class="t-section">
  <h3 class="t-cat-title">{{ cat }}</h3>
  <span class="t-cat-sub">{{ cat_en }}</span>
  <hr class="t-rule">

  <div class="row g-4">
    {% for subj_title in subjects %}
      {% assign group = cat_courses | where: "title", subj_title %}
      {% assign title_en = group[0].title_en %}

      {% assign upcoming_g = group | where: "status", "upcoming" %}
      {% assign active_g   = group | where: "status", "active"   %}
      {% assign archived_g = group | where: "status", "archived" %}

      {% if upcoming_g.size > 0 %}{% assign primary = upcoming_g | last %}
      {% elsif active_g.size   > 0 %}{% assign primary = active_g   | last %}
      {% else %}{% assign primary = archived_g | last %}
      {% endif %}

      {% assign pid = primary.course_id %}
      {% assign past = group | where_exp: "c", "c.course_id != pid" %}

      <div class="col-12 col-md-6 col-xl-4">
        <div class="t-card">

          <div class="d-flex align-items-baseline flex-wrap gap-1">
            <span class="t-name">
              <span class="lang-zh">{{ subj_title }}</span>
              <span class="lang-en">{{ title_en }}</span>
            </span>
            <span class="t-pill t-pill-{{ primary.status }}">
              <span class="lang-zh">{% if primary.status == "archived" %}已結束{% elsif primary.status == "active" %}進行中{% else %}即將開課{% endif %}</span>
              <span class="lang-en">{% if primary.status == "archived" %}Archived{% elsif primary.status == "active" %}Active{% else %}Upcoming{% endif %}</span>
            </span>
          </div>

          <p class="t-meta-semester">
            <span class="lang-zh">{{ primary.semester }}</span>
            <span class="lang-en">{{ primary.semester_en }}</span>
          </p>
          <p class="t-meta-dept">{{ primary.school }} · {{ primary.department }}</p>

          <div class="d-flex flex-wrap gap-2 mt-auto">
            {% if primary.drive_folder and primary.drive_folder != "" %}
              <a href="{{ primary.drive_folder }}" target="_blank" rel="noopener noreferrer" class="t-btn t-btn-primary">
                <span class="lang-zh">課程資料夾</span><span class="lang-en">Course Folder</span>
                <i class="fa-solid fa-arrow-up-right-from-square fa-xs ms-1"></i>
              </a>
            {% elsif primary.status != "archived" %}
              <span class="t-btn t-btn-disabled">
                <span class="lang-zh">課程資料夾（籌備中）</span><span class="lang-en">Folder (Coming Soon)</span>
              </span>
            {% endif %}
            {% if primary.syllabus_link and primary.syllabus_link != "" %}
              <a href="{{ primary.syllabus_link }}" target="_blank" rel="noopener noreferrer" class="t-btn t-btn-outline">
                <span class="lang-zh">課程大綱</span><span class="lang-en">Syllabus</span>
                <i class="fa-solid fa-arrow-up-right-from-square fa-xs ms-1"></i>
              </a>
            {% endif %}
          </div>

          {% if past.size > 0 %}
          <details class="t-past">
            <summary>
              <span class="lang-zh">其他開課記錄（{{ past.size }} 期）</span>
              <span class="lang-en">Other offerings ({{ past.size }})</span>
            </summary>
            <ul class="t-past-list">
              {% for pc in past %}
              <li>
                <span>
                  <span class="lang-zh">{{ pc.semester }}</span>
                  <span class="lang-en">{{ pc.semester_en }}</span>
                  <span class="t-pill t-pill-{{ pc.status }}">
                    <span class="lang-zh">{% if pc.status == "archived" %}已結束{% elsif pc.status == "active" %}進行中{% else %}即將開課{% endif %}</span>
                    <span class="lang-en">{% if pc.status == "archived" %}Archived{% elsif pc.status == "active" %}Active{% else %}Upcoming{% endif %}</span>
                  </span>
                </span>
                {% if pc.drive_folder and pc.drive_folder != "" %}
                  <a href="{{ pc.drive_folder }}" target="_blank" rel="noopener noreferrer" class="text-muted ms-2" style="font-size:0.75rem;">
                    <i class="fa-solid fa-folder-open"></i>
                  </a>
                {% endif %}
              </li>
              {% endfor %}
            </ul>
          </details>
          {% endif %}

        </div>
      </div>
    {% endfor %}

  </div>
</section>

{% endfor %}
