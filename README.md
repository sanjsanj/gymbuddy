#Gym Buddy - A listings and contact website  
###Made with care in TDD Rails and PostgreSQL

[![Build Status](https://travis-ci.org/sanjsanj/gymbuddy.svg)](https://travis-ci.org/sanjsanj/gymbuddy)  [![Coverage Status](https://coveralls.io/repos/sanjsanj/gymbuddy/badge.svg?branch=master)](https://coveralls.io/r/sanjsanj/gymbuddy?branch=master)  [![Code Climate](https://codeclimate.com/github/sanjsanj/gymbuddy/badges/gpa.svg)](https://codeclimate.com/github/sanjsanj/gymbuddy)


###Table of contents

- [Specification](#specification)
- [What is the Gymbuddy codebase](#what-is-the-gymbuddy-codebase)
- [How to use this repo yourself](#how-to-use-this-repo-yourself)
- [User stories](#user-stories)
- [Tools](#tools)
- [Development blog](#development-blog)
- [Meet the team](#meet-the-team)
- [Tests and healthcheck](#tests-and-healthcheck)
- [What we learned](#what-we-learned)

----------


![gymbuddy screenshot](https://github.com/sanjsanj/gymbuddy/blob/master/public/landing.png?raw=true)


--------------

###Specification

Gyms are scary and much better if you have a friend there with you. But what if no one you know goes to your gym? We need a website where you can search for people who go to your gym, so you can buddy up with them. You need to be able to make and search profiles, as well as send messages to people you're interested in buddying with.

-----------------

###What is the Gymbuddy codebase

Gymbuddy is a test-driven Rails app that allows users to sign up, post listings, view listings and contact members

------------------------------

###How to use this repo yourself

WIP

-------------

###User stories

```
As a user
I want to search for a gym buddy by location
So I can find someone that wants to go to the same gym

As a user
I want to create a profile that other users can view
So they can see if we would make good buddies

As a user
I want to filter posts
So I can find ones that interest me

As a user
I want to create posts with my desired requirements
So I can find a suitable gym buddy

As a woman
I want to filter my searches by gender
So I can find an appropriate buddy

As a user
I want to edit and delete my profile
So I can reflect my current requirements

As a user
I want to receive an email when someone wants to be my gym buddy
So I can stay informed
```

------

###Tools

**Application** | **Testing** | **Styling** | **Healthcheck**  
--- | --- | --- | ---  
Rails | Rspec | HTML5 | Travis-CI  
Ruby | Capybara | CSS3 | Coveralls CC  
JQuery | Byebug | Bootstrap | Code Climate  
Devise | Shoulda | |  
Paperclip | Launchy | |  
PostgreSQL | | |  

-----------------

###Development blog

- [Day 1](http://sanjsanj.github.io/Week%209,%20Day%201/)
- [Day 2](http://sanjsanj.github.io/Week%209,%20Day%202/)


------

###Meet the team

[Caron Stace](https://github.com/Stacca)
[Milena Stoeva](https://github.com/M1lena)
[George McGowan](https://github.com/GJMcGowan)
[Sanjay Purswani](https://github.com/sanjsanj)

#####Below: Our office

![img](http://sanjsanj.github.io/images/week9-gymteam1.JPG)

#####Below: Our 'kanban board' the morning after

![img](http://sanjsanj.github.io/images/week9-kanban.JPG)

--------------

###Tests and healthcheck

```
WelcomeController
  GET #index
    returns http success

Posts
  Website on initialization
    should have no posts
    should display a prompt to create new posts
  When creating a post
    it shows the post
    users who are not signed in cannot post
  When viewing a post
    it shows user profile details of post creator
    it can filter by gender (PENDING: Temporarily disabled with xscenario)
  when deleting a post
    you cannot delete a post that isn't yours
    you can delete your own psot

User signs up and makes profile
  User signs up

Website homepage
  When user not signed in
    should direct to landing page and have welcome message
    should not be able to view post details
  When user is signed in
    should direct to posts page
    should be able to view post details
    can send a message to gym buddies

User
  should have many posts

16 examples, 0 failures
```

![coveralls screenshot](https://github.com/sanjsanj/gymbuddy/blob/master/public/week9_gb_cc.png?raw=true)

![code climate screenshot](https://github.com/sanjsanj/sanjsanj.github.io/blob/master/images/cc-gymbuddy.png?raw=true)

![code climate score](https://github.com/sanjsanj/sanjsanj.github.io/blob/master/images/cc4gpa.png?raw=true)

-------------------

###What we learned

1 - **Teamwork!**

It's enough of a challenge to pair effectively but working in small teams to hack an app together in less than 48 hours is new to all of us.  Getting our team cohesion and dynamics sorted was job one and it went great!  Major kudos to all of the team for really coming together and working our magnificent butts off.

![img](https://github.com/sanjsanj/sanjsanj.github.io/blob/master/images/week9-gymteam1.JPG?raw=true)

-------------

2 - **Kanban boards.**

We've heard of these mystical things but this was our first time actually using them and I have to admit they are very useful.

![img](https://github.com/sanjsanj/sanjsanj.github.io/blob/master/images/week9-kanban.JPG?raw=true)

---------------

3 - **Rspec and Capybara are awesome!**

It's so nice to come back to Ruby and Rspec.  Our first hurdle was how to select items from a date-picker for our tests.  We started using `select('Option', from: 'Select Box')
`from [this awesome Capybara cheatsheet](https://www.launchacademy.com/codecabulary/learn-test-driven-development/rspec/capybara-cheat-sheet).  But that didn't work out of the box.  Instead we found [this picker helper](http://markgandolfo.com/blog/2013/11/17/date-and-time-helper-with-rspec-and-capybara/) from which we got the inspiration to write our own version:

```ruby
def select_date_and_time(date, options = {})
  field = options[:from]
  select date.strftime('%Y'), :from => "post_day_1i" #year
  select date.strftime('%B'), :from => "post_day_2i" #month
  select date.strftime('%d'), :from => "post_day_3i" #day
  select date.strftime('%H'), :from => "post_time_4i" #hour
  select date.strftime('%M'), :from => "post_time_5i" #minute
end
```

----------------

4 - **ActiveRecord database issues**

We dreaded it, we prayed it wouldn't happen, but it happened.  A lot!  In the early stages of development it was easy to simply rollback migrations but once our app was further along in development we had to target migrations for destruction and recreation.  We had used `text` as our date and time data types and had to change them to their dedicated types, `time` and `date`.

From [here](http://stackoverflow.com/questions/5191405/change-a-column-type-from-date-to-datetime-during-ror-migration) we worked out these:

First rails g migrate like this:

```
rails g migration change_day_format_in_posts_table
rails g migration change_time_format_in_posts_table
```

then in the db migrate file:

```ruby
class ChangeDayFormatInPostsTable < ActiveRecord::Migration
  def change
    remove_column :posts, :day
    add_column :posts, :day, :date
  end
end
```

and

```ruby
class ChangeTimeFormatInPostsTable < ActiveRecord::Migration
  def change
    remove_column :posts, :time
    add_column :posts, :time, :time
  end
end
```

Followed, of course, by the migration to the db.

```
bin/rake db:migrate
```

-----------------

5 - **Travis-CI and Coveralls CC**

Make a .travis.yml in the root and add to it:

```
rvm: '2.2.1'
script: bundle exec rspec spec
script:
  - bundle exec bin/rake db:create
  - bundle exec bin/rake db:migrate
  - bundle exec rspec spec
```

For Coveralls CC to `spec/spech_helper.rb` at the top add:

```
require 'coveralls'
Coveralls.wear!
```

and in the `gemfile`:

```
gem 'coveralls', require: false
```

-------------

6 - **Heroku DB**

Nothing really comes to mind with the deploy, it all went pretty smoothly.  The only issues we really had were related to the DB but it was pretty straight forward.

Every few deploys we would get some errors and usually a [DB reset and migrate sorted them out](http://stackoverflow.com/questions/5450930/heroku-postgres-error-pgerror-error-relation-organizations-does-not-exist).

```
heroku run rake db:reset
heroku run rake db:migrate
```

Another awesome little trick we picked up was to run PSQL on the remote Heroku PostgreSQL database.  So unbelievable easy.

```
heroku pg:psql
```

----------

7 - **Mysteriously failing tets**

A couple of weeks after our final deploy, when we came back to updating the readme our Travis reported a failing build!

We were getting the same error for all the failing tests. In hindsight this was a really simple error but last night it took a little while to debug.

```
Failure/Error: create_post
 Capybara::ElementNotFound:
 Unable to find option "01"
```

Basically, what was happening was that a helper method of ours was selecting the present date and time to input into our form, it was looking for '01' for the date because it was the 1st, but our form deletes leading zeros, so the correct option should have been '1'.

It took some debugging with `launchy' to finally figure that out but it was pretty funny and we're sure the guys and gals at Makers will get a real good laugh out of it in the morning.

We also had to use this [strftime](http://apidock.com/ruby/DateTime/strftime) picker to get the correct expression. So, ultimately there was a bug in our testing procedure that we hadn't picked up because the dates we were testing on were double digits. We definitely feel much better prepared for a similar error in future.

Our final helper method for selecting date and time:

```
def select_date_and_time(date)
  select date.strftime('%Y'), :from => "post_day_1i" #year
  select date.strftime('%B'), :from => "post_day_2i" #month
  select date.strftime('%k'), :from => "post_day_3i" #day
  select date.strftime('%H'), :from => "post_time_4i" #hour
  select date.strftime('%M'), :from => "post_time_5i" #minute
end
```
