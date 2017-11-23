class Transportation < ApplicationRecord
  belongs_to :city_start, class_name: 'City', foreign_key: :city_start_id
  belongs_to :city_end, class_name: 'City', foreign_key: :city_end_id
  
  def self.get(departure, arrive, sort)
    dep = City.find_by name: departure
    arr = City.find_by name: arrive
    
    Transportation.where(city_start_id: dep, city_end_id: arr).order(sort)
  end
end
