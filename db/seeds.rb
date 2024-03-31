p = Genre.find_or_create_by(name: 'Poetry')
Collection.find_or_create_by(name: 'Poe', genre: p)
Collection.find_or_create_by(name: 'Henley', genre: p)
Collection.find_or_create_by(name: 'Thomas', genre: p)

Dir[Rails.root.join('db', 'seeds', '*.rb').to_s].each { |file| require file }
