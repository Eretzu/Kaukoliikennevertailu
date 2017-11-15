class ServicedRoute < ApplicationRecord
  belongs_to :route
  belongs_to :service_provider
end
