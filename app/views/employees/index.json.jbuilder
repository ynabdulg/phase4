json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :street, :zip, :city, :phone, :state, :longitude, :latitude, :active
  json.url employee_url(employee, format: :json)
end