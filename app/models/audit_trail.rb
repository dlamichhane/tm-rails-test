class AuditTrail < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :campaign
  serialize :change_logs, Hash

end
