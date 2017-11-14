class ServicedRoute < ApplicationRecord
  belongs_to :service_provider
  belongs_to :route
end
