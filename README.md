# README

This project is from the microverse curriculum using The Odin Project
The goal was to use active record and make a small relational database with users, posts, and comments

## Setup & Use
To run the project first clone the repo:

```
git clone git@github.com:mapra99/mini-reddit.git
```

Then cd to the project folder:
```
cd mini-reddit
```

Upadte gems from the Gemfile:
```
bundle update
```

Then migrate the database:
```
rails db:migrate
```
If there are any errors for the Gemfile, then please install as said in the error messages.

Navigate through the project tables from the console:
```
rails console
```

To run all the tests:
```
rails db:migrate RAILS_ENV=test
rails test
```

## Requirements
Ruby version 2.6.4
Rails version 6.0.0
Bundler version 2.0.2

Authors: [Brham Dev Mahato](https://github.com/dev1980),  [Miguel Prada](https://github.com/mapra99)
