document.addEventListener('turbolinks:load', function () {
  var progress = document.querySelector('.progress')

  if (progress) {
    var newValue = progress.dataset.progressValue - 1
    progress.value = newValue
  }
})