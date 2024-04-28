// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

window.toggleDropdown = function(name) {
  document.getElementById(name+"-dropdown-menu").classList.toggle("hidden");
}

document.addEventListener("turbo:load", function() {
  document.body.addEventListener('click', function(e) {
    if (e.target.matches('.add_fields')) {
      e.preventDefault();
      let time = new Date().getTime();
      let regexp = new RegExp(e.target.dataset.id, 'g');
      e.target.insertAdjacentHTML('beforebegin', e.target.dataset.fields.replace(regexp, time));
    }

    if (e.target.matches('.remove_fields')) {
      e.preventDefault();
      let fieldWrapper = e.target.closest('.fields');
      fieldWrapper.style.display = 'none';
      fieldWrapper.querySelector('input[type=hidden]').value = '1';
    }
  });
});
