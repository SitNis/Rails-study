class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true

  scope :correctly, -> { where(correct: true) }
end
