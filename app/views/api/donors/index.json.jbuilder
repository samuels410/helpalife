json.array! @donors do |donor|
  json.name                         donor.name
  json.blood_group                  donor.blood_group
  json.country_id                   donor.country_id
  json.state_name                   donor.state_name
  json.district_name                donor.district_name
  json.avatar_url                   donor.avatar_url
  if donor.phone_no_visibility
    json.phone_no                   donor.phone_no
  else
    json.phone_no                   donor.private
  end
end
