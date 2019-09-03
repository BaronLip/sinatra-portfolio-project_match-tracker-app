class User < ActiveRecord::Base
    has_secure_password
    
    has_many :matches
    has_many :opponents, through: :matches

    validates_presence_of :username, :email, :password_digest
    
    validates_uniqueness_of :username
end
