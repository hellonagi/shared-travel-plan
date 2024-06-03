class AddIndexToUsersName < ActiveRecord::Migration[7.0]
  def change
    # Userモデルのname項目の重複を除くため
    add_index :users, :name, unique: true
  end
end