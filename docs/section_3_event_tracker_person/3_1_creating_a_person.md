# Developing the BergstromDomain Rails Application  #


## Event Tracker - Person ##


### Creating A Person ###


#### Creating git branches ####
Create a new branch for the *Event-tracker* app. Within this branch create a that feature branch *create-person*. 
```bash
git checkout -b event-tracker
git checkout -b create-person
```

#### Creating spec ####
Create a new folder for the app and create a spec for the new feature.
```bash
mkdir spec/features/event-tracker
touch spec/features/event-tracker/creating_person_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event Tracker - Creating Person - " do
    scenario "A user creates a new person" do
        visit "/"
        click_link "Event Tracker"
        click_link "New person"

        fill_in "First Name", with: "James"
        fill_in "Last Name", with: " Hetfield"
        click_button "Create Person"

        expect(page).to have_content("Person has been created")
        expect(page).to have_link("Home")
   end
end
```

Run the new test in RSpec which will give an error
```bash
rspec spec/features/event-tracker/creating_person_spec.rb

rspec spec/features/event-tracker/creating_person_spec.rb
F

Failures:

  1) Event Tracker - Creating Person -  A user creates a new person
     Failure/Error: click_link "Event Tracker"

     Capybara::ElementNotFound:
       Unable to find link "Event Tracker"
```

#### Generating the model ####
Use scaffolding to generate the *Person* model
```bash
rails g scaffold Person first_name:string last_name:string
```

Review the *migration* file before running the migration
```bash
gedit db/migrate/20210407114922_create_people.rb
rails db:migrate
== 20210407114922 CreatePeople: migrating =====================================
-- create_table(:people)
   -> 0.0671s
== 20210407114922 CreatePeople: migrated (0.0674s) ============================
```

#### Add link from the home page ####
Add the link from the *home* page
```bash
gedit app/views/pages/home.html.erb
```

Re-run the test in RSpec which will give a new error
```bash
rspec spec/features/event-tracker/creating_person_spec.rb
F

Failures:

  1) Event Tracker - Creating Person -  A user creates a new person
     Failure/Error: click_link "Create new person"

     Capybara::ElementNotFound:
       Unable to find link "Create new person"
```

#### Add link from the event tracker page ####
Add the link from the *Event Tracker* page
```bash
gedit app/views/people/index.html.erb
```

```ruby
<%= link_to "Event Tracker", people_path %>
```

Re-run the test in RSpec which will give a new error
```bash
rspec spec/features/event-tracker/creating_person_spec.rb
F

Failures:

  1) Event Tracker - Creating Person -  A user creates a new person
     Failure/Error: expect(page).to have_link("Home")
       expected to find link "Home" but there were no matches
```bash



#### Add link from the show page ####
Add the link to the *Show* page
```bash
gedit app/views/people/show.html.erb
```

```ruby
<%= link_to "Event Tracker", people_path %>
<%= link_to "Home", root_path %>
```

Re-run the test in RSpec which will now pass
```bash
rspec spec/features/event-tracker/creating_person_spec.rb
.

Finished in 0.42639 seconds (files took 0.89664 seconds to load)
1 example, 0 failures
```

----------
[<< Previous Chapter](../section_3_event_tracker_person/3_0_event_tracker_person_toc.md) | [Table Of Contents](../developing_the_bergstromdomain_rails_application.md) | [Next Chapter >>](../section_3_event_tracker_person/3_2_creating_people_seeds_file.md)
