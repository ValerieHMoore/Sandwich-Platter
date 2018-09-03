class User < ActiveRecord::Base
    has_many :sandwiches
    has_secure_password
end
