# json.author do
#   json.name @message.creator.name.familiar
#   json.email_address @message.creator.email_address_with_name
#   json.url url_for(@message.creator, format: :json)
# end


# json.extract! @guest, :name, :age, :favorite_color
json.partial! @guest, partial: "/api/guests/guest", as: :guest


# json.extract! drop, :id, :body, :author_id

