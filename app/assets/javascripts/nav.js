$(function() {
  const nav = document.querySelector('.header__nav');
  const circle = document.querySelector('.header__lists');
  nav.addEventListener('click', function() {
    circle.classList.toggle('open');
  })
}, false);