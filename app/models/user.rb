class User < ApplicationRecord
	has_secure_password
	validates_uniqueness_of :email
	before_save { email.downcase! }
end
