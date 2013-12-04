json.array!(@parties) do |party|
  json.extract! party, :name, :date, :location, :email, :userid, :host_id, :guest_list
  json.url party_url(party, format: :json)
end
