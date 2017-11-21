class CreateTransportations < ActiveRecord::Migration[5.1]
  def change
    create_table :transportations do |t|
      t.integer :city_start
      t.integer :city_end
      t.string :service_provider
      t.time :monday
      t.time :tuesday
      t.time :wednesday
      t.time :thursday
      t.time :friday
      t.time :saturday
      t.time :sunday
      t.integer :traveltime
      t.integer :price
      t.string :services

      t.timestamps
    end
  end
end
