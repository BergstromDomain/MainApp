# How I developed my main Ruby on Rails application #


## Static Pages ##


### Created The Contact Page ###


#### Develop the test ####
I followed the same steps as before and I created the feature test.
```bash
gedit spec/features/contact_page_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Contact Page - " do
    scenario "A user navigates to the contact page" do
        visit "/"
        click_link "Contact Me"

        expect(page).to have_content("Contact Me")
        expect(page).to have_link("Home")
   end
end
```


#### Added a link to the home page ####
I added a contact link from the home page.

```ruby
<%= link_to "Contact Me", contact_path %>
```


#### Added title to the contact page ####
I updated the contact page and added a title.
```ruby
<h1>Contact Me</h1>
```


#### Added link to the home page from the contact page ####
I added a home link from the contact  page.
```ruby
<h1>Contact Me</h1>
<%= link_to "Home", root_path %>
```


#### Committed the changes ####
Before I committed any changes I made sure that all existing tests passed.
```bash
rspec spec/features/static-pages/
..

Finished in 0.4628 seconds (files took 2.44 seconds to load)
2 examples, 0 failures
```

I checked the git status before I committed my changes.
```bash
git status
git add -A
git commit -m "Static Pages - Created the contact page"
git push
```

#### Merged the changes back to the main branch ####
Once the feature branch was completed, I merged my changes into the main branch and deleted the feature branch.
```bash
git checkout main
git merge static-pages
git push origin main
```


----------
[<< Previous Chapter](../section_2_static_pages/2_1_created_the_about_page.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_3_event_tracker_person/3_0_event_tracker_person_toc.md)
