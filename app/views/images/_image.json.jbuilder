json.extract! image, :id, :user_id, :title, :caption, :price, :created_at, :updated_at
json.url image_url(image, format: :json)
