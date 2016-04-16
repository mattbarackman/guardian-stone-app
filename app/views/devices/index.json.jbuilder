json.array!(@devices) do |device|
  json.extract! device, :id, :name, :particle_id
  json.url device_url(device, format: :json)
end
