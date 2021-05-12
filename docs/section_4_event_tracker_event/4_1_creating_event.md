# How I developed my main Ruby on Rails application #


## Event Tracker - Event ##


### Creating An Event ###


#### Creating git branches ####
As always, I started off by creating a new feature branch.  
```bash
git checkout -b create-event
```

#### Creating the spec ####
The next step, as always was to create the spec.
```bash
touch spec/features/event-tracker/creating_event_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event Tracker - Creating An Event - " do
    scenario "A user creates a new event" do
        visit "/"
        click_link "Event Tracker"
        click_link "New Event"

        fill_in "Title", with: "Niklas Bergstrom's Birthday"
        fill_in "Details", with: "Niklas was born in Stockholm on 17 February 1974"
        click_button "Create Event"

        expect(page).to have_content("Event was successfully created")

        expect(current_path).to eq(event_path(Event.last.id)) 
   end

    scenario "A user fails to create a new event" do
        visit "/"
        click_link "Event Tracker"
        click_link "New Event"

        fill_in "Title", with: ""
        fill_in "Details", with: ""
        click_button "Create Event"

        expect(page).to have_content("1 error prohibited this event from being saved:")
        expect(page).to have_content("Title can't be blank")

        expect(current_path).to eq(events_path) 
   end
 end
 ```

When I ran the new test in RSpec it gave me several errors and I'll focus on the first one.
```bash
rspec spec/features/event-tracker/creating_event_spec.rb 
FF

Failures:

  1) Event Tracker - Creating An Event -  A user creates a new event
     Failure/Error: click_link "New Event"
     
     Capybara::ElementNotFound:
       Unable to find link "New Event"
```

#### Generating the model ####
The next thing I did was to generate the *Event* model using scaffolding.
```bash
rails g scaffold Event title:string details:text
```
I intentially kept it simple and I plan to add dates as well as images to the model later on. I reviewed the *migration* file before running the migration to ensure everything was as expected which it was
```bash
gedit db/migrate/20210502230055_create_events.rb
rails db:migrate
== 20210502230055 CreateEvents: migrating =====================================
-- create_table(:events)
   -> 0.0475s
== 20210502230055 CreateEvents: migrated (0.0480s) ============================
```

#### Creating the event tracker page ####
I realised that I made a mistake when I linked the event tracker app to the people index page. I want the event tracker to have it's own landing page from which I can create persons and events. To fix this I started by updating the routes file.
```bash
gedit config/routes.rb
```

```ruby
Rails.application.routes.draw do
  root to: 'pages#home'
  
  get 'home',           to: 'pages#home'
  get 'about',          to: 'pages#about'
  get 'contact',        to: 'pages#contact'
  get 'event-tracker',  to: 'pages#event_tracker'

  resources :people
  resources :events
end
```
The next thing I had to do was to add the event tracker to the pages controller.
```bash
gedit app/controllers/pages_controller.rb
```

```ruby
def event-tracker
end
```

Now I could create the event tracker page and link both the new person and new event from there.
```bash
gedit app/views/event_tracker.rb
```

```ruby
<h1>Event Tracker</h1>
<%= link_to 'New Person', new_person_path %>
<%= link_to 'New Event', new_event_path %>
<%= link_to "Home", root_path %>
```

Finally, I updated the home page to link to the event tracker page rather than the persons index page.
```bash
gedit app/views/pages/home.html.erb
```

```ruby
<%= link_to "Event Tracker", event_tracker_path %>
```

When I re-ran the test in RSpec it gave me the next error
```bash
rspec spec/features/event-tracker/creating_event_spec.rb 
.F

Failures:

  1) Event Tracker - Creating An Event -  A user fails to create a new event
     Failure/Error: expect(page).to have_content("1 error prohibited this event from being saved:")
       expected to find text "1 error prohibited this event from being saved:" in "Event was successfully created.\nTitle:\nDetails:\nEdit | Back"```bash


#### Adding data validation ####
I added the data validation to the model.
```bash
gedit app/models/event.rb
```
```ruby
class Event < ApplicationRecord
    validates :title, presence: true
end
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
git commit -m "Event Tracker - People data validation"
git checkout event-tracker
git merge create-event
git push origin event-tracker
git logline
```


----------
[<< Previous Chapter](../section_3_event_tracker_person/3_0_event_tracker_person_toc.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_3_event_tracker_person/3_2_creating_people_seeds_file.md)
