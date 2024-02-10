class CreateHospitalizationItems < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitalization_items do |t|
      t.references :pet, null: false, foreign_key: true
      t.integer :status
      t.string :name

      t.timestamps
    end
  end
end
