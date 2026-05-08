(function () {
  var STORAGE_KEY = 'site-lang';

  function getLang() {
    return localStorage.getItem(STORAGE_KEY) || 'zh';
  }

  function applyLang(lang) {
    document.documentElement.setAttribute('data-lang', lang);
    document.querySelectorAll('.lang-toggle-btn').forEach(function (btn) {
      btn.textContent = lang === 'zh' ? 'EN' : '中';
      btn.setAttribute('title', lang === 'zh' ? 'Switch to English' : '切換為中文');
    });
  }

  function toggleLang() {
    var next = getLang() === 'zh' ? 'en' : 'zh';
    localStorage.setItem(STORAGE_KEY, next);
    applyLang(next);
  }

  document.addEventListener('DOMContentLoaded', function () {
    applyLang(getLang());
  });

  window.toggleLang = toggleLang;
})();
