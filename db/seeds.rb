# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  {name: 'Yarolsav'},
  {name: 'Daniil'}
])

categories = Category.create!([
  {title:'Backend'}, 
  {title: 'Frontend'}
])

tests = Test.create!([
  {title: 'Ruby', level: 1, author_id: users[1].id, category_id: categories[0].id},
  {title: 'Rails', level: 0, author_id: users[0].id, category_id: categories[0].id}, 
  {title: 'JavaScript', level: 0, author_id: users[0].id, category_id: categories[1].id}, 
  {title:'CSS',level:1,author_id: users[1].id, category_id: categories[1].id}
])

questions = Question.create!([
  {title: 'Кто написал язык Ruby?', test_id: tests[0].id},
  {title: 'В каком году написали фреймворк Ruby on Rails?', test_id: tests[1].id},
  {title: 'В каком году написали JavaScript', test_id: tests[2].id},
  {title: 'В каком году написали CSS', test_id:tests[3].id}
])

answers = Answer.create!([
  {title: '1995', correct: 1, question_id: questions[0].id},
  {title: '1996', question_id: questions[0].id},
  {title: '2004', correct: 1, question_id: questions[1].id},
  {title: '2003', question_id: questions[1].id},
  {title: '1995', correct: 1, question_id: questions[2].id},
  {title: '1998', question_id: questions[2].id},
  {title: '1996', correct: 1, question_id: questions[3].id},
  {title: '1995', question_id: questions[3].id}
])

tests_users = TestsUser.create!([
  {user_id: users[0].id, test_id: tests[0].id},
  {user_id: users[0].id, test_id: tests[3].id},
  {user_id: users[1].id, test_id: tests[1].id},
  {user_id: users[1].id, test_id: tests[2].id}
])



