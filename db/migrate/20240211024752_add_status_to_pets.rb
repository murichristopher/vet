class AddStatusToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :status, :integer
  end
end
