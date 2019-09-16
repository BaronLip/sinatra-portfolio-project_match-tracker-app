# sinatra-portfolio-project_match-tracker-app
 
### This is a match tracking app intended for table tennis.

### Install:
1. Run $bundle install.
2. $ rake db:migrate.
3. $ bundle exec shotgun.
4. Navigate to "http://localhost:9393/" within browser.

### Features:
- Signup
    * Creates a User.
    * Validations are used for User creation.
    * Use of Flash in case of errors.
- Login
    * Logs User in/ creates a session.
    * User is authenticated for login.
    * Use of Flash in case of errors.
- Home/Index page
    * Shows all matches created by User.
        - Matches are shown in table format.
        - Win or Lose status is automatically determined by point values.
    * Link to created a new Match.
    * Link to edit existing Match.
    * Link to logout.
- New Match page
    * Allows User to create new Match.
        - user_score and opponent_score is limited to 21.
        - there must be a difference of 2 between scores.
    * Links back to Home page.
- Edit Match page
    * Allows User to edit existing Match and Opponent info.
        - Reminds user to select an opponent if not selected.
    * Allows User to delete existing Match.
    * Links back to Home page.
- New Opponent page
    * Allows User to create new Opponent.
        - redirects back to new match page and opponent is now added to the drop down.
    * Redirects back to Home page to showing all matches.
    

### Continued improvement/ Future features:
1. ~~Limit score to 21 points.~~
2. Utilize CSS to color table cells on home page.
3. ~~Create drop down menu to select from existing Opponents.~~
4. ~~Index page of all existing Matches, Match.all.~~
5. App should really track best of 5 or best of 7 matches. 
    * Include a nested params hash that includes the individual match scores.
6. ~~When creating new Match, validate Opponent is unique.~~
7. When editing a match, have drop down menu for opponents.
8. Tally up wins/losses and have win percentage on home page.
9. Combine Match and Opponent creation in one form.