class AddItemColumnToRoom < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :item, foreign_key: true
  end
end
