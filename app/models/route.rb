class Route < ApplicationRecord
  belongs_to :city_1, :class_name => 'City', :foreign_key => 'city_1_id'
  belongs_to :city_2, :class_name => 'City', :foreign_key => 'city_2_id'
  has_many :serviced_routes
  has_many :service_providers, through: :serviced_route
end
