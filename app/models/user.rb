class User < ApplicationRecord
  def show_tests_list_by(level)
    Test.joins("JOIN results ON tests.id = results.test_id")
    .where(level: level, results: {user_id: id})
  end

  has_many :tests, as: :author 
  has_many :tests_users
  has_many :tests, through: :tests_users 

end
