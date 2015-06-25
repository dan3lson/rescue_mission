class User < ActiveRecord::Base
  has_many :questions
  has_many :answers, through: :questions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
end
