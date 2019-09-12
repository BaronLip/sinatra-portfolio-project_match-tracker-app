# sinatra-portfolio-project_match-tracker-app
 
### This is a match tracking app intended for table tennis.

### 

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
- New page
    * Allows User to create new Match.
        - user_score and opponent_score is limited to 21.
    * Allows User to create new Opponent.
    * Links back to Home page.
- Edit page
    * Allows User to edit existing Match.
    * Allows User to delete existing Match.
    * Links back to Home page.

### Continued improvement:
1. ~~Limit score to 21 points.~~
2. Utilize CSS to color table cells on home page.
3. ~~Create drop down menu to select from existing Opponents.~~
4. ~~Index page of all existing Matches, Match.all.~~
5. App should really track best of 5 or best of 7 matches. 
    * Include a nested params hash that includes the individual match scores.
6. ~~When creating new Match, validate Opponent is unique.~~


