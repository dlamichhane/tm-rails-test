class AdminUser < ActiveRecord::Base 
  # before_create	:set_default_role
 
  belongs_to :role
  has_many  :campaigns

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_id

  def role?(role_name)
      return self.role.present? && self.role.name == role_name.to_s
  end

  # private
  # def set_default_role
  # 	self.role_id ||= Role.find_by_name('admin').id
  # end
end
