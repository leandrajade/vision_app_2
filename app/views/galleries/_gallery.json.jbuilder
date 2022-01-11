json.extract! gallery, :id, :title, :caption, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
