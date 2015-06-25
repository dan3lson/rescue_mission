class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy

  before_create :append_question_mark_to_title

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :user_id, presence: true

  private
    def append_question_mark_to_title
      self.title << "?" unless self.title[-1] == "?"
    end
end
