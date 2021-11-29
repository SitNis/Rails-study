class User < ApplicationRecord
  def show_tests_list_by(level)
    Test.joins("JOIN results ON tests.id = results.test_id")
    .where(level: level, results: {user_id: id})
  end
end
