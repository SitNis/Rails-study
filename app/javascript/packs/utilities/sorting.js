document.addEventListener('turbolinks:load', function () {
  const control = document.querySelector('.sort-by-title')
  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  const table = document.querySelector('table')

  const rows = table.querySelectorAll('tr')
  const sortedRows = []

  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  const arrowUp = table.querySelector('.octicon-arrow-up')
  const arrowDown = table.querySelector('.octicon-arrow-down')
  if (arrowUp.classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    arrowUp.classList.remove('hide')
    arrowDown.classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    arrowDown.classList.remove('hide')
    arrowUp.classList.add('hide')
  }

  const sortedTable = document.createElement('table')

  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  for (let i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent
  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent
  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
