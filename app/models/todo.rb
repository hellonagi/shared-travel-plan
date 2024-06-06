class Todo < ApplicationRecord
  belongs_to :user

  #todoモデルとtodo_listsモデルは1:多
  has_many :todo_lists,class_name: 'Todolist', dependent: :destroy
  #todoモデルの更新とともに、todo_listsも更新
  accepts_nested_attributes_for :todo_lists
end
