json.reviews @reviews.each do |review|
  json.partial! review
end
