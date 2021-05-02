# How I developed my main Ruby on Rails application #


## Getting Started ##


### Creating The About Page ###


#### Develop the test ####
Create a new folder for our RSpec feature tests and create a first spec.
```bash
mkdir spec/features
gedit spec/features/about_page_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "About Page - " do
    scenario "A user navigates to the about page" do
        visit "/"
        click_link "About Me"

        expect(page).to have_content("About Me")
        expect(page).to have_link("Home")
   end
end
```

Run the new test in RSpec which will give an error
```bash
rspec spec/features/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: visit "/"

     ActionController::RoutingError:
       No route matches [GET] "/"
```


#### Generate a controller ####
Generate a __Pages__ controller to create a *home*, *an about* and a *contact* page.
```bash
rails g controller Pages home about contact
```

Update the __config/routes.rb__ file to include the new pages
```ruby
Rails.application.routes.draw do
  root to: 'pages#home'

  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
```

Re-run the test in RSpec which will give a new error
```bash
rspec spec/features/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: click_link "About Me"

     Capybara::ElementNotFound:
       Unable to find link "About Me"
```


#### Add a link to the home page ####
Add the link to the *home* page
```bash
gedit app/views/pages/home.html.erb
```

```ruby
<%= link_to "About Me", about_path %>
```

Re-run the test in RSpec which will give a new error
```bash
rspec spec/features/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: expect(page).to have_content("About Me")
       expected to find text "About Me" in "Pages#about\nFind me in app/views/pages/about.html.erb"
```


#### Add header to the about page ####
Update the *about* page and add a title
```bash
gedit app/views/pages/about.html.erb
```

```ruby
<h1>About Me</h1>
```


Re-run the test in RSpec which will give a new error
```bash
rspec spec/features/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: expect(page).to have_link("Home")
       expected to find link "Home" but there were no matches
```


#### Add link to home page from the about page ####
Update the *about* page and add a link back to the home page
```ruby
<h1>About Me</h1>
<%= link_to "Home", root_path %>
```

Re-run the test in RSpec which will now pass
```bash
rspec spec/features/about_page_spec.rb
.

Finished in 0.12668 seconds (files took 0.8928 seconds to load)
1 example, 0 failures
```


----------
[<< Previous Chapter](../section_2_static_pages/2_0_static_pages_toc.md) | [Table Of Contents](../developing_the_bergstromdomain_rails_application.md) | [Next Chapter >>](../section_2_static_pages/2_2_creating_the_contact_page.md)
