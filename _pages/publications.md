---
layout: page
permalink: /publications/
title: publications
title_zh: 論文發表
description: Publications in peer-reviewed journals and academic conferences, listed by year.
description_zh: 學術期刊與研討會發表論文，依年份倒序排列。
nav: true
nav_order: 2
---

<style>
/* ── Layout: main + sticky TOC ─────────────────── */
.pub-layout {
  display: flex;
  gap: 2rem;
  align-items: flex-start;
}

.pub-main {
  flex: 1;
  min-width: 0;
}

.pub-toc-aside {
  width: 160px;
  flex-shrink: 0;
  position: sticky;
  top: 100px;
  max-height: calc(100vh - 130px);
  overflow-y: auto;
}

@media (max-width: 1024px) {
  .pub-toc-aside { display: none; }
}

/* ── TOC nav ─── */
#pub-toc {
  padding: 12px 0;
}

.pub-toc-section {
  margin-bottom: 1.25rem;
}

.pub-toc-heading {
  font-size: 0.7rem;
  font-weight: 600;
  color: #9CA3AF;
  letter-spacing: 0.04em;
  text-transform: uppercase;
  padding: 0 8px 6px 8px;
}

.pub-toc-link {
  display: block;
  font-size: 0.8125rem;
  color: #6B7280;
  padding: 4px 8px;
  border-radius: 4px;
  text-decoration: none !important;
  transition: background 0.12s, color 0.12s;
  line-height: 1.4;
}

.pub-toc-link:hover {
  background: #F3E8FF;
  color: #5B21B6;
  text-decoration: none !important;
}

.pub-toc-link.active {
  background: #5B21B6;
  color: #fff !important;
  font-weight: 500;
}

.pub-toc-count {
  font-size: 0.7rem;
  opacity: 0.7;
}

/* ── Section structure ─── */
.pub-section {
  margin-bottom: 5rem;
}

.pub-cat-banner {
  border-left: 4px solid var(--global-theme-color, #526EB4);
  padding-left: 16px;
  margin-bottom: 0.5rem;
}

.pub-cat-title {
  font-size: 2rem;
  font-weight: 700;
  color: #111827;
  margin: 0;
  letter-spacing: -0.02em;
  line-height: 1.15;
}

.pub-cat-sub {
  font-size: 0.875rem;
  color: #9CA3AF;
  font-weight: 400;
  display: block;
  margin-top: 0.3rem;
}

.pub-rule {
  border: 0;
  border-top: 1px solid #E5E7EB;
  margin: 1.25rem 0 0 0;
}

/* ── Search enhancements ─── */
.pub-search-wrapper {
  position: relative;
  margin-bottom: 0.75rem;
}

.pub-search-icon {
  position: absolute;
  left: 10px;
  top: 50%;
  transform: translateY(-50%);
  color: #9CA3AF;
  font-size: 0.8rem;
  pointer-events: none;
  z-index: 1;
}

.pub-search-wrapper input#bibsearch {
  padding-left: 2rem !important;
}

.pub-search-feedback {
  font-size: 0.8125rem;
  color: #6B7280;
  margin-bottom: 1.5rem;
  min-height: 1.2em;
}

.pub-search-feedback.pub-search-empty {
  color: #9CA3AF;
  font-style: italic;
}

/* ── Conference badge color overrides (applied via JS) ─── */
.pub-conf abbr.badge {
  font-size: 0.65rem;
  font-weight: 600;
  padding: 0.25rem 0.4rem;
  white-space: normal;
  line-height: 1.3;
  text-align: center;
}

/* ── Back to top button ─── */
#pub-back-top {
  position: fixed;
  bottom: 24px;
  right: 24px;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: #5B21B6;
  color: #fff;
  border: none;
  cursor: pointer;
  font-size: 1.1rem;
  line-height: 1;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.2s ease, transform 0.15s ease;
  z-index: 999;
  display: flex;
  align-items: center;
  justify-content: center;
}

#pub-back-top.visible {
  opacity: 1;
  pointer-events: auto;
}

#pub-back-top:hover {
  transform: scale(1.1);
}
</style>

