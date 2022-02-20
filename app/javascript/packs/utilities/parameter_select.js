document.addEventListener('turbolinks:load', function() {
  const rule_type = document.getElementById('badge_rule_type')
  const levelSelector = document.querySelector('.level-selector')
  const categorySelector = document.querySelector('.category-selector')
  if (rule_type) {
    rule_type.addEventListener("change", function () {
      rule_parameter_vision(rule_type.value, levelSelector, categorySelector)
    })
  }
})

function rule_parameter_vision(value, levelSelector, categorySelector){
  const rule_parameter_selector = document.querySelector('.parameter-selector')
  if (value == "Level") {
    rule_parameter_selector.appendChild(levelSelector)
    levelSelector.classList.remove('hide')
    rule_parameter_selector.removeChild(categorySelector)
  } else if (value == "Category") {
    rule_parameter_selector.appendChild(categorySelector)
    categorySelector.classList.remove('hide')
    rule_parameter_selector.removeChild(levelSelector)
  } else {
    levelSelector.classList.add('hide')
    categorySelector.classList.add('hide')
  }
}
