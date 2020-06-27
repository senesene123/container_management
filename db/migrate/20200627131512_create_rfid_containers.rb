class CreateRfidContainers < ActiveRecord::Migration[5.2]
  def change
    create_table :rfid_containers do |t|
      t.date :entering_date
      t.date :leaving_date
      t.string :contents, null: false
      t.string :from_place
      t.string :to_place
      t.timestamps
    end
  end
end
