# How I developed my main Ruby on Rails application #


## Static Pages ##


### Creating The Contact Page ###


#### Develop the test ####
Follow the same steps as before and create the feature test.
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



#### Add a link to the home page ####
Add the link to the *home* page

```ruby
<%= link_to "Contact Me", contact_path %>
```


#### Add header to the contact page ####
Update the *contact* page and add a title
```ruby
<h1>Contact Me</h1>
```


#### Add link to home page from the contact page ####
Update the *contact* page and add a link back to the home page
```ruby
<h1>Contact Me</h1>
<%= link_to "Home", root_path %>
```


#### Commit your changes ####
Check the git status before committing your changes
```bash
git status
git add -A
git commit -m "Created home, about and contact pages"
git push
git logline
```


----------
[<< Previous Chapter](../section_2_static_pages/2_1_creating_the_about_page.md) | [Table Of Contents](../developing_the_bergstromdomain_rails_application.md) | [Next Chapter >>](../section_3_event_tracker_person/3_0_event_tracker_person_toc.md)
