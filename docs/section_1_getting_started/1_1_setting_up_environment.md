# Developing the BergstromDomain Main Application  #

## Getting Started ##

### Setting Up Environment ###
I have had multiple failed attempts developing on Windows, using *VirtualBox*, using the *Windows Subsystem for Linux* as well as using dual boot and developing in *Ubuntu*. I've ended up spending more time getting the environments ready than working on my actual app. When I took a Ruby on Rails course from Udemy, I was introduced to __AWS Cloud9__ which is what I have decided to use going forward.


#### Creating a Cloud9 Environment in AWS ####
1. Log in to AWS as an __IAM__ user
  - __URL__: https://aws.amazon.com/console/
  - __IAM user name__: *Developer*
  - __Password__: *****
  - Click on __Sign in__
2. From __AWS Management Console__ select __Cloud9__
3. Create a new environment
  - Click on __Create environment__
  - Enter the __Name__: *Ruby on Rails - BergstromDomain*
  - Click on __Next step__
4. Configure settings
  - Select __Environment type__: *Create a new EC2 instance for environment (direct access)*
  - Select __Instance type__: *t2.micro (1 GiB RAM + 1 vCPU)*
  - Select __Platform__: *Ubuntu Server 18.04 LTS*
  - Select __Cost-saving setting__: *After 30 minutes (default)*
  - Click on __Next step__
5. Review
  - Click on __Create environment__

#### Set up the Cloud9 Environment for Ruby on Rails Development  ####
1. In Cloud9 open up a new terminal and install core packages for
  ```bash
  sudo apt install curl
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update
  sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
  ```
2. Install Ruby using Rbenv_
  ```bash
  cd
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  exec $SHELL

  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
  exec $SHELL

  rbenv install 3.0.0
  rbenv global 3.0.0
  ruby -v
  ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]
  ```
3. Install Bundler
  ```bash
  gem install bundler
  ```
4. Configure Git
  ```bash
  git config --global color.ui true
  git config --global user.name "Niklas Bergstrom"
  git config --global user.email "me.niklas@gmail.com"
  ```
5. Generate SSH keys
- Check to see if you have any SSH keys
  ```bash
  ls -l ~/.ssh/id_*.pub
  ls: cannot access '/home/ubuntu/.ssh/id_*.pub': No such file or directory
  ```
- Generate SSH keys
  ```bash
  ssh-keygen -t rsa -b 4096 -C me.niklas@gmail.com
  ```
- Check to see that your keys have been generated
  ```bash
  ls -l ~/.ssh/id_*.pub
  -rw-r--r-- 1 ubuntu ubuntu 745 Mar 18 10:32 /home/ubuntu/.ssh/id_rsa.pub
  ```
- Show the keys and copy them
  ```bash
  less ~/.ssh/id_*.pub
  ```

#### Setting Up GitHub As The Source Repository ####
1. Log in to GitHub
  - __URL__: https://github.com/
  - __User name__: *me.niklas@gmail.com*
  - __Password__: *****
2. Create a new repository
  - Click on __New__
  - Enter __Repository name__: *MainApp*
  - Select *Public*
  - Click on __Create repository__
3. Add public key from __Cloud9__
  - Copy keys from __Cloud9__
    ```bash
    less ~/.ssh/id_*.pub
    ```
4. Open the new repository and select __Settings >> Deploy keys__
  - Click on __Add deploy key__
  - Enter __Title__: *Cloud9 IDE*
  - Copy the key into the __Key__ field
  - Check the __Allow write access__ checkbox
  - Click on __Add key__
5. Test the connection
  - In __Cloud9__ type the command
    ```bash
    ssh -T git@github.com
    The authenticity of host 'github.com (140.82.114.3)' can't be established.
    RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'github.com,140.82.114.3' (RSA) to the list of known hosts.
    Hi BergstromDomain/MainApp! You've successfully authenticated, but GitHub does not provide shell access.
    ```

#### Install and Configure Ruby on Rails ####
1. Install Rails
  ```bash
  gem install rails -v 6.1.1
  rbenv rehash
  rails -v
  Rails 6.1.1
  ```
2. Setting up PostgreSQL
  ```bash
  sudo apt install postgresql libpq-dev
  sudo su postgres
  createuser --interactive
  Enter name of role to add: ubuntu
  Shall the new role be a superuser? (y/n) y
  postgres@ip-172-31-1-233:/home/ubuntu/environment/MainApp$ exit
  ```


----------
[<< Previous Chapter](../developing_the_bergstromdomain_app.md) | 
[Table Of Contents](../developing_the_bergstromdomain_app.md) | 
[Section](../developing_the_bergstromdomain_app.md) | 
[Next Chapter - Setting Up Environment >>](./section_1_getting_started/1_1_setting_up_environment.md)