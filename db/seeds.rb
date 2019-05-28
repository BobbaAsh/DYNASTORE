# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating artist...'
artists_attributes = [
  {
    name:         'Wiz Khalifa',
    genre:      'Rap',
    price:  15000,
    description:  'Rapper who made the bager "Black & Yellow"'
  },
    {
    name:         'Travis Scoot',
    genre:      'Rap',
    price:  20000,
    description:  'He released Astroworld last year'
  },
      {
    name:         'Da Baby',
    genre:      'Rap',
    price:  10000,
    description:  'Da Baby Da Baby on the pony'
  },
]
Artist.create!(artists_attributes)
