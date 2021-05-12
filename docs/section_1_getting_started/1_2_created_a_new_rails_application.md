# How I developed my main Ruby on Rails application #


## Getting Started ##


### Created a New Rails Application ###
I created a new Rails application from the terminal.
```bash
rails new MainApp -T --database=postgresql
```
I was using the `-T` flag to disable the default test framework since I will be using *RSpec*. I also used *Postgres* as the database instead of the defaul *SQLite*.


#### Configured the database ####
Once the installation was complete, I changed into the new directory and started the Rails server.
```bash
cd MainApp
rails s
```

This gave me an error.
>__ActiveRecord::NoDatabaseError__: *FATAL: role "ubuntu" does not exist*

I stopped the server with `Ctrl-C` and logged into the postgres terminal and created a database user, *ubuntu*.
```bash
sudo su postgres
createuser --interactive
Enter name of role to add: ubuntu
Shall the new role be a superuser? (y/n) y
postgres@ip-172-31-1-233:/home/ubuntu/environment/BergstromDomainApp$ exit
```

I updated the __/config/db/database.yml__ file and set __username__: *ubuntu* for both the *Development* and *Test* environments and restarted the Rails server. This me another error.
> __ActiveRecord::NoDatabaseError__: *FATAL: database "BergstromDomainApp_development" does not exist*. 

I stopped the server agan and migrated the databases.
```bash
rails db:create db:migrate
Created database 'BergstromDomainApp_development'
Created database 'BergstromDomainApp_test'
```

I restarted the Rails server again and this time it started as expected.
```bash
rails s
=> Booting Puma
=> Rails 5.0.7.2 application starting in development on http://localhost:8080
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.12.6 (ruby 2.6.3-p62), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:8080
Use Ctrl-C to stop
```


#### Previewing the application in Cloud9 ####
I clicked on __Preview__ to see the application which gave me an error.
> *df0a568ad2a4456a8bde657c41186bff.vfs.cloud9.us-east-1.amazonaws.com refused to connect.*. 

The reason for this is that *Cloud9* is using port 8080 instead of port 3000 used on my local environment. To get around this, I started the server with the additional flags and then I viewed it in a separate browser. Finally, I could see the normal Rails start page.
```bash
rails s -p $PORT -b $IP
```


#### Set up version control ####
I initialised a *Git* repository.
```bash
git init
Initialized empty Git repository in /home/ubuntu/environment/BergstromDomainApp/.git/
git add .
git commit -m "Initial commit - Created the application"
git config --global user.name "Niklas Bergstrom"
git config --global user.email me.niklas@gmail.com
```


#### Configured the IDE to connect to the repository ####
From __GitHub__ I selected __Code__ and copied the code from __…or push an existing repository from the command line__
```bash
git remote add origin https://github.com/BergstromDomain/MainApp.git
git branch -M main
git push -u origin main
git remote add origin https://github.com/BergstromDomain/MainApp.git
git branch -M main
git push -u origin main
Counting objects: 83, done.
Compressing objects: 100% (69/69), done.
Writing objects: 100% (83/83), 21.51 KiB | 1.13 MiB/s, done.
Total 83 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), done.
To github.com:BergstromDomain/MainApp.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```


#### Added RSpec and Capybara ####
I update the __/Gemfile__ to include the new gems.
```ruby
group :development, :test do
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
end

group :test do
  gem 'capybara', '~> 3.35', '>= 3.35.3'
end
```

I ran the installer to get the system ready.
```bash
bundle install
rails generate rspec:install
bundle binstubs rspec-core
```


----------
[<< Previous Chapter](../section_1_getting_started/1_1_set_up_development_environment.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_2_static_pages/2_0_static_pages_toc.md)
