json.extract! map_entry, :id, :name, :plz, :location, :street, :phone, :spec, :lat, :lng, :created_at, :updated_at
json.url map_entry_url(map_entry, format: :json)
