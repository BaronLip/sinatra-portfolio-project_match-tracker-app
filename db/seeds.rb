User.destroy_all
Opponent.destroy_all
Match.destroy_all

User.create(
    :username => "Baron", 
    :age => 39, 
    :gender => "male", 
    :address => "Highwood, IL", 
    :email => "baron@baron.com",
    :password => "baron" 
)

User.create(
    :username => "Scott", 
    :age => 29, 
    :gender => "male", 
    :address => "Buffalo Grove, IL", 
    :email => "scott@scott.com",
    :password => "scott"
)

Opponent.create(
    :username => "Ryan", 
    :age => 40, 
    :gender => "male", 
    :address => "Oakbrook, IL", 
    :email => "ryan@ryan.com"
)

Opponent.create(
    :username => "Leon", 
    :age => 21, 
    :gender => "male", 
    :address => "Highwood, IL", 
    :email => "leon@leon.com"
)

Opponent.create(
    :username => "Andy", 
    :age => 60, 
    :gender => "male", 
    :address => "Schaumburg, IL", 
    :email => "andy@andy.com"
)

Opponent.create(
    :username => "Das", 
    :age => 50, 
    :gender => "male", 
    :address => "Vernon Hills, IL", 
    :email => "das@das.com"
)

Opponent.create(
    :username => "Ma Long", 
    :age => 29, 
    :gender => "male", 
    :address => "China", 
    :email => "malong@malong.com"
)

Match.create(
    :date => "August 29th, 2019",
    :user_id => 1,
    :user_score => 11,
    :user_notes => "Need to work on backhand. Make sure to turn at the waist.",
    :opponent_id => 1,
    :opponent_score => 8
)