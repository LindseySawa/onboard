json.array! @posts do |post|
  json.id post.id
  json.image post.image
  json.city post.city
  json.how post.how
  json.discription post.discription
  json.user_id post.user_id
  json.country_id post.country_id
end