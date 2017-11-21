class Transportation < ApplicationRecord
  belongs_to :city_start, class_name: 'City', foreign_key: :city_id
  belongs_to :city_end, class_name: 'City', foreign_key: :city_id
end
