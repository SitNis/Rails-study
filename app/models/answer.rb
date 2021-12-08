class Answer < ApplicationRecord
  belongs_to :question

  before_validation :before_validation_set_question, on: :create
  validates :title, presence: true
  validate :validate_number_of_answers

  scope :correct, -> { where(correct: true) }

  private

  def before_validation_set_question
    self.question = test.questions.first if test.present?
  end

  def validate_number_of_answers
    errors.add :base, :invalid, message: "Question can only have 1..4 answers" if self.question.answers.count >= 4
  end

end
