class User < ApplicationRecord
  # パスワードを保存するため
  has_secure_password
  # UserモデルとTodosアプリを関連付け(削除も同期)
  has_many :todos, dependent: :destroy

  validates :name, presence: true, length: { maximum: 32 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  #コメントテーブルを複数所持する
  has_many :comments
  
  # 渡された文字列のハッシュ値を返す
  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost:)
  end
end
