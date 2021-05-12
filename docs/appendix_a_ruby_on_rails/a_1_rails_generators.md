# How I developed my main Ruby on Rails application #


## Event Tracker - Person ##


### Creating A Person ###


#### Creating git branches ####
I started off by creating a new branch for the *Event-tracker* app. Within this branch I created a that feature branch *create-person*. 
```bash
git checkout -b event-tracker
git checkout -b create-person
```

#### Creating the spec ####
To keep my tests organised, I created a new folder for the app and I created a spec for the new feature.
```bash
mkdir spec/features/event-tracker
touch spec/features/event-tracker/creating_person_spec.rb
```

I decided to keep the first version of the test very simple but I plan to add more validations later on.
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

When I ran the new test in RSpec it gave me an error
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
The next thing I did was to generate the *Person* model using scaffolding
```bash
rails g scaffold Person first_name:string last_name:string
```

I reviewed the *migration* file before running the migration to ensure everything was as expected which it was
```bash
gedit db/migrate/20210407114922_create_people.rb
rails db:migrate
== 20210407114922 CreatePeople: migrating =====================================
-- create_table(:people)
   -> 0.0671s
== 20210407114922 CreatePeople: migrated (0.0674s) ============================
```

#### Add link from the home page ####
To solve the first error, I added a link to the *event tracker* app from the *home* page
```bash
gedit app/views/pages/home.html.erb
```

```ruby
<%= link_to "Event Tracker", people_path %>
```

When I re-ran the test in RSpec it gave me the next error
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
To solve this error, I added a link to the *event tracker* app from the *people* index page
```bash
gedit app/views/people/index.html.erb
```

```ruby
<%= link_to "Event Tracker", people_path %>
```

When I re-ran the test in RSpec it gave me the next error
```bash
rspec spec/features/event-tracker/creating_person_spec.rb
F

Failures:

  1) Event Tracker - Creating Person -  A user creates a new person
     Failure/Error: expect(page).to have_link("Home")
       expected to find link "Home" but there were no matches
```bash


#### Add link from the show page ####
To solve this error, I added a links from the *people* show page
Add the link to the *Show* page
```bash
gedit app/views/people/show.html.erb
```

```ruby
<%= link_to "Event Tracker", people_path %>
<%= link_to "Home", root_path %>
```

When I re-ran the test in RSpec it passed
```bash
rspec spec/features/event-tracker/creating_person_spec.rb


Finished in 0.42639 seconds (files took 0.89664 seconds to load)
1 example, 0 failures
```

#### Committing the changes ####
I'm making sure to commit my changes frequently and to merge my changes back to the app branch and later on to the master branch.
I've added some generic git notes in [Appendix C - Git](../appendix/appendix_c_git_tot.md).

```bash
git status
git add -A 
git commit -m "Implemented the create person functionality"
git checkout event-tracker
git merge create-person
git push origin event-tracker
git logline
```


----------
[<< Previous Chapter](../section_3_event_tracker_person/3_0_event_tracker_person_toc.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_3_event_tracker_person/3_2_creating_people_seeds_file.md)
