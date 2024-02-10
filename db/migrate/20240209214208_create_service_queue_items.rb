class CreateServiceQueueItems < ActiveRecord::Migration[7.0]
  def change
    create_table :service_queue_items do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.string :queue_name
      t.integer :status
      t.boolean :urgency

      t.timestamps
    end
  end
end
