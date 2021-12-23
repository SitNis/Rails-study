document.addEventListener('turbolinks:load', function () {
  const confirmation_password = document.querySelector('.confirmation-password')
  const password = document.querySelector('.password')
  confirmation_password.addEventListener('keyup', checkPassword)
  password.addEventListener('keyup', checkPassword)
})

function checkPassword() {
  const password = document.querySelector('.password').querySelector('input')
  const confirmation_password = document.querySelector('.confirmation-password').querySelector('input')
  if (password.value === confirmation_password.value){
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
