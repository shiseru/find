class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :owner_id, index: true #useridが二つ必要なため、reference型で使えない。手動でindexをはる
      t.integer :participant_id, index: true 

      t.timestamps
    end
    #foreign keyをはるか考慮
  end
end
