json.array! @donors do |donor|
  json.name                         donor.name
  json.blood_group                  donor.blood_group
  json.country_id                   donor.country_id
  json.state_id                     donor.state_id
  json.district_id                  donor.district_id
  json.email                        donor.email
  json.avatar_url                   donor.avatar_url
  json.phone_no                     donor.phone_no
  json.phone_no_visibility          donor.phone_no_visibility
  json.avatar_file_name             donor.avatar_file_name
  json.avatar_content_type          donor.avatar_content_type
  json.avatar_file_size             donor.avatar_file_size
  json.avatar_updated_at            donor.avatar_updated_at
  json.can_receive_newsletter       donor.can_receive_newsletter
end
