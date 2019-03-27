json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :name, :street, :zip, :city, :phone, :state, :longitude, :latitude, :active
  json.url assignment_url(assignment, format: :json)
end