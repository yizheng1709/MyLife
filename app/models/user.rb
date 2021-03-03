class User < ActiveRecord::Base
    has_many :entries
    has_many :organizers
    has_secure_password
    validates_uniqueness_of :username
    validates_presence_of :username
end