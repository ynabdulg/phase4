json.array!(@stores) do |store|
  json.extract! store, :id, :name, :street, :zip, :city, :phone, :state, :longitude, :latitude, :active
  json.url store_url(store, format: :json)
end