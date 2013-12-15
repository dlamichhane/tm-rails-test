class Role < ActiveRecord::Base
  has_one :admin_user
  attr_accessible :name
end
