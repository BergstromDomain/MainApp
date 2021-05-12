# How I developed my main Ruby on Rails application #


## Getting Started ##


### Created The About Page ###
This page will eventually contain some information about me and my webpage. For now I just created the minimum to get me started.


#### Created a feature branch ####
This blog series was written mostly for myself in order to learn how to develop Rails and also to be used as a reference guide. I decided to document most of my development activities, including the version control handling.
I created a feature branch from which the static pages were developed.
```bash
git checkout -b static-pages
```


#### Developed the test ####
I create a new folder for my RSpec feature tests and I created my first spec.
```bash
mkdir spec/features
mkdir spec/features/static-pages
gedit spec/features/static-pages/about_page_spec.rb
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

I ran the new test in RSpec which gave me an error.
```bash
rspec spec/features/static-pages/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: visit "/"

     ActionController::RoutingError:
       No route matches [GET] "/"
```


#### Generated a controller ####
To solve this, I generate a __Pages__ controller and created a *home*, an *about* and a *contact* page.
```bash
rails g controller Pages home about contact
```

I updated the __config/routes.rb__ file to include the new pages.
```ruby
Rails.application.routes.draw do
  root to: 'pages#home'

  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
```

I re-ran the test in RSpec which gave me a new error.
```bash
rspec spec/features/static-pages/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: click_link "About Me"

     Capybara::ElementNotFound:
       Unable to find link "About Me"
```


#### Added a link to the home page ####
To solve this, I added an about link from the home page.
```bash
gedit app/views/pages/home.html.erb
```

```ruby
<%= link_to "About Me", about_path %>
```

I re-ran the test in RSpec which gave me a new error.
```bash
rspec spec/features/static-pages/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: expect(page).to have_content("About Me")
       expected to find text "About Me" in "Pages#about\nFind me in app/views/pages/about.html.erb"
```


#### Added title to the about page ####
To solve this, I updated the about page and added a title.
```bash
gedit app/views/pages/about.html.erb
```

```ruby
<h1>About Me</h1>
```

I re-ran the test in RSpec which gave me a new error.
```bash
rspec spec/features/static-pages/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: expect(page).to have_link("Home")
       expected to find link "Home" but there were no matches
```


#### Added link to the home page from the about page ####
To solve this, I added a home link from the about page.
```ruby
<h1>About Me</h1>
<%= link_to "Home", root_path %>
```

I re-ran the test in RSpec which now passed.
```bash
rspec spec/features/static-pages/about_page_spec.rb
.

Finished in 0.12668 seconds (files took 0.8928 seconds to load)
1 example, 0 failures
```


#### Committed the changes ####
I checked the git status before I committed my changes.
```bash
git status
git add -A
git commit -m "Static Pages - Created the home and about pages"
```


----------
[<< Previous Chapter](../section_2_static_pages/2_0_static_pages_toc.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_2_static_pages/2_2_created_the_contact_page.md)
