class ServiceProvider < ApplicationRecord
  has_many :serviced_routes
  has_many :routes, through: :serviced_routes
end
