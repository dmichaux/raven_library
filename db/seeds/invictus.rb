Writing.create(
  collection: Collection.find_by(name: 'Poetry'),
  author_first: 'William',
  author_middle: 'Ernest',
  author_last: 'Henley',
  name: 'Invictus',
  published_at: Time.new(1888),
  content: <<-POEM
  Out of the night that covers me
  Black as the pit from pole to pole,
  I thank whatever gods may be
  For my unconquerable soul.
  
  In the fell clutch of circumstance,
  I have not winced nor cried aloud.
  Under the bludgeonings of chance
  My head is bloody, but unbowed.
  
  Beyond this place of wrath and tears
  Looms but the Horror of the shade,
  And yet the menace of the years
  Finds, and shall find, me unafraid.
  
  It matters not how strait the gate,
  How charged with punishments the scroll,
  I am the master of my fate
  I am the captain of my soul. 
  POEM
)
