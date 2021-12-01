class User < ApplicationRecord

  has_many :created_test, class_name: "Test", foreign_key: "author_id", dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :destroy

  def show_tests_list_by(level)
    tests.where(level: level)
  end
  
end
