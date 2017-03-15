json.extract! voice, :id, :name, :wav, :lang, :created_at, :updated_at
json.url voice_url(voice, format: :json)