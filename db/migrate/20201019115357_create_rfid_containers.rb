class CreateRfidContainers < ActiveRecord::Migration[5.2]
  def change
    create_table :rfid_containers, id: false do |t|
      t.string :container_id, :primary_key => true
      t.date :entering_date
      t.date :leaving_date
      t.string :contents, null: false
      t.string :contents_size
      t.string :from_place
      t.string :to_place
      t.boolean :entering_flg, default: false, null: false
      t.timestamps
    end
    add_foreign_key :rfid_containers, :vegetables, column: :contents, primary_key: :vegetable_id
    add_foreign_key :rfid_containers, :companies, column: :from_place, primary_key: :company_id
    add_foreign_key :rfid_containers, :companies, column: :to_place, primary_key: :company_id
  end
end
