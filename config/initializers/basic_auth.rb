user, password = nil

if env_var = ENV.fetch('DB_DUMP', nil)
  user, password = env_var.split('/')
end

Rails.configuration.x.db_dump_user = user || SecureRandom.uuid
Rails.configuration.x.db_dump_pw = password || SecureRandom.uuid
