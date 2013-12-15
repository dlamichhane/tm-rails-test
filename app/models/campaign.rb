class Campaign < ActiveRecord::Base
  has_and_belongs_to_many :platforms
  belongs_to :admin_user
  has_many :audit_trails
  
  accepts_nested_attributes_for :platforms, :allow_destroy => false
  attr_accessible :name, :budget, :platfroms_attributes, :platform_ids

  validates :name, presence: true
  validates :budget, presence: true, numericality: { greater_than: 0 }
  validate :has_platforms?

  def has_platforms?
  	errors[:base] << "Campaign must have some platforms." if self.platforms.blank?
  end

  def audit_changes
      {
        :id => self.id,
        :name => self.name,
        :budget => self.budget,
        :platforms => platforms.collect(&:name).join(', ')
      }
  end
end
