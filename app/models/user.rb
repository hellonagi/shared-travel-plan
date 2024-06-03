class User < ApplicationRecord
  # パスワードを保存するため
  has_secure_password
  # UserモデルとTodosアプリを関連付け(削除も同期)
  has_many :todos, dependent: :destroy
end
