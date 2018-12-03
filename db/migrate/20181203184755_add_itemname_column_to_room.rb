class AddItemnameColumnToRoom < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :itemname, foreign_key: true
  end
end
