ActiveAdmin.register AuditTrail do
	menu :label => "Audit", :priority => 11

	index do
		column "Id", :id
		column "Campaign id" do |change_log|
			change_log.change_logs[:id]
		end
		column "Campaign name" do |change_log|
			change_log.change_logs[:name]
		end
		column "Budget" do |change_log|
			change_log.change_logs[:budget]
		end
		column "Action", :action
		column "Platform" do |change_log|
			change_log.change_logs[:platforms]
		end
	end
end
