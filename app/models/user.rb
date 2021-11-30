class User < ApplicationRecord
  def show_tests_list_by(level)
    Test.joins(:tests_users)
    .where(level: level, tests_users: {user_id: id})
  end

  has_many :created_test, class_name: "Test", foreign_key: "author_id", dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :destroy

end
