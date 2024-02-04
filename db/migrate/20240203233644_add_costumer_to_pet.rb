class AddCostumerToPet < ActiveRecord::Migration[7.0]
  def change
    add_reference :pets, :customer, null: false, foreign_key: true
  end
end
