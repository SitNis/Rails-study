class Test < ApplicationRecord

  belongs_to :author, class_name: "User", foreign_key: 'author_id'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users, dependent: :destroy

  validates :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validate :validate_title_and_level_unique

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }


  def self.tests_by(category)
      joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end

  private

  def validate_title_and_level_unique
    errors.add :base, :invalid, message: "Test with such title and level already exists" if Test.find_by title: title, level: level
  end

end
