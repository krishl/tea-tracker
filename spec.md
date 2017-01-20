# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
      Used Sinatra MVC structure
- [x] Use ActiveRecord for storing information in a database
      Database table details available in db/schema.rb
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
      Using a Tea model and a User model
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
      User has_many Teas, Teas belongs_to User
- [x] Include user accounts
      Controlled by Users class
- [x] Ensure that users can't modify content created by other users
      Teas Controller verifies user id with current user's id
- [x] Include user input validations
      Included required inputs and validates presence in models
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
      Red error messages appear whenever failures occur
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
      Finished

Confirm
- [x] You have a large number of small Git commits
      46 commits and counting
- [x] Your commit messages are meaningful
      They are concise messages
- [x] You made the changes in a commit that relate to the commit message
      I committed after every major code block to make sure
- [x] You don't include changes in a commit that aren't related to the commit message
      Changes relate to the commit message
