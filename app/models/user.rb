class User < ApplicationRecord
  belongs_to :user_type, :foreign_key => 'user_type_id', :dependent => :destroy, :class_name => "UserType"
end
