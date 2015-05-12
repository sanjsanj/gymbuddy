#Gym Buddy

[![Build Status](https://travis-ci.org/sanjsanj/gymbuddy.svg)](https://travis-ci.org/sanjsanj/gymbuddy) [![Coverage Status](https://coveralls.io/repos/sanjsanj/gymbuddy/badge.svg?branch=master)](https://coveralls.io/r/sanjsanj/gymbuddy?branch=master)

[Gym Buddy on Heroku](http://gympal.herokuapp.com)

video

screenshot

Specification:
--------------


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
  returns http success

User
  has many posts

Posts Feature
  Website on initialization
    should have no posts
    should display prompt to create new posts
  When creating a post
    it shows the post
    users who are not signed in cannot post
  When viewing a post
    it shows user profile details of post creator
  When deleting a post
    you cannot delete a post that isn't yours
    you can delete your own post

User Feature
  User signs up and makes profile
    User signs up

Website Feature
  When user not signed in
    should direct to landing page and have welcome message
    should not be able to view post details
  When user is signed in
    should direct to posts page
    should be able to view post details
    can send a message to gym buddies

15 examples, 0 failures
```

coverage ss
