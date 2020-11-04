class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies, id: false do |t|
      t.string :company_id, :primary_key => true
      t.string :company_name
      t.timestamps
    end
  end
end
