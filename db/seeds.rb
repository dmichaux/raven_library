Collection.find_or_create_by(name: 'Poetry')

Dir[Rails.root.join('db', 'seeds', '*.rb').to_s].each { |file| require file }
