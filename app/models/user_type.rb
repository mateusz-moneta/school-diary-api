class UserType < ApplicationRecord
  has_many :user
  accepts_nested_attributes_for :user
end
