document.addEventListener('turbolinks:load', function() {
  const rule_type = document.getElementById('badge_rule_type')
  if (rule_type) {
    rule_type.addEventListener("change", function () {
      rule_parameter_vision(rule_type.value)
    })
  }
})

function rule_parameter_vision(value){
  const levelSelector = document.querySelector('.level-selector')
  const categorySelector = document.querySelector('.category-selector')
  if (value == "Level") {
    levelSelector.classList.remove('hide')
    categorySelector.classList.add('hide')
  } else if (value == "Category") {
    levelSelector.classList.add('hide')
    categorySelector.classList.remove('hide')
  } else {
    levelSelector.classList.add('hide')
    categorySelector.classList.add('hide')
  }
}
