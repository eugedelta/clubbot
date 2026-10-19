// Mobile nav: toggles the link panel under the bar on narrow viewports
(function () {
  var nav = document.querySelector('nav');
  var toggle = nav && nav.querySelector('.nav-toggle');
  if (!toggle) return;

  function setOpen(open) {
    nav.classList.toggle('nav-open', open);
    toggle.setAttribute('aria-expanded', open ? 'true' : 'false');
    toggle.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
  }

  toggle.addEventListener('click', function () {
    setOpen(!nav.classList.contains('nav-open'));
  });

  // Close after choosing a link (covers same-page anchors like #interest)
  nav.querySelectorAll('.nav-links a').forEach(function (link) {
    link.addEventListener('click', function () { setOpen(false); });
  });

  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape' && nav.classList.contains('nav-open')) {
      setOpen(false);
      toggle.focus();
    }
  });

  // Reset if the viewport widens past the breakpoint while open
  window.matchMedia('(min-width: 761px)').addEventListener('change', function (e) {
    if (e.matches) setOpen(false);
  });
})();
