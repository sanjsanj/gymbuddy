#Gym Buddy

[![Build Status](https://travis-ci.org/sanjsanj/gymbuddy.svg)](https://travis-ci.org/sanjsanj/gymbuddy) [![Coverage Status](https://coveralls.io/repos/sanjsanj/gymbuddy/badge.svg?branch=master)](https://coveralls.io/r/sanjsanj/gymbuddy?branch=master)

--------------

###[Gym Buddy on Heroku](http://gympal.herokuapp.com)

--------------

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/Svw4FDhcxw0/0.jpg)](http://www.youtube.com/watch?v=Svw4FDhcxw0)

--------------

![coveralls ss](https://github.com/sanjsanj/gymbuddy/blob/master/public/landing.png?raw=true)

Specification:
--------------

Make stuff!

User Stories:
-------------
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
So I can find a female buddy

As a user
I want to edit and delete my profile
So I can reflect my current requirements

As a user
I want to receive an email when someone wants to be my gym buddy
So I can stay informed
```


Tools:
------

Testing | Application | Other
--- | --- | ---
Rspec | Rails | HTML5
Capybara | Ruby | CSS3
Byebug | JQuery | Bootstrap
Shoulda | Devise | Travis-CI
 | Paperclip | Coveralls
 | PostreSQL |

Development Blog:
-----------------

- [Day 1](http://sanjsanj.github.io/Week%209,%20Day%201/)
- [Day 2](http://sanjsanj.github.io/Week%209,%20Day%202/)


Tests:
------

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

![coveralls ss](https://github.com/sanjsanj/gymbuddy/blob/master/public/week9_gb_cc.png?raw=true)

-------------------

##What we learned:

1 - **Teamwork!**

It's enough of a challenge to pair effectively but working in small teams to hack an app together in less than 48 hours is new to all of us.  Getting our team cohesion and dynamics sorted was job one and it went great!  Major kudos to all of the team for really coming together and working our magnificent butts off.

![img]()

-------------

2 - **Kanban boards.**

We've heard of these mystical things but this was our first time actually using them and I have to admit they are very useful.

![img]()

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
