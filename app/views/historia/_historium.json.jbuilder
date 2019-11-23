json.extract! historium, :id, :nome, :texto, :imagem, :created_at, :updated_at
json.url historium_url(historium, format: :json)
