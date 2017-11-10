class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :offset_x
      t.integer :offset_y

      t.timestamps
    end
  end
end
