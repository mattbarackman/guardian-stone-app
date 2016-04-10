json.array!(@devices) do |device|
  json.extract! device, :id, :timestamps, :name, :particle_id
  json.url device_url(device, format: :json)
end
