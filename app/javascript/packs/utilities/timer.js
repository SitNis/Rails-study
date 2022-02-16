document.addEventListener('turbolinks:load', function () {
  const timer = document.querySelector('.timer')
  if (timer && timer.dataset.time) {
    timeRemaining(timer)
  }
})

function timeRemaining(timer) {
  let time = Number(timer.dataset.time)
  const clock = setInterval(function() {
    const testPassageId = timer.dataset.testPassageId
    const seconds = Math.floor(time%60)
    const minutes = Math.floor(time/60)
    const hours = Math.floor(time/3600)
    timer
    if (time <= 0) {
      clearInterval(clock)
      window.location.replace("/test_passages/" + testPassageId + "/result")
    }
    else {
      timer.innerHTML = (hours + ":" + minutes + ":" + seconds)
      --time
    }
  },1000)
}
