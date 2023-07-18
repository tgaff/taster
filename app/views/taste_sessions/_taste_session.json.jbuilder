json.extract! taste_session, :id, :name, :detail, :link_name, :created_at, :updated_at
json.url taste_session_url(taste_session, format: :json)
json.detail taste_session.detail.to_s
