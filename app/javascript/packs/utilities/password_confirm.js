document.addEventListener('turbolinks:load', function() {
  var confirmationField = document.querySelector('.password-confirm')
  if (confirmationField) { confirmationField.addEventListener('input', matchNotification) }
})

function matchNotification() {
  var password = document.querySelector('.password')
  var matchMessage = document.querySelector('.text-success')
  var notMatchMessage = document.querySelector('.text-danger')

  
 // console.log(notMatch.classList)
  
  if (password.value != this.value) {
    notMatchMessage.classList.remove('hide')
  }
  else {
    matchMessage.classList.remove('hide')
    notMatchMessage.classList.add('hide')}
}