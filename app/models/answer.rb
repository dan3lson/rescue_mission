class Answer < ActiveRecord::Base
  belongs_to :question

  validates :description, presence: true
  validates :question_id, presence: true
end
