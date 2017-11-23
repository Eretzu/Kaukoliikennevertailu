json.extract! transportation, :id, :city_start_id, :city_end_id, :service_provider, :departure_time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :traveltime, :price, :services, :created_at, :updated_at
json.url transportation_url(transportation, format: :json)
