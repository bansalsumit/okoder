class Question < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :answers
end
