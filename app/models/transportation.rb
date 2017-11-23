class Transportation < ApplicationRecord
  belongs_to :city_start, class_name: 'City', foreign_key: :city_start_id
  belongs_to :city_end, class_name: 'City', foreign_key: :city_end_id
  
  def self.get(departure, arrive, date, sort)
    dep = City.find_by name: departure
    arr = City.find_by name: arrive
    day = date.wday
    case day
    when 1
      Transportation.where(city_start_id: dep, city_end_id: arr, sunday: true).order(sort)
    when 2
      Transportation.where(city_start_id: dep, city_end_id: arr, monday: true).order(sort)
    when 3
      Transportation.where(city_start_id: dep, city_end_id: arr, tuesday: true).order(sort)
    when 4
      Transportation.where(city_start_id: dep, city_end_id: arr, wednesday: true).order(sort)
    when 5
      Transportation.where(city_start_id: dep, city_end_id: arr, thursday: true).order(sort)
    when 6
      Transportation.where(city_start_id: dep, city_end_id: arr, friday: true).order(sort)
    when 7
      Transportation.where(city_start_id: dep, city_end_id: arr, saturday: true).order(sort)
    end
  end
end
