class CreateServiceOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.string :description
      t.decimal :price
      t.references :inventory_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
