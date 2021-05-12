# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


12.times do |person|
    Person.create!(
        first_name: "First Name #{person+1}",
        last_name: "Last Name #{person+1}",
        main_image: "http://placeimg.com/600/400/people",
        thumb_image: "http://placeimg.com/350/200/people"

        )
end

puts "12 persons created"

12.times do |event|
    Event.create!(
        title: "Name #{event+1}'s Birthday",
        details: "Name #{event+1} was born on #{event+1}-#{event+1}-#{event+2001}",
        main_image: "http://placeimg.com/600/400/nature",
        thumb_image: "http://placeimg.com/350/200/nature",
        day: "#{2*event+1}",
        month: "#{event+1}",
        year: "#{1950+5*event}"
        )
end

puts "12 birthday events created"

6.times do |event|
    Event.create!(
        title: "Name #{event+1}'s Graduation",
        details: "Name #{event+1} graduated on #{event+1}-#{event+1}-#{event+2001}",
        main_image: "http://placeimg.com/600/400/animals",
        thumb_image: "http://placeimg.com/350/200/animals",
        day: "#{2*event+1}",
        month: "#{2*event+1}",
        year: "#{1951+5*event}"
        )
end

puts "6 graduation events created"

