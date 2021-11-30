class Test < ApplicationRecord
  def self.tests_by(category)
    joins("JOIN categories ON categories.id = tests.category_id")
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
  belongs_to :user, foreign_key: 'author_id'
  has_many :questions
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users

end
