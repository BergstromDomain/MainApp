# Developing the BergstromDomain Rails Application  #


## Getting Started ##


### Creating A New Rails Application ###
Create a new Rails application from the terminal
```bash
rails new MainApp -T --database=postgresql
```
I'm using the `-T` flag to disable the default test framework since I will be using *RSpec* and I'm also using *Postgres* instead of the defaul *SQLite*


#### Configure the database ####
One the installation is complete, change into the new directory and start the Rails server
```bash
cd MainApp
rails s
```

This will give us an error
>__ActiveRecord::NoDatabaseError__: *FATAL: role "ubuntu" does not exist*

Stop the server with `Ctrl-C`. Create a database user, *ubuntu*
```bash
sudo su postgres
createuser --interactive
Enter name of role to add: ubuntu
Shall the new role be a superuser? (y/n) y
postgres@ip-172-31-1-233:/home/ubuntu/environment/BergstromDomainApp$ exit
```

Update the __/config/db/database.yml__ file and set __username__: *ubuntu* for both the *Development* and *Test* environments and restart the Rails server. This will give us an error
> __ActiveRecord::NoDatabaseError__: *FATAL: database "BergstromDomainApp_development" does not exist*. 

Stop the server with and migrate the databases.
```bash
rails db:create db:migrate
Created database 'BergstromDomainApp_development'
Created database 'BergstromDomainApp_test'
```

Restart the Rails server, this time it starts as expected.
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


#### Preview the application in Cloud9 ####
Click on __Preview__ to see the application which will give an error
> *df0a568ad2a4456a8bde657c41186bff.vfs.cloud9.us-east-1.amazonaws.com refused to connect.*. 

The reason for this is that *Cloud9* is using port 8080 instead of port 3000 used on your local environment. If you start the server with the additional flags and then view it in a separate browser you'll see the normal Rails start page.
```bash
rails s -p $PORT -b $IP
```


#### Setting up version control ####
Initialise a *Git* repository.
```bash
git init
Initialized empty Git repository in /home/ubuntu/environment/BergstromDomainApp/.git/
git add .
git commit -m "Initial commit - Created the application"
git config --global user.name "Niklas Bergstrom"
git config --global user.email me.niklas@gmail.com
```


#### Configure the IDE to connect to the repository ####
From __GitHub__ select __Code__ and copy the code from __…or push an existing repository from the command line__
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


#### Adding RSpec and Capybara ####
Update the __/Gemfile__ 
```ruby
group :development, :test do
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
end

group :test do
  gem 'capybara', '~> 3.35', '>= 3.35.3'
end
```

Run the installer
```bash
bundle install
rails generate rspec:install
bundle binstubs rspec-core
```


----------
[<< Previous Chapter](../section_1_getting_started/1_1_setting_up_environment.md) | [Table Of Contents](../developing_the_bergstromdomain_rails_application.md) | [Next Chapter >>](../section_2_static_pages/2_0_static_pages_toc.md)
