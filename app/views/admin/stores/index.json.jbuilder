json.array!(@stores) do |store|
  json.extract! store, :name, :address, :latitude, :longitude
  json.url store_url(store, format: :json)
end
