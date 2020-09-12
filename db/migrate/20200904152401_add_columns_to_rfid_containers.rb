class AddColumnsToRfidContainers < ActiveRecord::Migration[5.2]
  def change
    add_column :rfid_containers, :container_id, :string
    add_column :rfid_containers, :contents_size, :string
    add_column :rfid_containers, :entering_flg, :boolean, default: false, null: false
  end
end
