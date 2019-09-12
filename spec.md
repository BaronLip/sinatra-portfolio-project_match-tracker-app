# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
    - Utilizing SQLite to store User, Match, and Opponent info.
- [x] Include more than one model class (e.g. User, Post, Category)
    - Have User, Match and Opponent classes.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - Every User has_many matches and has_many opponents through matches.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - Every Match belongs to a User and a Opponent.
- [x] Include user accounts with unique login attribute (username or email)
    - Signup for User is validated with: :username, :email, :password_digest. Matches is also validated with: date, user_score, opponent_score, and opponent_id.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - Matches can be created, read, updated and destroyed.
- [x] Ensure that users can't modify content created by other users
- [x] Include user input validations
    - Users have to be validated in order to be saved.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    - Users and Matches show flash[:errors] in case of error.
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
