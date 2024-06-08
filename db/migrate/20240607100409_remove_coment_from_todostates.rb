class RemoveComentFromTodostates < ActiveRecord::Migration[7.0]
  def change
    remove_column :todostates, :comment, :text
  end
end