<!-- Bibsearch Feature -->
<div class="pub-search-wrapper">
  <span class="pub-search-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
  {% include bib_search.liquid %}
</div>
<div id="pub-search-feedback" class="pub-search-feedback"></div>

<div class="pub-layout">

  <!-- ── Main content ─── -->
  <div class="pub-main">

    <!-- Section 1: Journal Articles -->
    <section class="pub-section">
      <div class="pub-cat-banner">
        <h3 class="pub-cat-title">
          <span class="lang-zh">期刊論文</span>
          <span class="lang-en">Journal Articles</span>
        </h3>
        <span class="pub-cat-sub">
          <span class="lang-zh">Journal Articles</span>
          <span class="lang-en">期刊論文</span>
        </span>
      </div>
      <hr class="pub-rule">
      <div class="publications pub-journal">
        {% bibliography --query @article --sort_by month --order descending %}
      </div>
    </section>

    <!-- Section 2: Conference Papers -->
    <section class="pub-section">
      <div class="pub-cat-banner">
        <h3 class="pub-cat-title">
          <span class="lang-zh">研討會論文</span>
          <span class="lang-en">Conference Papers</span>
        </h3>
        <span class="pub-cat-sub">
          <span class="lang-zh">Conference Papers</span>
          <span class="lang-en">研討會論文</span>
        </span>
      </div>
      <hr class="pub-rule">
      <div class="publications pub-conf">
        {% bibliography --query @inproceedings --sort_by year --order descending %}
      </div>
    </section>

  </div><!-- /.pub-main -->

  <!-- ── Sticky TOC (desktop only) ─── -->
  <aside class="pub-toc-aside">
    <nav id="pub-toc" aria-label="Year navigation"></nav>
  </aside>

</div><!-- /.pub-layout -->

<!-- Back to top -->
<div><button id="pub-back-top" aria-label="Back to top" title="回到頂部">↑</button></div>

