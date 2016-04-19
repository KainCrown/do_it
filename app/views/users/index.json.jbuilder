 json.array! @users.each do |user|
  json.id     user.id.to_s
  json.text   user.email
end
