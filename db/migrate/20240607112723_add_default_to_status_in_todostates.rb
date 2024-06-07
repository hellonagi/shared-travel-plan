class AddDefaultToStatusInTodostates < ActiveRecord::Migration[7.0]
  def change
    change_column_default :todostates, :status, false
  end
end
