class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :registry_code
      t.string :identification_code
      t.string :zip_code
      t.string :phone_number

      t.timestamps
    end
  end
end
