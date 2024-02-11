class AddFieldsToPet < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :sex, :integer, default: 0
    add_column :pets, :castrated, :boolean
    add_column :pets, :birthday, :date
    add_column :pets, :race, :string
    add_column :pets, :specie, :string
    add_column :pets, :size, :integer
    add_column :pets, :weight, :float
    add_column :pets, :color, :string
    add_column :pets, :situation, :integer, default: 0
    add_column :pets, :observations, :text
    add_column :pets, :image_url, :string
  end
end
