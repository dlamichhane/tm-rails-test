class CreateAuditTrails < ActiveRecord::Migration
  def change
    create_table :audit_trails do |t|
      t.integer :campaign_id
      t.string :action
      t.text :change_logs
      t.timestamps
    end
  end
end
