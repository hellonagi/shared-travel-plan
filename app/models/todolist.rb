class Todolist < ApplicationRecord
  belongs_to :todo
  belongs_to :user
  #一つの投稿に対して、一つの画像をUPLOAD可能
  has_one_attached :image
  #画像に対するバリデーション
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: "must be a valid image format" },
                                  size:         { less_than: 5.megabytes,
                                    message:   "should be less than 5MB" }
end
