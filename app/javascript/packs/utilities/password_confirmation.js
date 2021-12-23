document.addEventListener('turbolinks:load', function () {
  var confirmation_password = document.querySelector('.confirmation-password')
  confirmation_password.addEventListener('keyup', checkPassword)
})

function checkPassword() {
  let password = document.querySelector('.password').querySelector('input')
  let confirmation_password = document.querySelector('.confirmation-password').querySelector('input')
  if (password.value === confirmation_password.value) {
    confirmation_password.classList.remove('invalid')
    confirmation_password.classList.add('valid')
  } else {
    confirmation_password.classList.remove('valid')
    confirmation_password.classList.add('invalid')
  }
}
