class CreateTodostates < ActiveRecord::Migration[7.0]
  def change
    create_table :todostates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :todolist, null: false, foreign_key: true
      t.boolean :status
      t.text :comment

      t.timestamps
    end
  end
end
