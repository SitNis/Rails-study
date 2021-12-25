document.addEventListener('turbolinks:load', () =>{
  const progressBar = document.querySelector('.progress-bar')
  const button = document.querySelector('.next-button')
  if (button) { button.addEventListener('click', progressChange(progressBar)) }
})

function progressChange(progressBar) {
  const questions = progressBar.dataset.questions
  const currentQuestion = progressBar.dataset.currentQuestion
  const valueForOneQuestion = 100/questions

  progressBar.style.width = 100 - (questions - currentQuestion) * valueForOneQuestion + '%'
}
