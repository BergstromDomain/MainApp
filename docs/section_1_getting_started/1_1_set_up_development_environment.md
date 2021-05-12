# How I developed this Ruby on Rails application #


## Getting Started ##


### Set Up Development Environment ###
> I have had several failed attempts developing on Windows, using *VirtualBox*, using the *Windows Subsystem for Linux* as well as using dual boot and developing in *Ubuntu*. I've ended up spending more time getting the environments ready than working on my actual app. When I took a Ruby on Rails course from Udemy, I was introduced to *AWS Cloud9* which is what I have decided to use going forward.
>
> In this guide I have documented the steps I have taken, additional information I have learnt along the way are documented in the appendix which I intend to use as my own reference guides.


#### How I created a Cloud9 environment in AWS ####
The first thing I did was to create a Cloud9 environment in AWS. I've added some generic AWS notes in [Appendix D - AWS](../appendix_d_aws/appendix_d_0_aws_tot.md).

1. Logged in to AWS as an IAM user
  - __URL__: https://aws.amazon.com/console/
  - __IAM user name__: *Developer*
  - __Password__: *****
  - Clicked on __Sign in__
  - From the AWS Management Console I selected __Cloud9__
2. Created a new environment
  - Clicked on __Create environment__
  - Entered the __Name__: *Rails Development*
  - Clicked on __Next step__
3. Configured settings
  - Selected __Environment type__: *Create a new EC2 instance for environment (direct access)*
  - Selected __Instance type__: *t2.micro (1 GiB RAM + 1 vCPU)*
  - Selected __Platform__: *Ubuntu Server 18.04 LTS*
  - Selected __Cost-saving setting__: *After 30 minutes (default)*
  - Clicked on __Next step__
5. Reviewed
  - Clicked on __Create environment__


#### How I set up the Cloud9 environment for ruby on rails development  ####
1. In Cloud9 I opened up a new terminal and installed core packages
  ```bash
  sudo apt install curl
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update
  sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
  ```
2. Installed Ruby using Rbenv
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
3. Installed Bundler
  ```bash
  gem install bundler
  ```
4. Configured Git
  ```bash
  git config --global color.ui true
  git config --global user.name "Niklas Bergstrom"
  git config --global user.email "me.niklas@gmail.com"
  ```
5. Generated SSH keys
- Checked to see if I had any SSH keys
  ```bash
  ls -l ~/.ssh/id_*.pub
  ls: cannot access '/home/ubuntu/.ssh/id_*.pub': No such file or directory
  ```
- Generated SSH keys
  ```bash
  ssh-keygen -t rsa -b 4096 -C me.niklas@gmail.com
  ```
- Checked to see that my keys have been generated
  ```bash
  ls -l ~/.ssh/id_*.pub
  -rw-r--r-- 1 ubuntu ubuntu 745 Mar 18 10:32 /home/ubuntu/.ssh/id_rsa.pub
  ```
- Showed the keys and copied them to the clipboard
  ```bash
  less ~/.ssh/id_*.pub
  ```


#### How I set up GitHub as the source repository ####
1. Logged in to GitHub
  - __URL__: https://github.com/
  - __User name__: *me.niklas@gmail.com*
  - __Password__: *****
2. Created a new repository
  - Clicked on __New__
  - Entered __Repository name__: *MainApp*
  - Selected *Public*
  - Clicked on __Create repository__
3. Added public key from __Cloud9__
  - Copied keys from __Cloud9__
    ```bash
    less ~/.ssh/id_*.pub
    ```
4. Opened the new repository and selected __Settings >> Deploy keys__
  - Clicked on __Add deploy key__
  - Entered __Title__: *Cloud9 IDE*
  - Copied the key into the __Key__ field
  - Checked the __Allow write access__ checkbox
  - Clicked on __Add key__
5. Tested the connection
  - In __Cloud9__ typed the command
    ```bash
    ssh -T git@github.com
    The authenticity of host 'github.com (140.82.114.3)' can't be established.
    RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'github.com,140.82.114.3' (RSA) to the list of known hosts.
    Hi BergstromDomain/MainApp! You've successfully authenticated, but GitHub does not provide shell access.
    ```

#### Installed and configured ruby on rails ####
1. Installed Rails
  ```bash
  gem install rails -v 6.1.1
  rbenv rehash
  rails -v
  Rails 6.1.1
  ```
2. Set up PostgreSQL
  ```bash
  sudo apt install postgresql libpq-dev
  sudo su postgres
  createuser --interactive
  Enter name of role to add: ubuntu
  Shall the new role be a superuser? (y/n) y
  postgres@ip-172-31-1-233:/home/ubuntu/environment/MainApp$ exit
  ```


----------
[<< Previous Chapter](../section_1_getting_started/1_0_getting_started.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_1_getting_started/1_2_creating_a_new_rails_application.md)
