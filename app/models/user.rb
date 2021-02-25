class User < ActiveRecord::Base
    has_many :entries
    has_many :organizers
    has_secure_password

end