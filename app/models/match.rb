class Match < ActiveRecord::Base
    belongs_to :user
    belongs_to :opponent

    validates_presence_of :date, :user_score, :opponent_score, :opponent_id

end
