ActiveAdmin.register Platform do
  menu :priority => 2

  index do
  	column :id
  	column "Platform name", :name
  	default_actions
  end

  show do
    attributes_table do
      row :id
      row :name
    end
  end
end
