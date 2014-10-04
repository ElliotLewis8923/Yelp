# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
Review.destroy_all

wimpys = Restaurant.create(name: 'wimpys', description: 'slow fast food')
wimpys.reviews.create(rating:1, thoughts:'nasty')
wimpys.reviews.create(rating:2, thoughts:'uuurh')
wimpys.reviews.create(rating:3, thoughts:'meh')
wimpys.reviews.create(rating:4, thoughts:'ooh')
wimpys.reviews.create(rating:5, thoughts:'wow')

homebase = Restaurant.create(name: 'homebase', description: 'not a restaurant')
homebase.reviews.create(rating:1, thoughts:'couldnt find any food')
homebase.reviews.create(rating:2, thoughts:'no food')
homebase.reviews.create(rating:1, thoughts:'sofas taste horrible')
homebase.reviews.create(rating:2, thoughts:'never going back')
homebase.reviews.create(rating:3, thoughts:'nice decor')