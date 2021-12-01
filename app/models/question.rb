class Question < ApplicationRecord
  belongs_to :test
  
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validate :validate_number_of_answers

  private
  def validate_number_of_answers
    errors.add :base, :invalid, message: "Question can only have 1..4 answers" if answers.length > 4
  end
end
