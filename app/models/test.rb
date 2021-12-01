class Test < ApplicationRecord

  belongs_to :author, class_name: "User", foreign_key: 'author_id'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users, dependent: :destroy

  def self.tests_by(category)
      joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end

end
