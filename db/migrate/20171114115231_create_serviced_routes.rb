class CreateServicedRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :serviced_routes do |t|
      t.integer :service_provider_id
      t.integer :route_id

      t.timestamps
    end
  end
end
