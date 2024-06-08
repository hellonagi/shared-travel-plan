class Todo < ApplicationRecord
  belongs_to :user

  #todoモデルとtodo_listsモデルは1:多
  has_many :todo_lists,class_name: 'Todolist', dependent: :destroy
  #todoモデルの更新とともに、todo_listsも更新
  accepts_nested_attributes_for :todo_lists

  #バリデーションを走らせる前に、Fromの空要素を削除
  before_validation :remove_empty_todo_lists

  #コメントテーブルを複数所持する
  has_many :comments

  validates :title, presence: true
  validates :description, presence: true

  private
  def remove_empty_todo_lists
    todo_lists.each do |todo_list|
      if todo_list.latitude.blank? && todo_list.longitude.blank? && todo_list.details.blank? && todo_list.image.blank?
        todo_list.mark_for_destruction
      end
    end
  end

end
