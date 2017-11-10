class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.integer :city_1_id
      t.integer :city_2_id
      t.integer :length

      t.timestamps
    end
  end
end
