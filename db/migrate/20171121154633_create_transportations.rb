class CreateTransportations < ActiveRecord::Migration[5.1]
  def change
    create_table :transportations do |t|
      t.integer :city_start_id
      t.integer :city_end_id
      t.string :service_provider
      t.time :departure_time
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.integer :traveltime
      t.integer :price
      t.string :services

      t.timestamps
    end
  end
end
