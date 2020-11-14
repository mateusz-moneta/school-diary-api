class User < ApplicationRecord
  has_many :class_unit
  has_secure_password
end