<script>
document.addEventListener('DOMContentLoaded', function () {

  /* ── 1. Collapsible year headers ─── */
  document.querySelectorAll('h2.bibliography').forEach(function (h2) {
    var ol = h2.nextElementSibling;
    if (ol && ol.tagName === 'OL') {
      h2.addEventListener('click', function () {
        h2.classList.toggle('bib-collapsed');
        ol.classList.toggle('bib-collapsed');
      });
    }
  });

  /* ── 2. Conference badge colors ─── */
  var confBadgeColors = {
    'Oral':    { bg: '#FED7AA', color: '#9A3412' },
    'Poster':  { bg: '#A7F3D0', color: '#065F46' },
    'Keynote': { bg: '#DDD6FE', color: '#5B21B6' },
    'Invited': { bg: '#FBCFE8', color: '#9D174D' },
  };
  document.querySelectorAll('.pub-conf abbr.badge').forEach(function (el) {
    var text = el.textContent.trim();
    if (confBadgeColors[text]) {
      el.style.setProperty('background-color', confBadgeColors[text].bg, 'important');
      el.style.setProperty('color', confBadgeColors[text].color, 'important');
    }
  });

  /* ── 3. Build TOC dynamically from rendered DOM ─── */
  function buildTOC() {
    var toc = document.getElementById('pub-toc');
    if (!toc) return;

    var sections = [
      { el: document.querySelector('.pub-journal'), labelZh: '期刊論文', labelEn: 'Journal Articles', prefix: 'journal' },
      { el: document.querySelector('.pub-conf'),    labelZh: '研討會論文', labelEn: 'Conference Papers', prefix: 'conf'    },
    ];

    var hasContent = false;

    sections.forEach(function (sec) {
      if (!sec.el) return;
      var h2s = sec.el.querySelectorAll('h2.bibliography');
      if (h2s.length === 0) return;
      hasContent = true;

      var secDiv = document.createElement('div');
      secDiv.className = 'pub-toc-section';

      var heading = document.createElement('div');
      heading.className = 'pub-toc-heading';
      heading.innerHTML =
        '<span class="lang-zh">' + sec.labelZh + '</span>' +
        '<span class="lang-en">' + sec.labelEn + '</span>';
      secDiv.appendChild(heading);

      h2s.forEach(function (h2) {
        var year = h2.textContent.replace(/[▾▸\s]/g, '');
        var ol = h2.nextElementSibling;
        var count = (ol && ol.tagName === 'OL') ? ol.querySelectorAll(':scope > li').length : 0;
        var id = sec.prefix + '-' + year;
        h2.id = id;

        var link = document.createElement('a');
        link.href = '#' + id;
        link.className = 'pub-toc-link';
        link.innerHTML = year + ' <span class="pub-toc-count">(' + count + ')</span>';
        link.addEventListener('click', function (e) {
          e.preventDefault();
          document.getElementById(id).scrollIntoView({ behavior: 'smooth', block: 'start' });
        });
        secDiv.appendChild(link);
      });

      toc.appendChild(secDiv);
    });

    if (!hasContent) {
      var aside = document.querySelector('.pub-toc-aside');
      if (aside) aside.style.display = 'none';
    }
  }

  buildTOC();

  /* ── 4. Scroll-based TOC highlighting ─── */
  function setupScrollHighlight() {
    var allH2s = Array.from(document.querySelectorAll('h2.bibliography[id]'));
    if (allH2s.length === 0) return;

    function updateActive() {
      var scrollY = window.scrollY + 160;
      var activeH2 = null;

      allH2s.forEach(function (h2) {
        if (h2.offsetTop <= scrollY) {
          activeH2 = h2;
        }
      });

      document.querySelectorAll('.pub-toc-link').forEach(function (link) {
        link.classList.remove('active');
      });

      if (activeH2) {
        var link = document.querySelector('.pub-toc-link[href="#' + activeH2.id + '"]');
        if (link) link.classList.add('active');
      }
    }

    window.addEventListener('scroll', updateActive, { passive: true });
    updateActive();
  }

  setupScrollHighlight();

  /* ── 5. Back to top button ─── */
  var backBtn = document.getElementById('pub-back-top');
  if (backBtn) {
    window.addEventListener('scroll', function () {
      backBtn.classList.toggle('visible', window.scrollY > 500);
    }, { passive: true });

    backBtn.addEventListener('click', function () {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  /* ── 6. Search: placeholder + result feedback ─── */
  var searchInput = document.getElementById('bibsearch');
  var feedback = document.getElementById('pub-search-feedback');

  if (searchInput) {
    searchInput.setAttribute('placeholder',
      document.documentElement.lang === 'zh' || document.documentElement.getAttribute('data-lang') === 'zh'
        ? '搜尋標題・作者・期刊・年份...'
        : 'Search title, author, journal, or year...'
    );
    /* Safe fallback: check body/html for lang class */
    if (!searchInput.placeholder || searchInput.placeholder === 'Type to filter') {
      searchInput.setAttribute('placeholder', '搜尋標題・作者・期刊・年份 / Title, Author, Journal, Year');
    }

    function updateFeedback() {
      var term = searchInput.value.trim();
      if (!term) {
        feedback.style.display = 'none';
        return;
      }
      /* bibsearch.js debounces 300 ms, wait 350 ms to read results */
      setTimeout(function () {
        var visible = document.querySelectorAll('.bibliography > li:not(.unloaded)').length;
        if (visible === 0) {
          feedback.className = 'pub-search-feedback pub-search-empty';
          feedback.innerHTML =
            '<span class="lang-zh">沒有符合的論文，試試其他關鍵字</span>' +
            '<span class="lang-en">No results found. Try different keywords.</span>';
        } else {
          feedback.className = 'pub-search-feedback';
          feedback.innerHTML =
            '<span class="lang-zh">找到 ' + visible + ' 筆結果</span>' +
            '<span class="lang-en">Found ' + visible + ' paper' + (visible > 1 ? 's' : '') + '</span>';
        }
        feedback.style.display = 'block';
      }, 350);
    }

    searchInput.addEventListener('input', updateFeedback);

    /* Clear feedback when input is cleared */
    searchInput.addEventListener('input', function () {
      if (!this.value.trim()) feedback.style.display = 'none';
    });
  }

});
</script>
