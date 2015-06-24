class Question < ActiveRecord::Base
  belongs_to :user
  
  before_create :append_question_mark_to_title

  validates :title, presence: true, length: { minimum: 40 }
  validates :description, presence: true, length: { minimum: 150 }

  private
    def append_question_mark_to_title
      self.title << "?" unless self.title[-1] == "?"
    end
end
