class AddAdminUserIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :admin_user_id, :integer
  end
end
