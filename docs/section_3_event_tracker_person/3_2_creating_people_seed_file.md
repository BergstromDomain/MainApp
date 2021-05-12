# Developing the BergstromDomain Rails Application  #


## Event Tracker - Person ##


### Creating People Seeds File ###

#### Add people to the seeds file ####
Add persons to the *seeds* file
```bash
gedit db/seeds.rb
```

```ruby
10.times do |person|
    Person.create!(
        first_name: "First Name #{person}",
        last_name: "Last Name #{person}"
        )
end

puts "10 persons created"
```

#### Populate the database with seeded data ####
Populate the database with seeded data
```bash
rails db:setup
```

----------
[<< Previous Chapter](../section_3_event_tracker_person/3_1_creating_a_person.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_3_event_tracker_person/3_3_listing_people.md)
