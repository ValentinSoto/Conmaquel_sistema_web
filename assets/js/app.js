// ============================================================
// CONMAQUEL — app.js
// Interacciones compartidas del panel administrativo
// ============================================================
(function () {
  const shell = document.querySelector('.cq-shell');
  const root = document.documentElement;

  // ---- Tema claro/oscuro ----
  const THEME_KEY = 'cq-theme';
  function applyTheme(theme) {
    root.setAttribute('data-theme', theme);
    document.querySelectorAll('[data-theme-icon]').forEach((el) => {
      el.className = theme === 'dark' ? 'fa-solid fa-sun' : 'fa-solid fa-moon';
    });
  }
  const savedTheme = (typeof Storage !== 'undefined' && sessionStorage.getItem(THEME_KEY)) || 'light';
  applyTheme(savedTheme);

  document.querySelectorAll('[data-action="toggle-theme"]').forEach((btn) => {
    btn.addEventListener('click', () => {
      const next = root.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
      applyTheme(next);
      try { sessionStorage.setItem(THEME_KEY, next); } catch (e) {}
    });
  });

  // ---- Colapsar sidebar (desktop) ----
  document.querySelectorAll('[data-action="toggle-sidebar"]').forEach((btn) => {
    btn.addEventListener('click', () => shell && shell.classList.toggle('collapsed'));
  });

  // ---- Sidebar móvil ----
  document.querySelectorAll('[data-action="toggle-mobile-nav"]').forEach((btn) => {
    btn.addEventListener('click', () => shell && shell.classList.toggle('mobile-open'));
  });
  document.addEventListener('click', (e) => {
    if (!shell || !shell.classList.contains('mobile-open')) return;
    if (e.target.closest('.cq-sidebar') || e.target.closest('[data-action="toggle-mobile-nav"]')) return;
    shell.classList.remove('mobile-open');
  });

  // ---- Confirmación de eliminación (delegado) ----
  document.querySelectorAll('[data-action="confirm-delete"]').forEach((btn) => {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      const modalEl = document.getElementById('modalConfirmarEliminar');
      if (modalEl && window.bootstrap) {
        const name = btn.getAttribute('data-name') || 'este registro';
        modalEl.querySelector('[data-target-name]').textContent = name;
        new bootstrap.Modal(modalEl).show();
      }
    });
  });

  // ---- Validación de formularios Bootstrap ----
  document.querySelectorAll('form.needs-validation').forEach((form) => {
    form.addEventListener('submit', (event) => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });
})();

