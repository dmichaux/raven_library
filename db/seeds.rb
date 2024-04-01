p = Genre.find_or_create_by(name: 'Poetry', published_at: Time.current)
Collection.find_or_create_by(name: 'Poe', genre: p, published_at: Time.current)
Collection.find_or_create_by(name: 'Henley', genre: p, published_at: Time.current)
Collection.find_or_create_by(name: 'Thomas', genre: p, published_at: Time.current)

Dir[Rails.root.join('db', 'seeds', '*.rb').to_s].each { |file| require file }
