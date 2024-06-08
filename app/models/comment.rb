class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :todo

  validates :comment, presence: true
end
