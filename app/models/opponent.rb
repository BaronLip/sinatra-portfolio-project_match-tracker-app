class Opponent < ActiveRecord::Base
    has_many :matches
    has_many :users, through: :matches

    validates_presence_of :username    
    validates_uniqueness_of :username
end
