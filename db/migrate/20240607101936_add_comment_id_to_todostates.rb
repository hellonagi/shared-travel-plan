class AddCommentIdToTodostates < ActiveRecord::Migration[7.0]
  def change
    add_reference :todostates, :comment, null: false, foreign_key: true
  end
end
