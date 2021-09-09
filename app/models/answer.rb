# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_quantity, on: :create

  MAX_ANSWERS = 4

  scope :correct_answers, -> { where(correct: true) }

  private

  def validate_answers_quantity
    if question && question.answers.size > MAX_ANSWERS
      errors.add(:answers_quantity, "error: question can have not more then 4 answers")
    end
  end
end
