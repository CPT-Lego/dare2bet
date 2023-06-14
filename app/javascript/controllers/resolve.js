document.addEventListener('DOMContentLoaded', function() {
  const confirmButton = document.querySelector('#confirm-button');
  const resolveButton = document.querySelector('.resolve-button');

  confirmButton.addEventListener('click', function() {
    resolveButton.style.display = 'none';
  });
});
