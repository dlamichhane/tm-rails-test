ActiveAdmin.register Campaign do

  controller do
    def create 
      @campaign = Campaign.new(params[:campaign])
      @campaign.admin_user_id = current_admin_user.id
      
      if @campaign.valid?
        @campaign.save
  
        if check_budget?(params[:campaign][:budget])
          audit = AuditTrail.new
          audit.action = params[:action]
          audit.change_logs = {id:  @campaign.id, name: @campaign.name, budget: @campaign.budget, platforms: @campaign.platforms.collect(&:name).join(', ')}
          audit.campaign_id = @campaign.id
          audit.save!        
        end
      end

      create! do |format|
        format.html { redirect_to admin_campaigns_path }
      end
    end

    def update
      @campaign = Campaign.find(params[:id])
      @campaign.update_attributes(params[:campaign])

      if @campaign.valid?
        if check_budget?(params[:campaign][:budget])
            audit = AuditTrail.new
            audit.action = params[:action]
            audit.change_logs = {id:  @campaign.id, name: @campaign.name, budget: @campaign.budget, platforms: @campaign.platforms.collect(&:name).join(', ')}
            audit.campaign_id = @campaign.id
            audit.save! 
        end

        update! do |format|
          format.html { redirect_to admin_campaign_path }
        end
      else
        update! do |format|
          format.html { redirect_to edit_admin_campaign_path }
        end
      end
    end

    def check_budget?(amount)
      return true if amount.to_i > 1000
    end

  end

  index do
    column :id
    column :name
    column :budget
    column "Platforms" do |platform|
    	(platform.platforms.map{|p| p.name}).join(', ')
    end
    default_actions
  end

  form do |campaign|
  	campaign.inputs do
  		campaign.semantic_errors *campaign.object.errors.keys
  		campaign.input :name
  		campaign.input :budget
		  campaign.input :platforms, :as => :check_boxes, :collection => Platform.all
      campaign.actions
  	end
  end

  show do |campaign|
    attributes_table do
      row :name
      row :budget
      row "Platform" do |platform|
        (platform.platforms.map{|p| p.name}).join(', ')
      end
    end
  end
end
