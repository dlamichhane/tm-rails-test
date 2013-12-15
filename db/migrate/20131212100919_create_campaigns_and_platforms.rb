class CreateCampaignsAndPlatforms < ActiveRecord::Migration
  def up
  	create_table :campaigns_platforms, :id => false do |t|
      t.integer :campaign_id
      t.integer :platform_id
    end
  end

  def down
  	drop_table :campaigns_platforms
  end
end
