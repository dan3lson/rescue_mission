class User < ActiveRecord::Base
  belongs_to :question

  validates :description, presence: true
end
