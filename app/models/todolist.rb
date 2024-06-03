class Todolist < ApplicationRecord
  belongs_to :todo
  belongs_to :user
end
