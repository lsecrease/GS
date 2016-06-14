# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
50.times do |i|
  Repo.create do |repo|

    repo.title = Faker::Name.title  
    repo.stars = Faker::Number.between(1, 50)
    repo.language = Faker::Superhero.name
    repo.url = Faker::Internet.url('github.com')
    repo.user_id = Faker::Number.number(10)
    repo.username = Faker::Internet.user_name
    #person.picture = "http://api.randomuser.me/portraits/#{picture_gender}/#{i}.jpg"
  end
end