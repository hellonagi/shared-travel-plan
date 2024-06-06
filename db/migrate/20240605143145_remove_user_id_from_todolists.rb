class RemoveUserIdFromTodolists < ActiveRecord::Migration[7.0]
  def change
    remove_reference :todolists, :user, null: false, foreign_key: true
  end
end
