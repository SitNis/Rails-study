class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :set_current_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  def successful?
    sum_result >= SUCCESS_RATIO
  end

  def sum_result
    result = self.correct_questions.to_f / self.test.questions.count.to_f * 100
  end

  private

  SUCCESS_RATIO = 85.freeze

  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    if answer_ids
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = test.questions.order(:id).where('id > ?', self.current_question.id).first
    end
  end

end