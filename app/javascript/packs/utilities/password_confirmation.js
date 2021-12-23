document.addEventListener('turbolinks:load', function () {
  const form = document.querySelector('form')
  const password = form.elements.user_password
  const confirmation_password = form.elements.user_password_confirmation
  form.addEventListener('keyup', function() {
      if(password.value != '') checkPassword(password, confirmation_password)
    })
})

function checkPassword(password, confirmation_password) {
  if (password.value === confirmation_password.value) {
    confirmation_password.classList.remove('invalid')
    confirmation_password.classList.add('valid')
    password.classList.remove('invalid')
    password.classList.add('valid')
  } else if (confirmation_password.value != '') {
    confirmation_password.classList.remove('valid')
    confirmation_password.classList.add('invalid')
    password.classList.remove('valid')
    password.classList.add('invalid')
  }
}
