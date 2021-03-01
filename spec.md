# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app (uses Sinatra's 7 RESTful routes and get/post/patch/delete methods)
- [x] Use ActiveRecord for storing information in a database (each migration was built with ActiveRecord)
- [x] Include more than one model class (e.g. User, Post, Category) (there is Entry, Organizer, Task, and User)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) (User has many organizers and entries)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) (Orgaanizers belong to User)
- [x] Include user accounts with unique login attribute (username or email) (User's username must be unique)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (Organizer class has those routes)
- [x] Ensure that users can't modify content created by other users (added if statement logic tto ensure that only the session's user can edit)
- [x] Include user input validations (entries and organizers cant be created unless there is a date)
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) (done with errors.full_messages)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
