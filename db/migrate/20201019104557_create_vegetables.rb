class CreateVegetables < ActiveRecord::Migration[5.2]
  def change
    create_table :vegetables, id: false do |t|
      t.string :vegetable_id, :primary_key => true
      t.string :vegetable_name
      t.timestamps
    end
  end
end
