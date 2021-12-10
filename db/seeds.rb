# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  {email: 'example1@test.com', password_digest:BCrypt::Password.create('123')},
  {email: 'example2@test.com', password_digest:BCrypt::Password.create('1234')}
])

categories = Category.create!([
  {title:'Backend'}, 
  {title: 'Frontend'}
])

tests = Test.create!([
  {title: 'Ruby', level: 1, author: users[1], category: categories[0]},
  {title: 'Rails', level: 0, author: users[0], category: categories[0]}, 
  {title: 'JavaScript', level: 0, author: users[0], category: categories[1]}, 
  {title:'CSS',level:1, author: users[1], category: categories[1]}
])

questions = Question.create!([
  {title: 'Кто написал язык Ruby?', test: tests[0]},
  {title: 'В каком году написали фреймворк Ruby on Rails?', test: tests[1]},
  {title: 'В каком году написали JavaScript', test: tests[2]},
  {title: 'В каком году написали CSS', test:tests[3]}
])

answers = Answer.create!([
  {title: '1995', correct: 1, question: questions[0]},
  {title: '1996', question: questions[0]},
  {title: '2004', correct: 1, question: questions[1]},
  {title: '2003', question: questions[1]},
  {title: '1995', correct: 1, question: questions[2]},
  {title: '1998', question: questions[2]},
  {title: '1996', correct: 1, question: questions[3]},
  {title: '1995', question: questions[3]}
])
